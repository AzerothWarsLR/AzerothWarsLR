library QuestScholomanceBuild requires QuestData

  globals
    private constant integer QUEST_RESEARCH_ID = 'R04Z'   //This research is given when the quest is completed
  endglobals

  struct QuestScholomanceBuild extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "解锁普崔司和密室"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "解锁祭坛内的普崔司和诺森德的基地。"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_ShadowvaultUnlock, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod
    
    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_ShadowvaultUnlock, this.Holder.Player)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("秘密集结", "通灵学院是入侵洛丹伦的秘密集结地，建造你的基础建筑并准备好入侵。", "ReplaceableTextures\\CommandButtons\\BTNAffinityII.blp")
      call this.AddQuestItem(QuestItemBuild.create('u011', 2))
      call this.AddQuestItem(QuestItemBuild.create('h08C', 20))
      call this.AddQuestItem(QuestItemBuild.create('u014', 1))
      call this.AddQuestItem(QuestItemBuild.create('u01J', 2))
      call this.AddQuestItem(QuestItemUpgrade.create('h08B', 'h089'))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary