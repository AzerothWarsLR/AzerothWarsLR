library QuestStormwindCity requires QuestData, IronforgeSetup, QuestItemKillUnit

  globals
    private constant integer QUEST_RESEARCH_ID = 'R02S'
  endglobals

  struct QuestStormwindCity extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Stormwind has been literated, and its military is now free to assist the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Stormwind"
    endmethod

    private method GrantStormwind takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Stormwind
      call GroupEnumUnitsInRect(tempGroup, gg_rct_StormwindUnlock, null)
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
      call this.GrantStormwind(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, QUEST_RESEARCH_ID, 1) 
      call this.GrantStormwind(this.Holder.Player)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Clear the Outskirts", "The outskirts of Stormwind are infested by evil creatures. Kill their leader and regain control of the Towns.", "ReplaceableTextures\\CommandButtons\\BTNNobbyMansionCastle.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_n021_2624)) //Hogger
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n00V')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n011')))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary