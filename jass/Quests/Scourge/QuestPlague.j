library QuestPlague requires QuestData, ScourgeConfig

  struct QuestPlague extends QuestData
    private method Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "The plague has been unleashed! The citizens of Lordaeron are quickly transforming into mindless zombies."
    endmethod

    private method OnComplete takes nothing returns nothing
      call TriggerExecute( gg_trg_Plague_Actions )
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Plague of Undeath", "From turn 5, you can type -plague to unleash a devastating zombifying plague across the lands of Lordaeron. Once it's started, you can type -off to deactivate Cauldron Zombie spawns. Type -end to stop citizens from turning into zombies.", "ReplaceableTextures\\CommandButtons\\BTNPlagueCloud.blp")
      call this.AddQuestItem(QuestItemEitherOf.create(QuestItemTime.create(660), QuestItemCommand.create("-plague")))
      call this.AddQuestItem(QuestItemTime.create(360))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_SCOURGE.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary