library Score requires Environment, FileIO, Savecode, Table

  globals
    private constant integer DEFAULT_SCORE = 1000
    private constant integer MAX_SCORE = 3000
    private constant string FOLDER = "AzerothWarsReforged\\Scores"
    private constant string EXTENSION = ".pld"
    private constant string SYNC_PREFIX = "Score" //Can be anything

    private constant string SCORE_COLOR = "|cff911499"
  endglobals

  private function PadString takes string s returns string
    local string newS = s
    loop
      exitwhen StringLength(newS) >= 2
      set newS = "0" + newS
    endloop
    return newS
  endfunction

  struct Score
    readonly static thistype first = 0
    readonly static thistype last = 0
    private static StringTable byFileName

    private real array values[MAX_PLAYERS]
    private real array antes[MAX_PLAYERS]
    private string name
    private string fileName
    private trigger syncTrig
    private boolean loaded = false
    readonly thistype next

    method Display takes nothing returns nothing
      local integer i = 0
      local string display = "\n" + SCORE_COLOR + this.name + " Scores" + "|r\n"
      loop
        exitwhen i == MAX_PLAYERS
        if values[i] != 0 then
          set display = display + "|cffC3C1C3" + GetPlayerName(Player(i)) + ":|r " + R2S(this.values[i]) + "\n"
        endif
        set i = i + 1
      endloop
      call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, display)
    endmethod

    method Save takes player whichPlayer returns nothing
      local Savecode savecode = Savecode.create()
      local string savestring
      call savecode.Encode(R2I(this.values[GetPlayerId(whichPlayer)] - this.antes[GetPlayerId(whichPlayer)]), MAX_SCORE)
      set savestring = savecode.Save(whichPlayer, 1)
      if whichPlayer == GetLocalPlayer() then
        call FileIO_Write(FOLDER + "\\" + GetPlayerName(GetLocalPlayer()) + "\\" + fileName + EXTENSION, savestring)
      endif
      call savecode.destroy()
    endmethod

    method Load takes nothing returns boolean
      local string fileContents
      local Savecode loadcode
      local integer score = 0

      if loaded then
        call BJDebugMsg("ERROR: Attempted to load score " + name + " more than once")
        return false
      endif

      set fileContents = FileIO_Read(FOLDER + "\\" + GetPlayerName(GetLocalPlayer()) + "\\" + fileName + EXTENSION)
      set loadcode = Savecode.create()
      if loadcode.Load(GetLocalPlayer(), fileContents, 1) then
        set score = loadcode.Decode(MAX_SCORE)
        call BlzSendSyncData(SYNC_PREFIX + this.fileName, PadString(I2S(GetPlayerId(GetLocalPlayer()))) + I2S(score))
      else
        call BlzSendSyncData(SYNC_PREFIX + this.fileName, PadString(I2S(GetPlayerId(GetLocalPlayer()))) + I2S(DEFAULT_SCORE))
      endif

      return true
    endmethod

    method Get takes player whichPlayer returns real
      return this.values[GetPlayerId(whichPlayer)]
    endmethod

    method Set takes player whichPlayer, real val returns nothing
      set this.values[GetPlayerId(whichPlayer)] = val
      set antes[GetPlayerId(whichPlayer)] = 0
      call Save(whichPlayer)
    endmethod

    //Players can disconnect at any time, so when the game starts a player can lose an amount of score that they only get back if they win; they then lose nothing if they do actually lose
    method SetAnte takes player whichPlayer, real val returns nothing
      set antes[GetPlayerId(whichPlayer)] = val
      call Save(GetLocalPlayer())
    endmethod

    //Takes in sync event with content e.g. "021100", notifying all clients that player 2 has a score of 1100
    private method OnSyncScore takes nothing returns nothing
      local string syncString = BlzGetTriggerSyncData()
      local integer playerId = S2I(SubString(syncString, 0, 2)) //Expected that first 2 characters represent player number
      local integer playerScore = S2I(SubString(syncString, 2, 1000)) //All remaining characters represent score
      set values[playerId] = playerScore
      call Save(Player(playerId))
    endmethod

    //Global response; takes in sync event with prefix e.g "ScoreDuel" and passes the event on to Score with filename "Duel"
    private static method OnAnySyncScore takes nothing returns nothing
      call thistype(byFileName[SubString(BlzGetTriggerSyncPrefix(), StringLength(SYNC_PREFIX), 1000)]).OnSyncScore()
    endmethod

    static method ByFileName takes string s returns thistype
      return thistype.byFileName[s]
    endmethod

    static method create takes string name, string fileName returns thistype
      local thistype this = thistype.allocate()
      local integer i = 0
      set this.name = name
      set this.fileName = fileName

      if thistype.first == 0 then
        set thistype.first = this
      endif
      if last != 0 then
        set last.next = this
      endif
      set last = this

      set syncTrig = CreateTrigger()
      loop
        exitwhen i == MAX_PLAYERS
        call BlzTriggerRegisterPlayerSyncEvent(syncTrig, Player(i), SYNC_PREFIX + fileName, false)
        set i = i + 1
      endloop
      call TriggerAddAction(syncTrig, function thistype.OnAnySyncScore)
      set this.byFileName[fileName] = this

      return this
    endmethod

    private static method onInit takes nothing returns nothing
      set byFileName = StringTable.create()
    endmethod

  endstruct

endlibrary