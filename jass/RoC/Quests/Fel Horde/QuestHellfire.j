library QuestHellfire requires QuestData, IronforgeSetup, QuestItemKillUnit

  globals
    private constant integer QUEST_RESEARCH_ID = 'R00P'
  endglobals

  struct QuestHellfire extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Hellfire Citadel has been subjugated, and its military is now free to assist the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Hellfire Citadel and enable Kargath to be trained at the altar"
    endmethod

    private method GrantHellfire takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Hellfire Citadel
      call GroupEnumUnitsInRect(tempGroup, gg_rct_HellfireUnlock, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, whichPlayer)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null      
    endmethod

    private method OnFail takes nothing returns nothing
      call this.GrantHellfire(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, 'R00P', 1) 
      call this.GrantHellfire(this.Holder.Player)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Citadel", "The clans holding Hellfire Citadel do not respect Magtheridon authority yet, destroy Murmur to show them who rules Outland now", "ReplaceableTextures\\CommandButtons\\BTNFelOrcFortress.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_n03T_0555)) //Murmur
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_AUCHINDOUN, false))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary