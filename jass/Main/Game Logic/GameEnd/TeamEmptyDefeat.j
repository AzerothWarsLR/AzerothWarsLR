//When a Team has been emptied of players, the team is defeated.
//When there is only one Team left, it wins.
library TeamEmptyDefeat initializer OnInit requires VictoryDefeat, Faction, Team

  private function OnFactionLeftTeam takes nothing returns nothing
    local Team leftTeam = GetTriggerFactionPrevTeam()
    if leftTeam.PlayerCount == 0 and leftTeam.ScoreStatus == SCORESTATUS_NORMAL then
      call DefeatTeam(leftTeam)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call OnFactionTeamLeave.register(trig)
    call TriggerAddAction(trig, function OnFactionLeftTeam)
  endfunction

endlibrary