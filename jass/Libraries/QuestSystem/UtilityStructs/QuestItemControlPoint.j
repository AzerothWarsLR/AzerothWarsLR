library QuestItemControlPoint initializer OnInit requires QuestItemData, ControlPoint

  struct QuestItemControlPoint extends QuestItemData
    private static trigger unitDies = CreateTrigger()
    private ControlPoint target = 0
    private static integer count = 0
    private static thistype array byIndex

    method operator X takes nothing returns real
      return GetUnitX(target.Unit)
    endmethod

    method operator Y takes nothing returns real
      return GetUnitY(target.Unit)
    endmethod

    private method OnTargetChangeOwner takes nothing returns nothing
      if this.Holder.Team.ContainsPlayer(GetOwningPlayer(target.Unit)) then
        set this.Progress = QUEST_PROGRESS_COMPLETE
      else
        set this.Progress = QUEST_PROGRESS_INCOMPLETE
      endif
    endmethod

    public static method OnAnyControlPointChangeOwner takes nothing returns nothing
      local integer i = 0
      local thistype loopItem
      loop
        exitwhen i == thistype.count
        set loopItem = thistype.byIndex[i]
        if loopItem.target == GetTriggerControlPoint() then
          call loopItem.OnTargetChangeOwner()
        endif
        set i = i + 1
      endloop
    endmethod

    static method create takes ControlPoint target returns thistype
      local thistype this = thistype.allocate()
      set this.target = target
      set this.Description = "You control " + target.Name
      set thistype.byIndex[thistype.count] = this
      set thistype.count = thistype.count + 1
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call OnControlPointOwnerChange.register(trig) 
    call TriggerAddAction(trig, function QuestItemControlPoint.OnAnyControlPointChangeOwner)
  endfunction

endlibrary