library QuestMonastery requires QuestData, ScarletSetup, QuestItemResearch, QuestItemSelfExists, GeneralHelpers

  globals
    private constant integer RESEARCH_ID = 'R03P'         //This research is required to complete the quest
    private constant integer QUEST_RESEARCH_ID = 'R03F'   //This research is given when the quest is completed
  endglobals

  struct QuestMonastery extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "血色修道院之手已经完成，并准备好加入" + this.Holder.Team.Name + "了。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得血色修道院内的所有单位和建筑并与联盟解除结盟"
    endmethod

    private method UnhideUnit takes nothing returns nothing
      local unit u
      loop
        set u = FirstOfGroup(udg_HiddenUnits4)
        exitwhen u == null
        call ShowUnitShow(u)
        call GroupRemoveUnit(udg_HiddenUnits4, u)
      endloop
      call DestroyGroup(udg_HiddenUnits4)
    endmethod

    private method OnFail takes nothing returns nothing
      call UnhideUnit()
      call RescueNeutralUnitsInRect(gg_rct_ScarletAmbient, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call UnhideUnit()
      call SetPlayerTechResearched(FACTION_KULTIRAS.Player, 'R06V', 1)
      call SetPlayerTechResearched(FACTION_LORDAERON.Player, 'R06V', 1)
      call SetPlayerTechResearched(FACTION_SCARLET.Player, 'R086', 1)
      call RescueNeutralUnitsInRect(gg_rct_ScarletAmbient, this.Holder.Player)
      call WaygateActivateBJ( true, gg_unit_h03V_2337 )
      call WaygateSetDestinationLocBJ( gg_unit_h03V_2337, GetRectCenter(gg_rct_Scarlet_Monastery_Interior) )
      set this.Holder.Team = TEAM_SCARLET
      set this.Holder.Name = "血色十字军"
      set this.Holder.Icon = "ReplaceableTextures\\CommandButtons\\BTNSaidan Dathrohan.blp"
      call PlayThematicMusicBJ( "war3mapImported\\ScarletTheme.mp3" )
      call SetPlayerStateBJ( this.Holder.Player, PLAYER_STATE_FOOD_CAP_CEILING, 250 )
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("秘密修道院", "血色修道院是血色十字军完美的秘密基地", "ReplaceableTextures\\CommandButtons\\BTNDivine_Reckoning_Icon.blp")
      call this.AddQuestItem(QuestItemResearch.create(RESEARCH_ID, 'h00T'))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary