//Garithos is spawned spawns after a timer expires.

library EventGarithosSpawn initializer OnInit requires LordaeronConfig, DetermineLevel

  globals
    private constant real TIMER = 960.
  endglobals

  private function GarithosSpawn takes nothing returns nothing
    local unit arthas = gg_unit_Hart_1342
    local unit garithos = null
    local real x = 10597
    local real y = 3228
    local Person tempPerson = PersonsByFaction[FACTION_LORDAERON]
    local player p = tempPerson.p
    local integer i = 0
    call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Garithos has finally arrived with reinforcements for the Alliance.")            
    set garithos = CreateUnit(p, 'Hlgr', x, y, 270)      //Garithos

    call SetHeroXP(garithos, GetHeroXP(arthas), false)
    //Transfer items to Garithos
    loop
    exitwhen i > 6
      call UnitAddItem(garithos, UnitItemInSlot(arthas, i))
      set i = i + 1
    endloop        

    set i = 0
    loop
    exitwhen i > 12
      call CreateUnit(p, 'n03K', x, y, 270)   //Chaplain
      call CreateUnit(p, 'nchp', x, y, 270)   //Cleric
      call CreateUnit(p, 'h01C', x, y, 270)   //Longbowman
      call CreateUnit(p, 'hkni', x, y, 270)   //Knight
      call CreateUnit(p, 'hkni', x, y, 270)   //Knight
      set i = i + 1
    endloop

    set i = 0
    loop
    exitwhen i > 4
      call CreateUnit(p, 'hpea', x, y, 270)   //Peasant
      set i = i + 1
    endloop   

    call RemoveUnit(arthas)

    //Cleanup
    set arthas = null
    set garithos = null
  endfunction

  private function TimerEnds takes nothing returns nothing
    local Person lordaeron = PersonsByFaction[FACTION_LORDAERON]
    if lordaeron != 0 then
      call GarithosSpawn()
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    set trig = CreateTrigger()
    call TriggerRegisterTimerEvent(trig, TIMER, false)
    call TriggerAddAction(trig, function TimerEnds)   
  endfunction

endlibrary