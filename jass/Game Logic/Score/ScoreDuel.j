library ScoreDuel initializer OnInit requires Score, Duel

  globals
    private Score SCORE_DUEL
    private constant real TRUE_DUELS = 0.80 //How may duels are expected to end with a victor; elo losses are multiplied by this
  endglobals

  private function OnDuelEnded takes nothing returns nothing
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
      if  SCORE_DUEL.Get(Player(i)) != 0 then
        if GetTriggerDuel().Winners.ContainsPlayer(Player(i)) then
          set totalAllyElo = totalAllyElo + SCORE_DUEL.Get(Player(i))
          set totalAllies = totalAllies + 1
        elseif GetTriggerDuel().ContainsPlayer(Player(i)) then
          set totalLoserElo = totalLoserElo + SCORE_DUEL.Get(Player(i))
          set totalLoserCount = totalLoserCount + 1
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
      if GetTriggerDuel().Winners.ContainsPlayer(Player(i)) then
        call SCORE_DUEL.Set(Player(i), Elo_DetermineRating(averageAllyElo, averageLoserElo, true))
      endif
      set i = i + 1
    endloop
  endfunction

  private function BelligerentAverageElo takes Belligerent whichBelligerent returns real
    local real total = 0
    local integer count = 0
    local integer i = 0
    loop
      exitwhen i == MAX_PLAYERS
      if whichBelligerent.ContainsPlayer(Player(i)) and SCORE_DUEL.Get(Player(i)) != 0 then
        set count = count + 1
        set total = total + SCORE_DUEL.Get(Player(i))
      endif
      set i = i + 1
    endloop
    if count > 0 then
      return total / count
    else
      return 0.
    endif
  endfunction

  //All players in a Duel instantly lose Elo as if they had lost, and only get it back when they perform a win. This avoids the issue of dodging
  private function DuelApplyAnte takes Duel whichDuel returns nothing
    local real belligerentAElo = BelligerentAverageElo(whichDuel.belligerents[0])
    local real belligerentBElo = BelligerentAverageElo(whichDuel.belligerents[1])
    local integer i = 0
    if belligerentAElo > 0 and belligerentBElo > 0 then
      loop
        exitwhen i == MAX_PLAYERS
        if SCORE_DUEL.Get(Player(i)) != 0 then
          if whichDuel.belligerents[0].ContainsPlayer(Player(i)) then
            call SCORE_DUEL.SetAnte(Player(i), (SCORE_DUEL.Get(Player(i)) - Elo_DetermineRating(belligerentAElo, belligerentBElo, false)) * TRUE_DUELS)
          elseif whichDuel.belligerents[1].ContainsPlayer(Player(i)) then
            call SCORE_DUEL.SetAnte(Player(i), (SCORE_DUEL.Get(Player(i)) - Elo_DetermineRating(belligerentBElo, belligerentAElo, false)) * TRUE_DUELS)
          endif
        endif
        set i = i + 1
      endloop
      if whichDuel.belligerents[2] != 0 then
        call BJDebugMsg("ERROR: " + whichDuel.title + " has more than 2 belligerents; ScoreDuel implementation can't handle this")
      endif
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    local Duel duel
    call OnDuelEnd.register(trig)
    call TriggerAddAction(trig, function OnDuelEnded)

    set SCORE_DUEL = Score.create("Duel", "Duel")
    call SCORE_DUEL.Load()

    call TriggerSleepAction(1) //Don't punish people who disconnect in loading screen

    set duel = Duel.first
    loop
      exitwhen duel == 0
      call DuelApplyAnte(duel)
      set duel = duel.next
    endloop
  endfunction

endlibrary