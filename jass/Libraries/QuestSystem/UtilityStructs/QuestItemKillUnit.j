library QuestItemKillUnit requires QuestItemData, Event

  struct QuestItemKillUnit extends QuestItemData
    private static group targets = CreateGroup()
    private unit target = null
    private static integer count = 0
    private static thistype array byIndex

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
      if GetOwningPlayer(GetKillingUnit()) == this.Holder.Player then
        set this.Progress = QUEST_PROGRESS_COMPLETE
      else
        set this.Progress = QUEST_PROGRESS_FAILED
      endif
    endmethod

    private static method OnAnyUnitDeath takes nothing returns nothing
      local integer i = 0
      local thistype loopItem
      loop
        exitwhen i == thistype.count
        set loopItem = thistype.byIndex[i]
        if loopItem.target == GetTriggerUnit() then
          call loopItem.OnUnitDeath()
        endif
        set i = i + 1
      endloop
    endmethod

    static method create takes unit unitToKill returns thistype
      local thistype this = thistype.allocate()
      local trigger trig = CreateTrigger()
      call TriggerRegisterUnitEvent(trig, unitToKill, EVENT_UNIT_DEATH)    
      call TriggerAddAction(trig, function thistype.OnAnyUnitDeath)
      set this.Description = "Kill " + GetUnitName(unitToKill)
      set this.target = unitToKill
      call GroupAddUnit(thistype.targets, unitToKill)
      set thistype.byIndex[thistype.count] = this
      set thistype.count = thistype.count + 1
      return this
    endmethod

  endstruct

endlibrary