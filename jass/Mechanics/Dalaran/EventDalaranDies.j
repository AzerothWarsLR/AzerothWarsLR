//When Dalaran is destroyed, remove its ability to damage Undead units

library EventDalaranDies initializer OnInit

  private function Dies takes nothing returns nothing
    //call DisableTrigger( gg_trg_Dalaran_Generator_Aura )
    //call RemoveWeatherEffectBJ( udg_DalaranAura )
    call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "With the Violet Citadel destroyed, the mystical aura surrounding it has fallen as well. The Undead are no longer harmed by its effects, and Demons can be Instantiated into the city.")   
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    call TriggerRegisterUnitEvent( trig, gg_unit_h002_0230, EVENT_UNIT_DEATH )
    call TriggerAddCondition( trig, Condition(function Dies) )
  endfunction

endlibrary