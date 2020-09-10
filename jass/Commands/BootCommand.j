library BootCommand initializer OnInit requires LiegeFaction, VassalFaction

  globals
    private constant string COMMAND     = "-boot "
    private string parameter = null
  endglobals

  private function Actions takes nothing returns nothing
    local string enteredString = GetEventPlayerChatString()
    local string content = null
    local Faction targetFaction = 0
    local Person senderPerson = Person.ByHandle(GetTriggerPlayer())
  
  	if SubString( enteredString, 0, StringLength(COMMAND) ) == COMMAND then
    	set content = SubString(enteredString, StringLength(COMMAND), StringLength(enteredString))
      set content = StringCase(content, false)
      set targetFaction = Faction.factionsByName[content]

      if senderPerson.Faction.getType() != LiegeFaction.typeid then
        call DisplayTextToPlayer(senderPerson.Player, 0, 0, "This command can only be used by liege factions.")
        return
      endif

      if targetFaction == 0 then
        call DisplayTextToPlayer(senderPerson.Player, 0, 0, "There is no Faction with the name " + content + ".")
        return
      endif

      if senderPerson.Faction == targetFaction then
        call DisplayTextToPlayer(senderPerson.Player, 0, 0, "You cannot boot yourself from the game.")
        return
      endif

      if targetFaction.Person == 0 then
        call DisplayTextToPlayer(senderPerson.Player, 0, 0, "There is no player with the Faction " + targetFaction.ColoredName + ".")
        return
      endif

      if targetFaction.getType() != VassalFaction.typeid or VassalFaction(targetFaction).Liege != LiegeFaction(senderPerson.Faction) then
        call DisplayTextToPlayer(senderPerson.Player, 0, 0, targetFaction.ColoredName + " is not your vassal.")
        return
      endif

      if targetFaction.Person != 0 then
        call targetFaction.Leave()
        set targetFaction.Person.Faction = 0
        call LiegeFaction(senderPerson.Faction).BanPlayerFromBecomingVassal(targetFaction.Player)
      endif
      
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    local integer i = 0
    if AreCheatsActive == true then
      loop
      exitwhen i > MAX_PLAYERS
        call TriggerRegisterPlayerChatEvent( trig, Player(i), COMMAND, false )
        set i = i + 1
      endloop   
      call TriggerAddAction( trig, function Actions )
    endif
  endfunction

endlibrary