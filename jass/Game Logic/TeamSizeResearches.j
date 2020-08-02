//Researches that are awarded to members of a Team when that Team has a specific size.

library TeamSizeResearches initializer OnInit requires Environment, Team

  globals
    private constant integer RESEARCH_WEIGHTBELOWMAXIMUM = 'R04I'
    private constant integer RESEARCH_NOALLIES = 'RNAL'
  endglobals

  private function TeamSizeChanged takes nothing returns nothing
    local Team triggerTeam = GetTriggerTeam()
    local integer weightBelowMaximumLevel = 0
    local integer noAlliesLevel = 0
    local integer i = 0

    if triggerTeam.weight < triggerTeam.maxWeight then
      set weightBelowMaximumLevel = 1
    endif
    if triggerTeam.size == 1 then
      set noAlliesLevel = 1
    endif

    loop
      exitwhen i == MAX_PLAYERS
      if triggerTeam.playerArray[i] != null then
        call SetPlayerTechResearched(triggerTeam.playerArray[i], RESEARCH_WEIGHTBELOWMAXIMUM, weightBelowMaximumLevel)
        call SetPlayerTechResearched(triggerTeam.playerArray[i], RESEARCH_NOALLIES, noAlliesLevel)
      endif
      set i = i + 1
    endloop
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call OnTeamSizeChange.register(trig)
    call OnTeamWeightChange.register(trig)
    call TriggerAddAction(trig, function TeamSizeChanged)
  endfunction

endlibrary