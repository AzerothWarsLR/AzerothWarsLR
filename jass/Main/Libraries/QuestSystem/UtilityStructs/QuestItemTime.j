library QuestItemTime requires QuestItemData, Persons

  struct QuestItemTime extends QuestItemData
    private timer timer

    private static Table byTimer
    private static integer count = 0
    private static thistype array byIndex

    private method OnExpire takes nothing returns nothing
      call DestroyTimer(this.timer)
      set this.Progress = QUEST_PROGRESS_COMPLETE
    endmethod

    private static method OnAnyTimerExpires takes nothing returns nothing
      if thistype.byTimer[GetHandleId(GetExpiredTimer())] != 0 then
        call QuestItemTime(thistype.byTimer[GetHandleId(GetExpiredTimer())]).OnExpire()
      endif
    endmethod

    static method create takes integer duration returns thistype
      local thistype this = thistype.allocate()
      set this.Description = I2S(duration) + "秒已过"
      set this.timer = CreateTimer()
      call TimerStart(this.timer, duration, false, function thistype.OnAnyTimerExpires)
      set thistype.byTimer[GetHandleId(this.timer)] = this
      set thistype.byIndex[thistype.count] = this
      set thistype.count = thistype.count + 1
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      set thistype.byTimer = Table.create()
    endmethod
  endstruct

endlibrary