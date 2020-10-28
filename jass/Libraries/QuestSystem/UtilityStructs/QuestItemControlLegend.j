library QuestItemControlLegend initializer OnInit requires QuestItemData, Legend

  struct QuestItemControlLegend extends QuestItemData
    private Legend target = 0
    private static integer count = 0
    private static thistype array byIndex
    private boolean canFail

    method operator X takes nothing returns real
      if IsUnitType(target.Unit, UNIT_TYPE_STRUCTURE) or GetOwningPlayer(target.Unit) == Player(PLAYER_NEUTRAL_AGGRESSIVE) then
        return GetUnitX(target.Unit)
      endif
      return 0.
    endmethod

    method operator Y takes nothing returns real
      if IsUnitType(target.Unit, UNIT_TYPE_STRUCTURE) or GetOwningPlayer(target.Unit) == Player(PLAYER_NEUTRAL_AGGRESSIVE) then
        return GetUnitY(target.Unit)
      endif
      return 0.
    endmethod

    private method OnAdd takes nothing returns nothing
      if this.Holder.Team.ContainsFaction(target.OwningFaction) then
        set this.Progress = QUEST_PROGRESS_COMPLETE
      endif
    endmethod

    private method OnTargetChangeOwner takes nothing returns nothing
      if this.Holder.Team.ContainsFaction(target.OwningFaction) then
        set this.Progress = QUEST_PROGRESS_COMPLETE
      else
        if this.canFail then
          set this.Progress = QUEST_PROGRESS_COMPLETE
        else
          set this.Progress = QUEST_PROGRESS_INCOMPLETE
        endif
      endif
    endmethod

    public static method OnAnyLegendChangeOwner takes nothing returns nothing
      local integer i = 0
      local thistype loopItem
      loop
        exitwhen i == thistype.count
        set loopItem = thistype.byIndex[i]
        if loopItem.target == GetTriggerLegend() then
          call loopItem.OnTargetChangeOwner()
        endif
        set i = i + 1
      endloop
    endmethod

    static method create takes Legend target, boolean canFail returns thistype
      local thistype this = thistype.allocate()
      set this.target = target
      set this.Description = "Your team controls " + target.Name
      set this.canFail = canFail
      set thistype.byIndex[thistype.count] = this
      set thistype.count = thistype.count + 1
      return this
    endmethod

  endstruct

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call OnLegendChangeOwner.register(trig) 
    call TriggerAddAction(trig, function QuestItemControlLegend.OnAnyLegendChangeOwner)
  endfunction  

endlibrary