library QuestItemControlLegend requires QuestItemData, Legend

  struct QuestItemControlLegend extends QuestItemData
    private Legend target = 0
    private static integer count = 0
    private static thistype array byIndex

    method operator X takes nothing returns real
      return GetUnitX(target.Unit)
    endmethod

    method operator Y takes nothing returns real
      return GetUnitY(target.Unit)
    endmethod

    private method OnTargetChangeOwner takes nothing returns nothing
      if this.Holder.Team.ContainsFaction(target.OwningFaction) then
        set this.Progress = QUEST_PROGRESS_COMPLETE
      else
        set this.Progress = QUEST_PROGRESS_INCOMPLETE
      endif
    endmethod

    private static method OnAnyLegendChangeOwner takes nothing returns nothing
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

    static method create takes Legend target returns thistype
      local thistype this = thistype.allocate()
      local trigger trig = CreateTrigger()
      set this.target = target
      call OnLegendChangeOwner.register(trig) 
      call TriggerAddAction(trig, function thistype.OnAnyLegendChangeOwner)
      set this.Description = "Your team controls " + target.Name
      set thistype.byIndex[thistype.count] = this
      set thistype.count = thistype.count + 1
      return this
    endmethod

  endstruct

endlibrary