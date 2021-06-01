library TierSI7Elite initializer OnInit requires StormwindSetup

  private function Research takes nothing returns nothing
    call FACTION_STORMWIND.modObjectLimit('h05V', 6) //SI:7 Agent   
  endfunction

  private function OnInit takes nothing returns nothing
    call RegisterResearchFinishedAction('R032', function Research)
  endfunction

endlibrary