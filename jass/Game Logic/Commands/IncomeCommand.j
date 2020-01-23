library IncomeCommand initializer OnInit requires Income

  globals
    private constant string COMMAND = "-income"
    private constant string INFO_COLOR = "|c00add8e6"
  endglobals
  
  private function Actions takes nothing returns nothing
    local Person whichPerson = Persons[GetPlayerId(GetTriggerPlayer())]
    local real teamMult = (1 - (RMaxBJ(I2R(whichPerson.team.weight - whichPerson.team.maxWeight), 0))*Income_OVERWEIGHT_PENALTY)
    local real upkeepMult = GetPlayerState(whichPerson.p, PLAYER_STATE_GOLD_UPKEEP_RATE)

    call DisplayTextToPlayer(whichPerson.p, 0, 0, INFO_COLOR + "Income before tax: " + "|r" + R2S(whichPerson.income) + " gold per minute")
    if teamMult != 1 or upkeepMult != 1 then
      if teamMult != 1 then
        call DisplayTextToPlayer(whichPerson.p, 0, 0, INFO_COLOR + "Team size factor: " + "|r x" + R2S(teamMult))
      endif
      if upkeepMult != 1 then
        call DisplayTextToPlayer(whichPerson.p, 0, 0, INFO_COLOR + "Upkeep factor: " + "|r x" + R2S(upkeepMult))
      endif
      call DisplayTextToPlayer(whichPerson.p, 0, 0, INFO_COLOR + "Income after tax: " + "|r" + R2S(whichPerson.income * teamMult * upkeepMult) + " gold per minute")
    endif
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