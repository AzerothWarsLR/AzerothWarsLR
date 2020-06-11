library BlackTempleDies initializer OnInit requires FelHordeConfig

  private function Dies takes nothing returns nothing
    call FACTION_FEL_HORDE.modObjectLimit('o01L', -UNLIMITED) //Shattered Hand Executioner
    call FACTION_FEL_HORDE.modObjectLimit('n086', -UNLIMITED) //Death Knight
    call KillUnit(gg_unit_o01C_2371)  //Throne of Kil'jaeden
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterUnitEvent(trig, gg_unit_o00F_0659, EVENT_UNIT_DEATH)
    call TriggerAddCondition(trig, Condition(function Dies))       
  endfunction    

endlibrary