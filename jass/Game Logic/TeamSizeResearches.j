//Researches that are awarded to members of a Team when that Team has a specific size.

library TeamSizeResearches initializer OnInit requires Environment, Team

  globals
    private constant integer RESEARCH_WEIGHTBELOWMAXIMUM = 'R04I'
    private constant integer RESEARCH_NOALLIES = 'RNAL'
  endglobals

  private function RefreshTeam takes Team team returns nothing
    local integer weightBelowMaximumLevel = 0
    local integer noAlliesLevel = 0
    local integer i = 0

    if team == 0 then
      call BJDebugMsg("ERROR: Null team given to function RefreshTeam in library TeamSizeResearches")
      return
    endif

    if team.Weight < team.MaxWeight then
      set weightBelowMaximumLevel = 1
    endif
    if team.Weight < 3 then
      set noAlliesLevel = 1
    endif

    loop
      exitwhen i == team.FactionCount
      call SetPlayerTechResearched(team.GetFactionByIndex(i).Player, RESEARCH_WEIGHTBELOWMAXIMUM, weightBelowMaximumLevel)
      call SetPlayerTechResearched(team.GetFactionByIndex(i).Player, RESEARCH_NOALLIES, noAlliesLevel)
      set i = i + 1
    endloop
  endfunction

  private function TeamSizeChanged takes nothing returns nothing
    if GetTriggerTeam() != 0 then
      call RefreshTeam(GetTriggerTeam())
    endif
  endfunction

  private function PersonFactionChanged takes nothing returns nothing
    if GetTriggerPerson().Faction.Team != 0 then
      call RefreshTeam(GetTriggerPerson().Faction.Team)
    endif
    if GetChangingPersonPrevFaction().Team != 0 then
      call RefreshTeam(GetChangingPersonPrevFaction().Team)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call OnTeamSizeChange.register(trig)
    call OnTeamWeightChange.register(trig)
    call TriggerAddAction(trig, function TeamSizeChanged)

    set trig = CreateTrigger()
    call OnPersonFactionChange.register(trig)
    call TriggerAddAction(trig, function PersonFactionChanged)
  endfunction

endlibrary