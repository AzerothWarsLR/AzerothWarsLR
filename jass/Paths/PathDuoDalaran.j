library PathDuoDalaran initializer OnInit requires DalaranConfig, Display

  globals
    private constant integer RESEARCH_ID_STEEL = 'R03O'
  endglobals

  private function Research takes nothing returns nothing
    local player tempPlayer
    if GetResearched() == RESEARCH_ID_STEEL then
      set tempPlayer = FACTION_DALARAN.Player
      call SetPlayerTechResearched(tempPlayer, 'R05E', 1)      //Kul'tiras deployed
      call FACTION_DALARAN.modWeight(1)
      if GetResearched() == RESEARCH_ID_STEEL then
        call SetPlayerAbilityAvailable(tempPlayer, 'A0TL', true)
      else
        call SetPlayerAbilityAvailable(tempPlayer, 'A0TE', true)
      endif
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary