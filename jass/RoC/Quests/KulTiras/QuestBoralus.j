library QuestBoralus requires QuestData, ScarletSetup, GeneralHelpers

  globals
    private constant integer QUEST_RESEARCH_ID = 'R00L'   //This research is given when the quest is completed
  endglobals

  struct QuestBoralus extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "库尔提拉斯已经加入了战争，其军队现在可以自由的协助" + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得库尔提拉斯所有建筑和单位并允许在祭坛内召唤凯瑟琳·普罗德摩尔"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_Kultiras, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_Kultiras, this.Holder.Player)
      call SetUnitInvulnerable(gg_unit_h05V_0260, true)
      if GetLocalPlayer() == this.Holder.Player then
        call PlayThematicMusicBJ( "war3mapImported\\KultirasTheme.mp3" )
      endif
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("海上之城", "普罗德摩尔被困在了海上。重新加入伯拉勒斯来控制城市", "ReplaceableTextures\\CommandButtons\\BTNHumanShipyard.blp")
      call this.AddQuestItem(QuestItemResearch.create('R04R', 'h06I'))
      call this.AddQuestItem(QuestItemUpgrade.create('h06I', 'h062'))
      call this.AddQuestItem(QuestItemExpire.create(900))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary