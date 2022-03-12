library QuestDrakUnlock requires QuestData, ScourgeSetup, QuestItemControlPoint, QuestItemExpire, QuestItemSelfExists, GeneralHelpers

  globals
    private constant integer QUEST_RESEARCH_ID = 'R08J'
  endglobals


  struct QuestDrakUnlock extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Drak'taron Keep is now under the control of the Scourge."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all buildings in Drak'taron Keep'"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_DrakUnlock, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_DrakUnlock, this.Holder.Player)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Drak'taron Keep", "Drak'taron's Keep will be the place for an outpost by the sea.", "ReplaceableTextures\\CommandButtons\\BTNUndeadShipyard.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n030')))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_DRAKTHARONKEEP, false))
      call this.AddQuestItem(QuestItemExpire.create(1140))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary