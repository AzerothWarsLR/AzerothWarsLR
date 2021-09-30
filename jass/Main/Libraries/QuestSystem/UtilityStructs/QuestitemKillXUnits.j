library QuestItemKillXUnit requires QuestItemData

  struct QuestItemKillXUnit extends QuestItemData
    private static integer count = 0
    private static thistype array byIndex
    private integer objectId
    private integer currentKillXUnitCount
    private integer targetKillXUnitCount

    private method operator CurrentKillXUnitCount= takes integer value returns nothing
      set this.currentKillXUnitCount = value
      set this.Description = "Kill " + GetObjectName(objectId) + "s (" + I2S(currentKillXUnitCount) + "/" + I2S(targetKillXUnitCount) + ")"
    endmethod

    static method create takes integer objectId, integer targetKillXUnitCount returns thistype
      local thistype this = thistype.allocate()
      set this.objectId = objectId
      set thistype.byIndex[thistype.count] = this
      set thistype.count = thistype.count + 1
      set this.CurrentKillXUnitCount = 0
      set this.targetKillXUnitCount = targetKillXUnitCount
      set this.Description = "Kill " + I2S(targetKillXUnitCount) + " " + GetObjectName(objectId)
      return this
    endmethod

    private static method OnAnyKillXUnit takes nothing returns nothing
      local integer i = 0
      local thistype loopQuestItem
      local unit triggerUnit = GetDyingUnit()
      loop
        exitwhen i == thistype.count
        set loopQuestItem = thistype.byIndex[i]
        if not loopQuestItem.ProgressLocked and loopQuestItem.objectId == GetUnitTypeId(triggerUnit) then
          set loopQuestItem.CurrentKillXUnitCount = loopQuestItem.currentKillXUnitCount + 1
          if loopQuestItem.currentKillXUnitCount == loopQuestItem.targetKillXUnitCount then
            set loopQuestItem.Progress = QUEST_PROGRESS_COMPLETE
          endif
        endif
        set i = i + 1
      endloop
    endmethod

    private static method onInit takes nothing returns nothing
      call PlayerUnitEventAddAction(EVENT_PLAYER_UNIT_DEATH , function thistype.OnAnyKillXUnit) //TODO: use filtered events
    endmethod
  endstruct

endlibrary