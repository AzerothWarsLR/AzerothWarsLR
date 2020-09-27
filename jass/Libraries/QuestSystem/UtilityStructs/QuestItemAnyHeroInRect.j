library QuestItemAnyHeroInRect requires QuestItemData

  struct QuestItemAnyHeroInRect extends QuestItemData
    private static trigger entersRectTrig = CreateTrigger()
    private static trigger exitsRectTrig = CreateTrigger()
    private static thistype array byHandleId
    private rect targetRect = null

    method operator X takes nothing returns real
      return GetRectCenterX(this.targetRect)
    endmethod

    method operator Y takes nothing returns real
      return GetRectCenterY(this.targetRect)
    endmethod

    private method OnRectEnter takes unit enteringUnit returns nothing
      if IsUnitType(enteringUnit, UNIT_TYPE_HERO) then
        set this.Progress = QUEST_PROGRESS_COMPLETE
      endif
    endmethod

    private method OnRectExit takes unit exitingUnit returns nothing

    endmethod

    private static method OnAnyRectEnter takes nothing returns nothing
      call thistype.byHandleId[GetTriggeringRegion()].OnRectEnter(GetEnteringUnit())
    endmethod

    private static method OnAnyRectExit takes nothing returns nothing
      call thistype.byHandleId[GetTriggeringRegion()].OnRectExit(GetLeavingUnit())
    endmethod

    static method create takes rect targetRect, string rectName returns thistype
      local thistype this = thistype.allocate()
      local trigger trig = CreateTrigger()
      call TriggerRegisterGameEvent(thistype.entersRectTrig, EVENT_GAME_ENTER_REGION) 
      call TriggerRegisterGameEvent(thistype.exitsRectTrig, EVENT_GAME_LEAVE_REGION) 
      call TriggerAddAction(thistype.entersRectTrig, function thistype.OnAnyRectEnter)
      call TriggerAddAction(thistype.exitsRectTrig, function thistype.OnAnyRectExit)
      set this.Description = "You have a hero at " + rectName
      set this.targetRect = targetRect
      set thistype.byHandleId[GetHandleId(targetRect)] = this
      return this
    endmethod

  endstruct

endlibrary