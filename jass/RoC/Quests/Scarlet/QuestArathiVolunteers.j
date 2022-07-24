library QuestArathiVolunteers requires QuestData, ScarletSetup, QuestItemKillUnit

  globals
    private constant integer QUEST_RESEARCH_ID = 'R089'
  endglobals

  struct QuestArathiVolunteers extends QuestData
    private method operator CompletionPopup takes nothing returns string
      //Todo: what fight, flavour wise? Is it the Third War?
      return "阿拉希人已经被说服并加入了战斗"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "允许训练弓骑兵"
    endmethod

    public static method create takes nothing returns thistype
      //Todo: what fight, flavour wise? Is it the Third War?
      local thistype this = thistype.allocate("阿拉希志愿军", "激流堡的人民应该加入我们的战斗", "ReplaceableTextures\\CommandButtons\\BTNNobbyMansionCastle.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01K')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01Z')))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary