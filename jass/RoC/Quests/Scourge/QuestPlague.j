library QuestPlague requires QuestData, ScourgeSetup

  globals
    private constant integer RESEARCH_ID = 'R06I'
    private constant integer QUEST_RESEARCH_ID = 'R009'
  endglobals

  struct QuestPlague extends QuestData
    private method Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "The plague has been unleashed! The citizens of Lordaeron are quickly transforming into mindless zombies."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "A plague is unleashed upon the lands of Lordaeron"
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.Holder.ModObjectLimit(RESEARCH_ID, -UNLIMITED)
      call SetUnitInvulnerable( gg_unit_n035_1269, false )
      call TriggerExecute( gg_trg_Plague_Actions )
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Plague of Undeath", "You can unleash a devastating zombifying plague across the lands of Lordaeron. Once it's started, you can type -off to deactivate Cauldron Zombie spawns. Type -end to stop citizens from turning into zombies.", "ReplaceableTextures\\CommandButtons\\BTNPlagueBarrel.blp")
      call this.AddQuestItem(QuestItemEitherOf.create(QuestItemResearch.create(RESEARCH_ID, 'u000'), QuestItemTime.create(900)))
      call this.AddQuestItem(QuestItemTime.create(720))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary