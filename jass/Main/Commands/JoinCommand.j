//Joins the specified Team. Only works if an Invite has first been extended. 

library JoinCommand initializer OnInit requires Team

	globals
    private constant string COMMAND = "-join "
  endglobals

	private function Actions takes nothing returns nothing
  	local string enteredString = GetEventPlayerChatString()
    local string content = null
    local Team targetTeam = 0
    local Person triggerPerson = Person.ByHandle(GetTriggerPlayer())

    if triggerPerson.Faction.CanBeInvited == false then
      call DisplayTextToPlayer(triggerPerson.Player, 0, 0, "你不能自愿的改变阵营。")
    endif

  	if SubString( enteredString, 0, StringLength(COMMAND) ) == COMMAND then
    	set content = SubString(enteredString, StringLength(COMMAND), StringLength(enteredString))
      set content = StringCase(content, false)
      set targetTeam = Team.teamsByName[content]
      if targetTeam != 0 then
        if targetTeam.IsFactionInvited(triggerPerson.Faction) then
          set triggerPerson.Faction.Team = targetTeam
          call DisplayTextToPlayer(triggerPerson.Player, 0, 0, "你加入了" + targetTeam.Name + "。")
          call targetTeam.DisplayText(triggerPerson.Faction.prefixCol + triggerPerson.Faction.Name + "|r加入了" + targetTeam.Name + "。")
        else
          call DisplayTextToPlayer(triggerPerson.Player, 0, 0, "你还未被邀请加入" + targetTeam.Name + ".")
        endif
      else
        call DisplayTextToPlayer(triggerPerson.Player, 0, 0, "没有一个叫" + targetTeam.Name + "的队伍。")
      endif
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