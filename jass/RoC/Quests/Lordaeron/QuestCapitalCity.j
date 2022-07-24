library QuestCapitalCity requires QuestData, LordaeronSetup, QuestItemControlPoint, QuestItemExpire, QuestItemSelfExists, GeneralHelpers

  globals
    private constant integer RESEARCH_ID = 'R04Y'   //This research is given when the quest is completed
  endglobals

  struct QuestCapitalCity extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "首都已经被解放，其军队现在可以自由协助" + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得首都内所有单位和建筑"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_Terenas, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_Terenas, this.Holder.Player)
      call SetUnitInvulnerable(gg_unit_nemi_0019, true)
      if GetLocalPlayer() == this.Holder.Player then
        call PlayThematicMusicBJ("war3mapImported\\CapitalCity.mp3")
      endif
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("心脏地带", "洛丹伦的领土支离破碎。重新控制旧联盟的领土来确保王国的安全。", "ReplaceableTextures\\CommandButtons\\BTNCastle.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_CAERDARROW, false))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01M')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01C')))
      call this.AddQuestItem(QuestItemExpire.create(1472))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary