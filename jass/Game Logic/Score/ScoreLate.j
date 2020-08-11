library ScoreVictory initializer OnInit requires Score, Victory

  globals
    private Score SCORE_LATE
    private constant real TRUE_GAMES = 0.05 //How may games are expected to end with a victor; elo losses are multiplied by this
  endglobals

  private function TeamVictory takes nothing returns nothing
    local integer i = 0
    local real totalLoserElo = 0
    local real averageLoserElo = 0
    local integer totalLoserCount = 0
    local real totalAllyElo = 0
    local integer totalAllies = 0
    local real averageAllyElo = 0

    //Calculate total Elo of non-victorious and victorious players
    loop
      exitwhen i == MAX_PLAYERS
      if  SCORE_LATE.Get(Player(i)) != 0 then
        if not GetVictoriousTeam().containsPlayer(Player(i)) then
          set totalLoserElo = totalLoserElo + SCORE_LATE.Get(Player(i))
          set totalLoserCount = totalLoserCount + 1
        else
          set totalAllyElo = totalAllyElo + SCORE_LATE.Get(Player(i))
          set totalAllies = totalAllies + 1
        endif
      endif
      set i = i + 1
    endloop
    set averageLoserElo = totalLoserElo / totalLoserCount
    set averageAllyElo = totalAllyElo / totalAllies

    //Apply elo change to winners
    set i = 0
    loop
      exitwhen i == MAX_PLAYERS
      if GetVictoriousTeam().containsPlayer(Player(i)) then
        call SCORE_LATE.Set(Player(i), Elo_DetermineRating(averageAllyElo, averageLoserElo, true))
      endif
      set i = i + 1
    endloop

    //Display
    call SCORE_LATE.Display()
  endfunction

  //All players lose this much Score as soon as the game starts, and only get it back if they win
  private function PlayerApplyAnte takes player whichPlayer returns nothing
    local real totalOpponentElo = 0
    local integer totalOpponents = 0
    local real averageOpponentElo = 0
    local real totalAllyElo = 0
    local integer totalAllies = 0
    local real averageAllyElo = 0
    local integer i = 0
    //Get average elo of opponents and allies seperately
    loop
      exitwhen i == MAX_PLAYERS
      if SCORE_LATE.Get(Player(i)) != 0 then
        if IsPlayerEnemy(whichPlayer, Player(i)) then
          set totalOpponents = totalOpponents + 1
          set totalOpponentElo = totalOpponentElo + SCORE_LATE.Get(Player(i))
        else  
          set totalAllies = totalAllies + 1
          set totalAllyElo = totalAllyElo + SCORE_LATE.Get(Player(i))
        endif
      endif
      set i = i + 1
    endloop
    //Calculate elo for a hypothetical loss to all enemies, then ante that
    if totalOpponents > 0 and totalAllies > 0 then
      set averageOpponentElo = totalOpponentElo / totalOpponents
      set averageAllyElo = totalAllyElo / totalAllies
      call SCORE_LATE.SetAnte(whichPlayer, (SCORE_LATE.Get(whichPlayer) - Elo_DetermineRating(averageAllyElo, averageOpponentElo, false)) * TRUE_GAMES)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    local integer i = 0
    call OnTeamVictory.register(trig)
    call TriggerAddAction(trig, function TeamVictory)
    set SCORE_LATE = Score.create("Late", "Late")
    call SCORE_LATE.Load()

    call TriggerSleepAction(1) //Don't punish people who disconnect in loading screen

    set i = 0
    loop
      exitwhen i == MAX_PLAYERS
      if SCORE_LATE.Get(Player(i)) != 0 then
        call PlayerApplyAnte(Player(i))
      endif
      set i = i + 1
    endloop
  endfunction

endlibrary