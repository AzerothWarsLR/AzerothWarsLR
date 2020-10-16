library QuestItemEitherOf requires QuestItemData

  struct QuestItemEitherOf extends QuestItemData
    static method create takes QuestItemData questItemA, QuestItemData questItemB returns thistype
      local thistype this = thistype.allocate()
      set this.Description = questItemA.Description + " or " + questItemB.Description
      return this
    endmethod

    private static method OnAnyQuestItemProgressChanged takes nothing returns nothing
      call QuestItemData.TriggerQuestItemData.Parent.OnQuestItemProgressChanged()
    endmethod

    private static method onInit takes nothing returns nothing
      local trigger trig = CreateTrigger()
      call QuestItemData.ProgressChanged.register(trig)
      call TriggerAddAction(trig, function thistype.OnAnyQuestItemProgressChanged)
    endmethod
  endstruct

endlibrary