library IncomeCommand initializer OnInit requires Income

  globals
    private constant string COMMAND = "-income"
    private constant string INFO_COLOR = "|c00add8e6"
  endglobals
  
  private function Actions takes nothing returns nothing
    local Person whichPerson = Persons[GetPlayerId(GetTriggerPlayer())]
    local real teamMult = (1 - (RMaxBJ(I2R(whichPerson.team.weight - whichPerson.team.maxWeight), 0))*Income_OVERWEIGHT_PENALTY)

    call DisplayTextToPlayer(whichPerson.p, 0, 0, INFO_COLOR + "Income before tax: " + "|r" + R2S(whichPerson.income) + " gold per minute")
    call DisplayTextToPlayer(whichPerson.p, 0, 0, INFO_COLOR + "Team size factor: " + "|rx" + R2S(teamMult))
    call DisplayTextToPlayer(whichPerson.p, 0, 0, INFO_COLOR + "Income after tax: " + "|r" + R2S(whichPerson.income * teamMult) + " gold per minute")
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    local integer i = 0
    
    loop
    exitwhen i > MAX_PLAYERS
      call TriggerRegisterPlayerChatEvent( trig, Player(i), COMMAND, true )
      set i = i + 1
    endloop   
    
    call TriggerAddCondition( trig, Condition(function Actions) )
  endfunction

endlibrary