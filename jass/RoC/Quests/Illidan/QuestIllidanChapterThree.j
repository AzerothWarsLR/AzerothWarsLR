//Escapes Kalimdor, Find the Skull of Guldan
library QuestIllidanChapterThree requires QuestData, QuestItemLegendReachRect, QuestItemCastSpell, LegendNaga, GlobalQuest, GeneralHelpers

   globals
    private constant integer RITUAL_ID = 'A0KY'
  endglobals
 
  struct QuestIllidanChapterThree extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "伊利丹必须唤醒来自海洋深处的娜迦"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得纳沙塔尔和娜迦的忠诚"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetUnitOwner(gg_unit_o01I_1505, this.Holder.Player, true)
      call FACTION_NAGA.AddQuest(REDEMPTION_PATH)
      set REDEMPTION_PATH.Progress = QUEST_PROGRESS_UNDISCOVERED
      call FACTION_NAGA.AddQuest(EXILE_PATH)
      set EXILE_PATH.Progress = QUEST_PROGRESS_UNDISCOVERED
      call FACTION_NAGA.AddQuest(CONQUER_BLACK_TEMPLE)
      set CONQUER_BLACK_TEMPLE.Progress = QUEST_PROGRESS_UNDISCOVERED
      call FACTION_NAGA.AddQuest(KILL_FROZEN_THRONE)
      set KILL_FROZEN_THRONE.Progress = QUEST_PROGRESS_UNDISCOVERED

      call FACTION_NAGA.AddQuest(CHANNEL_EYE)
      set CHANNEL_EYE.Progress = QUEST_PROGRESS_UNDISCOVERED
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("第三章：深海居民", "唤醒娜迦将给伊利丹提供能够实现他目标所需的军队", "ReplaceableTextures\\CommandButtons\\BTNNagaMyrmidon.blp")
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_ILLIDAN, gg_rct_StartQuest3, "出口"))
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_ILLIDAN, gg_rct_MaelstromAmbient, "大漩涡"))
      call this.AddQuestItem(QuestItemCastSpell.create(RITUAL_ID, true))
      return this
    endmethod
  endstruct

endlibrary  