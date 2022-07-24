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
    call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, VICTORY_COLOR + "\n队伍胜利！|r\n" + whichTeam.Name + "获胜了！剩余的玩家可以继续游玩，但分数已经被记录。")
    //Give victory to ALL teams which are still standing at this point
    loop
      exitwhen i == Team.Count
      set loopTeam = Team.ByIndex(i)
      set i = i + 1
    endloop
    call PlayThematicMusic(loopTeam.VictoryMusic)
    set GameWon = true
  endfunction

  function DefeatTeam takes Team whichTeam returns nothing
    if GetGameTime() >= 60 then
      call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, VICTORY_COLOR + "\n队伍失败!|r\n " + whichTeam.Name + "被击败了。")
      call StartSound(gg_snd_GameFound)
    endif
  endfunction

endlibrary