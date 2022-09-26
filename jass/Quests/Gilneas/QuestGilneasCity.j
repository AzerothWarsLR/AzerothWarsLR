library QuestGilneasCity requires QuestData

  globals
    private constant integer RESEARCH_ID = 'R02R'
  endglobals

  struct QuestGilneasCity extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Every worgen has been eliminated, the curse is lifting!"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "gain control of the Greymann wall and Gilneas City"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_GilneasUnlock5, Player(PLAYER_NEUTRAL_AGGRESSIVE))
      call RescueNeutralUnitsInRect(gg_rct_GilneasUnlock6, Player(PLAYER_NEUTRAL_AGGRESSIVE))
      call RemoveUnit(gg_unit_o05Q_2212)
      call RemoveUnit(gg_unit_o05Q_2234)
    endmethod

    private method OnComplete takes nothing returns nothing
      call Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
      call RescueNeutralUnitsInRect(gg_rct_GilneasUnlock5, this.Holder.Player)
      call RescueNeutralUnitsInRect(gg_rct_GilneasUnlock6, this.Holder.Player)
      call SetUnitInvulnerable(gg_unit_o05Q_2234, true)
      call SetUnitInvulnerable(gg_unit_o05Q_2212, true)
      if GetLocalPlayer() == this.Holder.Player then
        call PlayThematicMusicBJ( "war3mapImported\\GilneasTheme1.mp3" )
      endif
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Liberation of Gilneas", "Gilneas has been under the curse of the Worgen. Eliminate all of them to free Gilneas of the curse", "ReplaceableTextures\\CommandButtons\\BTNGilneasCathedral.blp")
      call this.AddQuestItem(QuestItemKillXUnit.create('o02J', 11))
      call this.AddQuestItem(QuestItemKillXUnit.create('O038', 4))
      call this.AddQuestItem(QuestItemUpgrade.create('h02C', 'h01R'))
      call this.AddQuestItem(QuestItemExpire.create(1380))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary