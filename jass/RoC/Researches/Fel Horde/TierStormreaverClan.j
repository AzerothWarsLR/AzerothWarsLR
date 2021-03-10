library TierStormreaverClan initializer OnInit requires FelHordeSetup

  globals
    private constant integer RESEARCH_ID = 'R03L'
  endglobals

  private function Research takes nothing returns nothing
    if GetResearched() == RESEARCH_ID then
      call FACTION_FEL_HORDE.modObjectLimit('n086', 6)              //Death Knight
      call FACTION_FEL_HORDE.modObjectLimit('o01L', -UNLIMITED)     //Executioner
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary