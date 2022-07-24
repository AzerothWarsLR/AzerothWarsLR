library QuestUndercity requires QuestData, ForsakenSetup, GeneralHelpers

  globals
    private constant integer RESEARCH_ID = 'R050'         //This research is required to complete the quest
    private constant integer QUEST_RESEARCH_ID = 'R04X'   //This research is given when the quest is completed
  endglobals

  struct QuestUndercity extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod
    
    private method operator CompletionPopup takes nothing returns string
      return "幽暗城现在在" + this.Holder.Team.Name + "的控制之下并宣布了独立"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得幽暗城内所有单位和建筑，解锁纳萨诺斯并离开燃烧军团阵营。你在诺森德的所有单位将变成野怪。"
    endmethod

    private method EmptyNR takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Dalaran
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Northrend_Ambiance, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == this.Holder.Player then
          call UnitRescue(u, whichPlayer)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call GroupEnumUnitsInRect(tempGroup, gg_rct_InstanceAzjolNerub, null)      
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == this.Holder.Player then
          call UnitRescue(u, whichPlayer)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null
    endmethod

    private method UnhideUnit takes nothing returns nothing
      local unit u
      loop
        set u = FirstOfGroup(udg_HiddenUnits3)
        exitwhen u == null
        call ShowUnitShow(u)
        call GroupRemoveUnit(udg_HiddenUnits3, u)
      endloop
      call DestroyGroup(udg_HiddenUnits3)
    endmethod
    
    private method OnFail takes nothing returns nothing
      call UnhideUnit()
      call RescueNeutralUnitsInRect(gg_rct_UndercityUnlock, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call UnhideUnit()
      call RescueNeutralUnitsInRect(gg_rct_UndercityUnlock, this.Holder.Player)
      call this.EmptyNR(Player(PLAYER_NEUTRAL_AGGRESSIVE))
      call SetPlayerTechResearched(FACTION_LORDAERON.Player, 'R08G', 1)
      call SetPlayerTechResearched(FACTION_LEGION.Player, 'R08G', 1)
      call WaygateActivateBJ( true, gg_unit_n08F_1739 )
      call WaygateActivateBJ( true, gg_unit_n08F_1798 )
      call ShowUnitShow( gg_unit_n08F_1739 )
      call ShowUnitShow( gg_unit_n08F_1798 )
      call WaygateSetDestinationLocBJ( gg_unit_n08F_1739, GetRectCenter(gg_rct_Undercity_Interior_2) )
      call WaygateSetDestinationLocBJ( gg_unit_n08F_1798, GetRectCenter(gg_rct_Undercity_Interior_1) )
      set this.Holder.Team = TEAM_FORSAKEN
      set this.Holder.Name = "被遗忘者"
      set this.Holder.Icon = "ReplaceableTextures\\CommandButtons\\BTNBansheeRanger.blp"
      call SetPlayerStateBJ( this.Holder.Player, PLAYER_STATE_FOOD_CAP_CEILING, 250 )
      call PlayThematicMusicBJ( "war3mapImported\\ForsakenTheme.mp3" )
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("被遗忘者独立", "被遗忘者已经受够了巫妖王的暴政。希尔瓦娜斯发誓要给被遗忘者们带来自由和一个家。", "ReplaceableTextures\\CommandButtons\\BTNForsakenArrows.blp")
      call this.AddQuestItem(QuestItemResearch.create(RESEARCH_ID, 'h08B'))
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_SYLVANASV, gg_rct_Terenas, "首都"))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_CAPITALPALACE))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary