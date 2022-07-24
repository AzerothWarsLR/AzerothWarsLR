library QuestEndlessRanks requires QuestData, QuestItemKillUnit

  globals
    private constant integer QUEST_RESEARCH_ID = 'R07D'   //This research is given when the quest is completed
  endglobals

  struct QuestEndlessRanks extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "安其拉之门现在可以被开启。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "安其拉之门现在可以被开启。"
    endmethod


    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("无尽之军", "在打开安其拉之门前，克苏恩需要有铺天盖地的其拉虫人军队。", "ReplaceableTextures\\CommandButtons\\BTNSwarm.blp")
      call this.AddQuestItem(QuestItemTrain.create('n06I','o00R', 24))
      call this.AddQuestItem(QuestItemTrain.create('u013','o00R', 6))
      call this.AddQuestItem(QuestItemTrain.create('o02N', 'u01H', 24))
      call this.AddQuestItem(QuestItemTrain.create('n05V', 'u01G', 12))
      call this.AddQuestItem(QuestItemTrain.create('n060', 'u01G', 12))
      call this.AddQuestItem(QuestItemTrain.create('h01K','u01H', 8))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary