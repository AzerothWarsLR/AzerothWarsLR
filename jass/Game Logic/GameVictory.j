//When a Team gets a certain number of Control Points they win. 
//This doesn't end the game, they just gain an increase to their score.

library Victory initializer OnInit requires ControlPoint

  globals
    private constant integer CPS_VICTORY = 7 //This many Control Points gives an instant win
    private constant integer CPS_WARNING = 5 //How many Control Points to start the warning at
    private constant string VICTORY_COLOR = "|cff911499"
    private boolean GameWon = false

    private trigger ControlPointTrig
  endglobals

  private function TeamVictory takes Team whichTeam returns nothing
    local integer i = 0
    local boolean playedMusic = false
    set GameWon = true
    call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, VICTORY_COLOR + "TEAM VICTORY!|r\n" + whichTeam.name + " has won the game! You may continue playing, but no further winners will be determined.")
    //Play victory music from first player in winning team
    loop
      exitwhen i == MAX_PLAYERS or playedMusic
      if whichTeam.playerArray[i] != null then
        call StopMusic(true)
        call PlayThematicMusic(Persons[GetPlayerId(whichTeam.playerArray[i])].Faction.VictoryMusic)
        set playedMusic = true
      endif
      set i = i + 1
    endloop
    //Update scores
    set i = 0
    loop
      exitwhen i == MAX_PLAYERS
      //call PlayerAddScore(whichTeam.playerArray[i], 5)
      set i = i + 1
    endloop
  endfunction

  private function TeamWarning takes Team whichTeam, integer controlPoints returns nothing
    call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, "\n" + VICTORY_COLOR + "TEAM VICTORY IMMINENT|r\n" + whichTeam.name + " has captured " + I2S(controlPoints) + " out of " + I2S(CPS_VICTORY) + " Control Points required to win the game!")
  endfunction

  private function GetTeamControlPoints takes Team whichTeam returns integer
    local integer total = 0
    local integer i = 0
    loop
      exitwhen i == MAX_PLAYERS
      if whichTeam.playerArray[i] != null then
        set total = total + Person.fromHandle(whichTeam.playerArray[i]).controlPoints
      endif
      set i = i + 1
    endloop
    return total
  endfunction

  private function ControlPointOwnerChanges takes nothing returns nothing
    local Team team
    local integer teamControlPoints

    if not GameWon then
      set team = Person.fromHandle(GetOwningPlayer(GetTriggerControlPoint().u)).Team
      set teamControlPoints = GetTeamControlPoints(team)
      if teamControlPoints >= CPS_VICTORY then
        call TeamVictory(team)
      elseif teamControlPoints > CPS_WARNING then
        call TeamWarning(team, teamControlPoints)
      endif
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    set ControlPointTrig = CreateTrigger()
    call OnControlPointOwnerChange.register(ControlPointTrig)
    call TriggerAddAction(ControlPointTrig, function ControlPointOwnerChanges)
  endfunction

endlibrary