library QuestCivilWar requires QuestData, ScourgeSetup

  struct QuestCivilWar extends QuestData
    private method Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "The Lich King has rebelled against his demon masters"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Unally from the Legion team and the Scourge and Legion factions will gain 2000 gold"
    endmethod

    private method OnComplete takes nothing returns nothing
    set this.Holder.Team = TEAM_SCOURGE
    call AdjustPlayerStateBJ( 2000, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
    call AdjustPlayerStateBJ( 2000, FACTION_LEGION.Player, PLAYER_STATE_RESOURCE_GOLD )
    call SetPlayerStateBJ( this.Holder.Player, PLAYER_STATE_FOOD_CAP_CEILING, 250 )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Civil War", "The Lich King wants to break free from his Demon Master, but he will need a champion first", "ReplaceableTextures\\CommandButtons\\BTNTheLichKingQuest.blp")
      call this.AddQuestItem(QuestItemResearch.create('R07W', 'u000'))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_ARTHAS, false))
      call this.AddQuestItem(QuestItemTime.create(900))
      return this
    endmethod
  endstruct

endlibrary