library VictoryDefeat requires GameTimer

  globals
    string VICTORY_COLOR = "|cff911499"
    string DEFEAT_COLOR = "|cff911499"
    boolean GameWon = false
  endglobals

  function TeamVictory takes Team whichTeam returns nothing
    local integer i = 0
    local Team loopTeam

    call ClearTextMessages()
    call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, VICTORY_COLOR + "\nTEAM VICTORY!|r\nThe " + whichTeam.Name + " has won the game! Surviving players may continue playing, but scores have already been recorded.")
    //Give victory to ALL teams which are still standing at this point
    loop
      exitwhen i == Team.Count
      set loopTeam = Team.ByIndex(i)
      if loopTeam.PlayerCount > 0 and loopTeam.ScoreStatus == SCORESTATUS_NORMAL then
        set loopTeam.ScoreStatus = SCORESTATUS_VICTORIOUS
      endif
      set i = i + 1
    endloop
    call PlayMusic(whichTeam.VictoryMusic)
    set GameWon = true
  endfunction

  function DefeatTeam takes Team whichTeam returns nothing
    if GetGameTime() >= 60 then
      call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, VICTORY_COLOR + "\nTEAM DEFEAT!|r\nThe " + whichTeam.Name + " has been defeated.")
    endif
    set whichTeam.ScoreStatus = SCORESTATUS_DEFEATED
    call PlayMusic(whichTeam.DefeatMusic)
  endfunction

endlibrary