//When a Team is completely emptied, a particular research should be given to all players. 
//This research is a requirement for certain Second Chances to be researched.

library EnableSecondChances initializer OnInit requires Team, Persons 

  globals
    private integer RESEARCH_DELAY = 180
  endglobals

  private function EnableResearchForAll takes integer researchId returns nothing
    local integer i = 0
    loop
    exitwhen i > MAX_PLAYERS
      call SetPlayerTechResearched(Player(i), researchId, 1)   
      set i = i + 1
    endloop
  endfunction
  
  private function Actions takes nothing returns nothing
    local Team triggerTeam = GetTriggerTeam()
    if triggerTeam.size == 0 then
      call TriggerSleepAction(RESEARCH_DELAY)
      if triggerTeam == TEAM_SCOURGE then
        call EnableResearchForAll('http') 
      elseif triggerTeam == TEAM_NORTH_ALLIANCE then
        call EnableResearchForAll('http')
      elseif triggerTeam == TEAM_HORDE then
        call EnableResearchForAll('R05C')
      elseif triggerTeam == TEAM_NIGHT_ELVES then
        call EnableResearchForAll('R05C')
      elseif triggerTeam == TEAM_SOUTH_ALLIANCE then  
        call EnableResearchForAll('R05D')
      elseif triggerTeam == TEAM_FEL_HORDE then
        call EnableResearchForAll('R05D')
      endif  
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call OnTeamSizeChange.register(trig)
    call TriggerAddAction(trig, function Actions)
  endfunction
  
endlibrary