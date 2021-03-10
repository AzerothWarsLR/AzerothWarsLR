library TierDragonmawClan initializer OnInit requires FelHordeSetup

  globals
    private constant integer RESEARCH_ID = 'R036'
  endglobals

  private function Research takes nothing returns nothing
    if GetResearched() == RESEARCH_ID then
      call FACTION_FEL_HORDE.modObjectLimit('nbwm', 1)              //Nefarian
      call FACTION_FEL_HORDE.modObjectLimit('nbdk', 2)              //Black Drake
      call FACTION_FEL_HORDE.modObjectLimit('nbdm', -UNLIMITED)     //Blackrock Dragonspawn
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary