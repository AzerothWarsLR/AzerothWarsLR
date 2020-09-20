library QuestItemKillUnit requires QuestItemData

  struct QuestItemKillUnit extends QuestItemData
    private static trigger unitDies = CreateTrigger()
    private static thistype array byHandleId
    private unit target = null

    method operator X takes nothing returns real
      return GetUnitX(target)
    endmethod

    method operator Y takes nothing returns real
      return GetUnitY(target)
    endmethod

    private static method OnUnitDeath takes nothing returns nothing
      if this.Holder.Team.ContainsFaction(Person.ByHandle.GetOwningPlayer(GetKillingUnit()).Faction)
        set thistype.byHandleId[GetHandleId(GetTriggerUnit())].Progress = QUEST_PROGRESS_COMPLETE
      else
        set thistype.byHandleId[GetHandleId(GetTriggerUnit())].Progress = QUEST_PROGRESS_FAILED
      endif
    endmethod

    static method create takes unit unitToKill returns nothing
      local thistype this = thistype.allocate()
      local trigger trig = CreateTrigger()
      call TriggerRegisterUnitEvent(trig, unitToKill, EVENT_UNIT_DEATH)    
      call TriggerAddAction(trig, function thistype.OnUnitDeath)
      set this.desc = GetUnitName(unitToKill) + " is dead"
      set this.target = unitToKill
      set thistype.byHandleId[GetHandleId(unitToKill)] = this
      return this
    endmethod

  endstruct

endlibrary