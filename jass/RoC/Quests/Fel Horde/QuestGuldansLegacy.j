library QuestGuldansLegacy initializer OnInit requires QuestData, FelHordeConfig

  globals
    private integer RESEARCH_ID = 'R041'
  endglobals

  struct QuestGuldansLegacy extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Gul'dan's remains have been located within the Tomb of Sargeras. His eldritch knowledge may now be put to purpose."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "2 new Demon Gates in Outland"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerAbilityAvailableBJ(true, 'A0MZ', FACTION_FEL_HORDE.Player)  //Demonic Construction
      call UnitRescue(gg_unit_n081_4074, FACTION_FEL_HORDE.Player)
      call UnitRescue(gg_unit_n081_1585, FACTION_FEL_HORDE.Player)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Gul'dans Legacy", "The Orc Warlock Gul'dan is ultimately responsible for the formation of the Fel Horde. Though long dead, his teachings could still be extracted from his body.", "ReplaceableTextures\\CommandButtons\\BTNGuldan.blp")
      call this.AddQuestItem(QuestItemAnyUnitInRect.create(gg_rct_Guldan, "Gul'dan's corpse in the Tomb of Sargeras", true))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_FEL_HORDE.AddQuest(QuestGuldansLegacy.create())
  endfunction
  
endlibrary