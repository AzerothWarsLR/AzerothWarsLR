library QuestCivilWar requires QuestData, ScourgeSetup

  struct QuestCivilWar extends QuestData
    private method Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "巫妖王背叛了他的恶魔主人"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "与军团阵营解除联盟，天灾军团和燃烧军团会获得2000黄金"
    endmethod

    private method OnComplete takes nothing returns nothing
    set this.Holder.Team = TEAM_SCOURGE
    call AdjustPlayerStateBJ( 2000, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
    call AdjustPlayerStateBJ( 2000, FACTION_LEGION.Player, PLAYER_STATE_RESOURCE_GOLD )
    call SetPlayerStateBJ( this.Holder.Player, PLAYER_STATE_FOOD_CAP_CEILING, 250 )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("内战", "巫妖王想要从他的恶魔主人那里挣脱出来，但他首先需要一个勇士", "ReplaceableTextures\\CommandButtons\\BTNTheLichKingQuest.blp")
      call this.AddQuestItem(QuestItemResearch.create('R07W', 'u000'))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_ARTHAS, false))
      call this.AddQuestItem(QuestItemTime.create(900))
      return this
    endmethod
  endstruct

endlibrary