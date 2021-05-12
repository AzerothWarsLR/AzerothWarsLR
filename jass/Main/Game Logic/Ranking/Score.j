//5 seconds into the game, the game records the starting Team of each player as a Force.
//A Force can have its rank set, which adjusts the Gold Gathered for each player in the Force.
//Gold gathered has a special meaning to the external W3Champions system;
//at the end of each game, all players are ranked according to their gold gathered.
library Score requires Environment, Team, GeneralHelpers, Table

  struct Score
    private static boolean initialized = false
    private static force array forces
    private static integer forceCount = 0
    private static force array forceByPlayerId

    private static integer tempScore = 0
    private static force tempForce

    //Enumeration method used for setting the enumerated players score to a provided value
    private static method PlayerSetScoreEnum takes nothing returns nothing
      call SetPlayerState(GetEnumPlayer(), PLAYER_STATE_GOLD_GATHERED, tempScore)
    endmethod

    private static method PlayerGetForce takes player whichPlayer returns force
      return thistype.forceByPlayerId[GetPlayerId(whichPlayer)]
    endmethod

    //Sets the score of every player in a force
    private static method ForceSetScore takes force whichForce, integer score returns nothing
      set tempScore = score
      call ForForce(whichForce, function thistype.PlayerSetScoreEnum)
    endmethod
 
    public static method PlayerAddScore takes player whichPlayer, integer score returns nothing
      call ForceSetScore(thistype.PlayerGetForce(whichPlayer), GetPlayerState(whichPlayer, PLAYER_STATE_GOLD_GATHERED) + score)
    endmethod

    //Public method for setting a player's score; actually sets the entire teams score
    public static method PlayerSetScore takes player whichPlayer, integer score returns nothing
      if thistype.PlayerGetForce(whichPlayer) == null then
        call BJDebugMsg("Player " + GetPlayerName(whichPlayer) + "has no ranking force")
      endif
      call ForceSetScore(thistype.PlayerGetForce(whichPlayer), score)
    endmethod

    //Enumeration method for recording a player's score force
    private static method PlayerSetForceEnum takes nothing returns nothing
      set thistype.forceByPlayerId[GetPlayerId(GetEnumPlayer())] = tempForce
    endmethod

    private static method Initialize takes nothing returns nothing
      local integer i = 0
      if not initialized then
        set initialized = true
        loop
          exitwhen i == Team.Count
          set forces[i] = CreateForce()
          call ForceAddForce(Team.ByIndex(i).CreateForceFromPlayers(), forces[i])
          set tempForce = forces[i]
          call ForForce(tempForce, function thistype.PlayerSetForceEnum) //Record which score force each player belongs to
          set i = i + 1
        endloop
      else
        call BJDebugMsg("Score is already initialized")
      endif
    endmethod

    private static method onInit takes nothing returns nothing
      local timer newTimer = CreateTimer()
      call TimerStart(newTimer, 5., false, function thistype.Initialize)
    endmethod
  endstruct

endlibrary