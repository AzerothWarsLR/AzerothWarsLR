library TierReginaldWindsor requires StormwindSetup

  globals
    private constant integer DEMI_UNITTYPE_ID = 'h03F'
  endglobals

  private function Research takes nothing returns nothing
    if GetResearched() == 'R03R' then
      call CreateUnit(FACTION_STORMWIND.Player, DEMI_UNITTYPE_ID, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()), 0)
      call FACTION_STORMWIND.modObjectLimit('n09N', 6)               //Bishop of Light
    endif
  endfunction

  public function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
    call FACTION_STORMWIND.modObjectLimit(DEMI_UNITTYPE_ID, 1)
  endfunction

endlibrary