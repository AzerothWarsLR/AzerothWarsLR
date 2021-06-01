library TierArchbishopBenedictus requires StormwindSetup

  globals
    private constant integer DEMI_UNITTYPE_ID = 'h05W'
  endglobals

  private function Research takes nothing returns nothing
    call CreateUnit(FACTION_STORMWIND.Player, DEMI_UNITTYPE_ID, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()), 0)
    call FACTION_STORMWIND.modObjectLimit('n09N', 6)               //Bishop of Light
  endfunction

  public function OnInit takes nothing returns nothing
    call RegisterResearchFinishedAction('R03P', function Research)
    call FACTION_STORMWIND.modObjectLimit(DEMI_UNITTYPE_ID, 1)   
  endfunction

endlibrary