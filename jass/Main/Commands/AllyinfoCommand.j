 library AllyinfoCommand initializer OnInit requires Income

  globals
    private constant string COMMAND = "-ally"
    private constant string INFO_COLOR = "|c00add8e6"
  endglobals

  private function Actions takes nothing returns nothing
    local Person whichPerson = Person.ByHandle(GetTriggerPlayer())

    call DisplayTextToPlayer(whichPerson.Player, 0, 0, "结盟指令现在是: 
-invite (势力名字)
-join (队伍名字)
-uninvite (势力名字)
-unally")

  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    local integer i = 0

    loop
    exitwhen i > MAX_PLAYERS
      call TriggerRegisterPlayerChatEvent( trig, Player(i), COMMAND, false )
      set i = i + 1
    endloop   

    call TriggerAddCondition( trig, Condition(function Actions) )
  endfunction

endlibrary 