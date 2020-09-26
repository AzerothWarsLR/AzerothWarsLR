//Chen Stormstout joins the Warsong when a Warsong unit approaches him.
library QuestChenStormstout requires QuestData, StormwindConfig, GeneralHelpers

  globals
    private constant integer CHEN_RESEARCH = 'R037'
  endglobals

  struct QuestChenStormstout extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Chen Stormstout has joined the " + this.Holder.Team + "."
    endmethod

    private method OnFail takes nothing returns nothing
      call RemoveUnit(gg_unit_h04E_2670)
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(FACTION_WARSONG.Player, CHEN_RESEARCH, 1)
      call UnitRescue(gg_unit_h04E_2670, FACTION_WARSONG.Player)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(CHEN_RESEARCH, UNLIMITED)
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Wandering Brewmaster", "Rumours tell of a strange white-furred creature from a foreign land. Perhaps it could be convinced to join the Horde.", "ReplaceableTextures\\CommandButtons\\BTNPandarenBrewmaster.blp")
      call this.AddQuestItem(QuestItemAnyUnitInRect.create(gg_rct_Chen))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_WARSONG.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary