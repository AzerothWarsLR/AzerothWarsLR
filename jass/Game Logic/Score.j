//A system to reward doing well in Azeroth Wars.
//The first time a human plays Azeroth Wars they get a score of 0 saved on their computer. If they do well, the score goes up.
//Scores are persistent across games.

library Score initializer OnInit requires Environment, FileIO, Savecode

  globals
    private integer array Scores

    private constant string FOLDER = "AzerothWarsReforged"
    private constant string FILENAME = "PlayerScore"
    private constant string EXTENSION = ".pld"
    private constant string SYNC_PREFIX = "Score" //Can be anything
    private constant string COMMAND = "-scores"
    private constant integer DEFAULT_SCORE = 0
    private constant integer MAX_SCORE = 1000

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

  private function SaveScore takes player whichPlayer returns nothing
    local Savecode savecode = Savecode.create()
    local string savestring
    call savecode.Encode(Scores[GetPlayerId(whichPlayer)], MAX_SCORE)
    set savestring = savecode.Save(whichPlayer, 1)
    if whichPlayer == GetLocalPlayer() then
      call FileIO_Write(FOLDER + "\\" + FILENAME + EXTENSION, savestring)
    endif
    call savecode.destroy()
  endfunction

  function PlayerAddScore takes player whichPlayer, integer add returns nothing
    set Scores[GetPlayerId(whichPlayer)] = Scores[GetPlayerId(whichPlayer)] + add
    call SaveScore(whichPlayer)
  endfunction  

  private function SyncScore takes nothing returns nothing
    local string syncString = BlzGetTriggerSyncData()
    local integer playerId = S2I(SubString(syncString, 0, 2))
    local integer playerScore = S2I(SubString(syncString, 2, 1000))
    set Scores[playerId] = playerScore
  endfunction

  private function LoadScores takes nothing returns nothing
    local string fileContents = FileIO_Read(FOLDER + "\\" + FILENAME + EXTENSION)
    local Savecode loadcode = Savecode.create()
    local integer score
    call loadcode.Load(GetLocalPlayer(), fileContents, 1)
    set score = loadcode.Decode(MAX_SCORE)
    if fileContents != "" then
      call BlzSendSyncData(SYNC_PREFIX, PadString(I2S(GetPlayerId(GetLocalPlayer()))) + I2S(score))
    endif
  endfunction

  private function DisplayScores takes nothing returns nothing
    local integer i = 0
    local string display = SCORE_COLOR + "Scores" + "|r\n"
    loop
      exitwhen i == MAX_PLAYERS
      if GetPlayerController(Player(i)) == MAP_CONTROL_USER then
        set display = display + "|cffC3C1C3" + GetPlayerName(Player(i)) + ":|r " + I2S(Scores[i]) + "\n"
      endif
      set i = i + 1
    endloop
    call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, display)
  endfunction

  private function PlayerDisplayScores takes nothing returns nothing
    if GetLocalPlayer() == GetTriggerPlayer() then
      call DisplayScores()
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local integer i  = 0
    local trigger trig = CreateTrigger() 
    loop
      call BlzTriggerRegisterPlayerSyncEvent(trig, Player(i), SYNC_PREFIX, false)
      set i = i + 1
      exitwhen i == MAX_PLAYERS
    endloop
    call TriggerAddAction(trig, function SyncScore)

    //Register command to see scores
    set trig = CreateTrigger()
    set i = 0
    loop
    exitwhen i > MAX_PLAYERS
      call TriggerRegisterPlayerChatEvent( trig, Player(i), COMMAND, true )
      set i = i + 1
    endloop   
    call TriggerAddCondition( trig, Condition(function PlayerDisplayScores) )

    call LoadScores()
  endfunction

endlibrary