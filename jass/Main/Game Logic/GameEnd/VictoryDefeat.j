library VictoryDefeat

  globals
    public string VICTORY_COLOR = "|cff911499"
    public string DEFEAT_COLOR = "|cff911499"
  endglobals

  function TeamVictory takes Team whichTeam returns nothing
    set GameWon = true
    call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, VICTORY_COLOR + "TEAM VICTORY!|r\nThe " + whichTeam.Name + " has won the game!")
    set whichTeam.ScoreStatus = SCORESTATUS_VICTORIOUS
  endfunction

  function DefeatTeam takes Team whichTeam returns nothing
    call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, VICTORY_COLOR + "\nTEAM DEFEAT!|r\nThe " + whichTeam.Name + " has been defeated.")
    set whichTeam.ScoreStatus = SCORESTATUS_DEFEATED
  endfunction

endlibrary