library EventPlague initializer OnInit requires Faction

  globals 
    private constant real TIME_ENABLE = 420  //Time it takes after game start for the Plague to be enabled
    private constant real TIME_FORCED = 720  //Time to force the Plague to start

    private boolean Enabled = false
  endglobals

  private function SpawnPlagueCauldron takes rect whichRect returns nothing
    local Person scourge = FACTION_SCOURGE.Person
    local real x = 0 
    local real y = 0
    if scourge != 0 then
      set x = GetRectRandomX(whichRect)
      set y = GetRectRandomY(whichRect)
      call CreateUnit(scourge.Player, 'h02W', x, y, 0) //Plague Cauldron
      call CreateUnit(scourge.Player, 'unec', x, y, 0) //Necromancer
      call CreateUnit(scourge.Player, 'unec', x, y, 0)
      call CreateUnit(scourge.Player, 'nksa', x, y, 0) //Skeleton Archer
      call CreateUnit(scourge.Player, 'nksa', x, y, 0)
      call CreateUnit(scourge.Player, 'ugho', x, y, 0) //Ghoul
      call CreateUnit(scourge.Player, 'ugho', x, y, 0) //Ghoul
      call CreateUnit(scourge.Player, 'ugho', x, y, 0) //Ghoul
      call CreateUnit(scourge.Player, 'ugho', x, y, 0) //Ghoul
    endif
  endfunction

  private function Start takes nothing returns nothing
    local Person scourge = FACTION_SCOURGE.Person
    if scourge != 0 and Enabled == true then
      call DisplayTextToForce(GetPlayersAll(), "The Plague has been unleashed! The citizens of Lordaeron are quickly transforming into mindless zombies.")
      //Spawn 7 plague cauldrons and some free units around them
      call SpawnPlagueCauldron(gg_rct_Plague_1)
      call SpawnPlagueCauldron(gg_rct_Plague_2)
      call SpawnPlagueCauldron(gg_rct_Plague_3)
      call SpawnPlagueCauldron(gg_rct_Plague_4)
      call SpawnPlagueCauldron(gg_rct_Plague_5)
      call SpawnPlagueCauldron(gg_rct_Plague_6)
      call SpawnPlagueCauldron(gg_rct_Plague_7)
    endif
  endfunction

  private function Enable takes nothing returns nothing
    local Person scourge = FACTION_SCOURGE.Person
    if scourge != 0 then
      call DisplayTextToForce(GetPlayersAll(), scourge.Faction.prefixCol + "Kel'thuzad|r has finished preparing the Undead plague. It will soon be unleashed upon the unsuspecting citizens of Lordaeron.")
      call DisplayTextToPlayer(scourge.Player, 0, 0, "You may type -plague to unleash the plague against Lordaeron, or it will activate automatically in 5 minutes. Afterwards you may type -off to deactivate Cauldron Zombie spawns. Type -end to stop citizens from turning into zombies.")
      set Enabled = true
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = null
    local timer tempTimer = null
    local integer i = 0

    set trig = CreateTrigger()
    set tempTimer = CreateTimer()
    call TimerStart(tempTimer, TIME_ENABLE, false, function Enable)

    set trig = CreateTrigger()
    set tempTimer = CreateTimer()
    call TimerStart(tempTimer, TIME_FORCED, false, function Start)

    loop
      exitwhen i > MAX_PLAYERS
      call TriggerRegisterPlayerChatEvent( trig, Player(i), "-plague", false )
      set i = i + 1
    endloop   
    call TriggerAddAction(trig, function Start)
  endfunction

endlibrary