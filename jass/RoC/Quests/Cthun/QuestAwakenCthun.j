library QuestAwakenCthun requires QuestData, QuestItemChannelRect

  globals
    private constant integer QUEST_RESEARCH_ID = 'R06A'   //This research is given when the quest is completed
  endglobals

  struct QuestAwakenCthun extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "疯狂与混乱之古神克苏恩已经从沉睡中醒来。艾泽拉斯本身都将在恐惧中退缩，皆因这个深不可测的邪恶生物将在千年之后第一次释放祂独特的凝视。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得克苏恩并允许训练黄蜂单位。" //Todo: from where?
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetUnitInvulnerable(gg_unit_U00R_0609, false)
      call PauseUnitBJ(false, gg_unit_U00R_0609) //Todo: no point using the BJ
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("克苏恩的苏醒", "古神克苏恩仍在沉睡之中，斯克拉姆需要用一个邪恶的仪式唤醒祂。", "ReplaceableTextures\\CommandButtons\\BTNCthunIcon.blp")
      call this.AddQuestItem(QuestItemChannelRect.create(gg_rct_CthunSummon, "克苏恩", LEGEND_SKERAM, 420, 270))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary