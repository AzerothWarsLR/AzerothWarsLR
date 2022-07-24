//Invites the specified faction's player to the sender's Team. 

library InviteCommand initializer OnInit requires Team

	globals
    private constant string COMMAND = "-invite "
  endglobals

	private function Actions takes nothing returns nothing
  	local string enteredString = GetEventPlayerChatString()
    local string content = null
    local Faction targetFaction = 0
    local Person senderPerson = Person.ByHandle(GetTriggerPlayer())
   
    if AreAllianceActive == true then
  	  if SubString( enteredString, 0, StringLength(COMMAND) ) == COMMAND then
    	  set content = SubString(enteredString, StringLength(COMMAND), StringLength(enteredString))
        set content = StringCase(content, false)
        set targetFaction = Faction.factionsByName[content]

        if targetFaction == 0 then
          call DisplayTextToPlayer(senderPerson.Player, 0, 0, "没有一个叫" + content + "的队伍")
          return
        endif

        if targetFaction.CanBeInvited == false then
          call DisplayTextToPlayer(senderPerson.Player, 0, 0, targetFaction.prefixCol + targetFaction.Name + "不能自愿的更换势力")
        endif

        if senderPerson.Faction == targetFaction then
          call DisplayTextToPlayer(senderPerson.Player, 0, 0, "你不能邀请自己加入自己的势力。")
          return
        endif

        if targetFaction.Person == 0 then
          call DisplayTextToPlayer(senderPerson.Player, 0, 0, "没有属于" + targetFaction.prefixCol + targetFaction.Name + "|r的玩家。")
          return
        endif

        if targetFaction.Person != 0 then
          call senderPerson.Faction.Team.Invite(targetFaction)
        endif

      endif
    else 
      call DisplayTextToPlayer(senderPerson.Player, 0, 0, "你还不能结盟")
    endif 
  endfunction

	private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    local integer i = 0
  
    loop
    exitwhen i > MAX_PLAYERS
    	call TriggerRegisterPlayerChatEvent( trig, Player(i), COMMAND, false )
      set i = i + 1
    endloop

    call TriggerAddAction(trig, function Actions)
 	endfunction

endlibrary 