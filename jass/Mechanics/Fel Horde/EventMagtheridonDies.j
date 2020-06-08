//When Magtheridon dies while the Black Temple is already destroyed, he dies permanently.

library EventMagtheridonDies initializer OnInit

    private function Dies takes nothing returns nothing
        if GetUnitTypeId(GetTriggerUnit()) == 'Nmag' and not IsUnitAliveBJ(gg_unit_o00F_0659) then        //Black Temple
            call DestroyEffect(AddSpecialEffect("Objects\\Spawnmodels\\Undead\\UCancelDeath\\UCancelDeath.mdl", GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit())) )
            call DisplayTextToForce(GetPlayersAll(), "Magtheridon, ruler of Outland, has fallen.")
            call RemoveUnit(GetTriggerUnit())
            call DestroyTrigger(GetTriggeringTrigger())
        endif
    endfunction

    private function OnInit takes nothing returns nothing
        local trigger trig = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_DEATH )
        call TriggerAddCondition(trig, Condition(function Dies))      
    endfunction

endlibrary