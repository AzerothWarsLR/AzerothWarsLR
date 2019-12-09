library EventThelsamarDarkshireDestroyed initializer OnInit

    private function Dies takes nothing returns nothing
        local Person felHordePerson = PersonsByFaction[FACTION_FEL_HORDE]
        if IsUnitAliveBJ(gg_unit_h05H_1847) == false and IsUnitAliveBJ(gg_unit_h03Y_0077) == false then
            if felHordePerson != 0 then
                call DisplayTextToPlayer(felHordePerson.getPlayer(), 0, 0, "With the destruction of Darkshire and Thelsamar, new reinforcements have been brought through Magtheridon's Demonic Gateways - You may now build Infernal Juggernauts from Hellfire Citadel.")
                call felHordePerson.applyFactionMod(14)
            endif
            call DestroyTrigger(GetTriggeringTrigger())
        endif
    endfunction

    private function OnInit takes nothing returns nothing
        local trigger trig = CreateTrigger()
        call TriggerRegisterUnitEvent( trig, gg_unit_h05H_1847, EVENT_UNIT_DEATH )
        call TriggerRegisterUnitEvent( trig, gg_unit_h03Y_0077, EVENT_UNIT_DEATH )
        call TriggerAddCondition(trig, Condition(function Dies))       
    endfunction    

endlibrary