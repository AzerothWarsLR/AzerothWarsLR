library QuestUndercity requires QuestData, ForsakenSetup

  globals
    private constant integer RESEARCH_ID = 'R050'         //This research is required to complete the quest
    private constant integer QUEST_RESEARCH_ID = 'R04X'   //This research is given when the quest is completed
  endglobals

  struct QuestUndercity extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Undercity is now under the " + this.Holder.Team.Name + " and they have declared independance."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Undercity, unlock Nathanos and unally the Legion team"
    endmethod

    private method GrantUndercity takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Undercity
      call GroupEnumUnitsInRect(tempGroup, gg_rct_UndercityUnlock, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) and GetUnitFoodUsed(u) != 10 then
          call UnitRescue(u, whichPlayer)
        else 
          call UnitRescue(u, Player(PLAYER_NEUTRAL_PASSIVE))
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null      
    endmethod

    private method OnFail takes nothing returns nothing
      call this.GrantUndercity(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantUndercity(this.Holder.Player)
      //call WaygateActivateBJ( true, gg_unit_h00T_0786 )
      //call WaygateSetDestinationLocBJ( gg_unit_h00T_0786, GetRectCenter(gg_rct_Scarlet_Undercity_Interior) )
      set this.Holder.Team = TEAM_FORSAKEN
      if GetLocalPlayer() == this.Holder.Player then
        call PlayThematicMusicBJ( "war3mapImported\\ForsakenTheme.mp3" )
      endif
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Forsaken Independance", "The Forsaken had enough of living under the tyranny of the Lich King. Sylvanas has vowed to give them their freedom back and a home", "ReplaceableTextures\\CommandButtons\\BTNForsakenArrows.blp")
      call this.AddQuestItem(QuestItemResearch.create(RESEARCH_ID, 'R050'))
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_Sylvanas, gg_rct_Terenas, "Capital City"))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_CAPITALPALACE))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary