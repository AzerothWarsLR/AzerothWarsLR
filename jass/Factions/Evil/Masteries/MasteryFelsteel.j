library MasteryFelsteel initializer OnInit requires Persons, LegionMasteryConfig

  globals
    private constant integer RESEARCH_ID = 'R01Y'
  endglobals

  private function Research takes nothing returns nothing
    if GetResearched() == RESEARCH_ID then
      call FACTION_LEGION.applyFactionMod(FACTIONMOD_MASTERY_FELSTEEL)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary