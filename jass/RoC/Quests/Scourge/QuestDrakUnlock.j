library QuestDrakUnlock requires QuestData, ScourgeSetup, QuestItemControlPoint, QuestItemExpire, QuestItemSelfExists, GeneralHelpers

  globals
    private constant integer QUEST_RESEARCH_ID = 'R08J'
  endglobals


  struct QuestDrakUnlock extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "达克萨隆要塞现在在天灾军团的控制之下。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得达克萨隆要塞的所有单位和建筑"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_DrakUnlock, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_DrakUnlock, this.Holder.Player)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("达克萨隆要塞", "达克萨隆要塞将是一个海边的前哨基地。", "ReplaceableTextures\\CommandButtons\\BTNUndeadShipyard.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n030')))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_DRAKTHARONKEEP, false))
      call this.AddQuestItem(QuestItemExpire.create(1140))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary