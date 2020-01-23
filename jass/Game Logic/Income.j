library Income initializer OnInit requires Persons

  //**CONFIG**
  globals
    public constant real PERIOD = 1.           //Note that changing this will not change the amount of gold players receive over time
    public constant real OVERWEIGHT_PENALTY = 0.15  //Percentage of income lost per Faction weight over the Team's weight limit
  endglobals
  //**ENDCONFIG

  private function AddPersonIncome takes Person whichPerson returns nothing
    local real teamMult = (1 - (RMaxBJ(I2R(whichPerson.team.weight - whichPerson.team.maxWeight), 0))*OVERWEIGHT_PENALTY)
    local real upkeepMult = (1 - GetPlayerState(whichPerson.p, PLAYER_STATE_GOLD_UPKEEP_RATE))
    call whichPerson.addGold(whichPerson.income * teamMult * upkeepMult)
  endfunction

  private function IncomeTimer takes nothing returns nothing
    local integer i = 0
    loop
    exitwhen i > MAX_PLAYERS
      if not (Persons[i] == 0) then
        if Persons[i].income > 0 then
          call AddPersonIncome(Persons[i])
        endif
      endif
      set i = i + 1
    endloop
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterTimerEvent(trig, PERIOD, true)
    call TriggerAddCondition(trig, Condition(function IncomeTimer))
  endfunction    

endlibrary