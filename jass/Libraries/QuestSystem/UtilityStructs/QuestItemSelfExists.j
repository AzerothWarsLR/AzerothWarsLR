library QuestItemSelfExists requires QuestItemData, Persons

  struct QuestItemSelfExists extends QuestItemData
    private static integer count = 0
    private static thistype array byIndex

    private static method OnAnyPersonFactionChange takes nothing returns nothing
      local integer i = 0
      if GetTriggerPerson().Faction == 0 then
        loop
          exitwhen i == thistype.count
          if thistype.byIndex[i].Holder == GetTriggerPerson().Faction then
            set thistype.byIndex[i].Progress = QUEST_PROGRESS_FAILED
          endif
          set i = i + 1
        endloop
      endif
    endmethod

    static method create takes nothing returns thistype
      local thistype this = thistype.allocate()
      set thistype.byIndex[thistype.count] = this
      set thistype.count = thistype.count + 1
      set this.Progress = QUEST_PROGRESS_COMPLETE
      set this.Description = "You exist"
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      local trigger trig = CreateTrigger()
      call OnPersonFactionChange.register(trig) 
      call TriggerAddAction(trig, function thistype.OnAnyPersonFactionChange)
    endmethod
  endstruct

endlibrary