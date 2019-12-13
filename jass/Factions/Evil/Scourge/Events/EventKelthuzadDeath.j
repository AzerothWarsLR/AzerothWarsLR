library EventKelthuzadDeath initializer OnInit

  //When Kel'thuzad (Necromancer) is slain by the North Alliance
  //Record his experience, and create Kel'thuzad (Ghost) as a replacement
  //This experience is given to Kel'thuzad (Lich) in EventKelthuzadLich

  globals
    integer KelthuzadExp = 0
  endglobals

  private function Dies takes nothing returns nothing
    local real x = 0
    local real y = 0
    local real face = 0
    local unit u = null
    local player p = null
    local Person killingPerson = 0
    local Team killingTeam = 0
    //Kel'thuzad (Necromancer) is slain
    if GetUnitTypeId(GetTriggerUnit()) == 'U001' then
        set killingPerson = Persons[GetPlayerId(GetOwningPlayer(GetKillingUnit()))]
        set killingTeam = killingPerson.team
        if killingTeam != 0 and killingTeam  == TEAM_SCOURGE then
          call DisplayTextToForce( GetPlayersAll(), "Kel'Thuzad has been slain. His spirit lives on in spectral form, and he can be revived by taking him to the Sunwell." )
          set u = GetTriggerUnit()
          set KelthuzadExp = GetHeroXP(u)
          set x = GetUnitX(u)
          set y = GetUnitY(u)
          set face = GetUnitFacing(u)
          set p = GetOwningPlayer(u)
          call RemoveUnit(GetTriggerUnit())
          call CreateUnit(p, 'uktg', x, y, face)

          //Cleanup
          set u = null
          set p = null
          call DestroyTrigger(GetTriggeringTrigger())    
        endif        
    endif

    //Cleanup
    set p = null
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition(trig, Condition(function Dies))            
  endfunction

endlibrary