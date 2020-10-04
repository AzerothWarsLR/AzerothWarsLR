library QuestItemKillUnit requires QuestItemData

  struct QuestItemKillUnit extends QuestItemData
    private static thistype array byHandleId
    private unit target = null

    method operator X takes nothing returns real
      return GetUnitX(target)
    endmethod

    method operator Y takes nothing returns real
      return GetUnitY(target)
    endmethod

    method operator Target takes nothing returns unit
      return this.target
    endmethod

    private method OnUnitDeath takes nothing returns nothing
      if this.Holder.Team.ContainsFaction(Person.ByHandle(GetOwningPlayer(GetKillingUnit())).Faction) then
        set thistype.byHandleId[GetHandleId(GetTriggerUnit())].Progress = QUEST_PROGRESS_COMPLETE
      else
        set thistype.byHandleId[GetHandleId(GetTriggerUnit())].Progress = QUEST_PROGRESS_FAILED
      endif
    endmethod

    private static method OnAnyUnitDeath takes nothing returns nothing
      call thistype.byHandleId[GetHandleId(GetTriggerUnit())].OnUnitDeath()
    endmethod

    static method create takes unit unitToKill returns thistype
      local thistype this = thistype.allocate()
      local trigger trig = CreateTrigger()
      call TriggerRegisterUnitEvent(trig, unitToKill, EVENT_UNIT_DEATH)    
      call TriggerAddAction(trig, function thistype.OnAnyUnitDeath)
      set this.Description = "You have killed " + GetUnitName(unitToKill)
      set this.target = unitToKill
      set thistype.byHandleId[GetHandleId(unitToKill)] = this
      return this
    endmethod

  endstruct

endlibrary