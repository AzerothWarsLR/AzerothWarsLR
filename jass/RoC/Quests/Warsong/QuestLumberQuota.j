library QuestLumberQuota requires QuestData, WarsongSetup, QuestItemResearch, QuestItemExpire, QuestItemSelfExists, GeneralHelpers

  globals
    private constant integer RESEARCH_ID = 'R05O'         //This research is required to complete the quest
    private constant integer QUEST_RESEARCH_ID = 'R05R'   //This research is given when the quest is completed
  endglobals

  struct QuestLumberQuota extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "奥格瑞玛已成立并加入我们和" + this.Holder.Team.Name + "。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得奥格瑞玛内所有单位和建筑并允许召唤瓦罗克"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_Orgrimmar, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_Orgrimmar, this.Holder.Player)
      if GetLocalPlayer() == this.Holder.Player then
        call PlayThematicMusicBJ("war3mapImported\\OrgrimmarTheme.mp3")
      endif
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("驯服土地", "这个新大陆充满了机遇，如果部落要生存下去，就需要建造一座新的城市。", "ReplaceableTextures\\CommandButtons\\BTNFortress.blp")
      call this.AddQuestItem(QuestItemResearch.create(RESEARCH_ID, 'o02S'))
      call this.AddQuestItem(QuestItemExpire.create(1500))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary