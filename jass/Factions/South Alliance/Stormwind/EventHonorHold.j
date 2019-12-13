//When Hellfire Citadel is destroyed, give Honor Hold to Stormwind if they are in the game, and modify doodads for visuals.
//If Stormwind is not in the game, do nothing.

library EventHonorHold initializer OnInit requires Persons, Faction

    globals
        private trigger TriggerDies = null
    endglobals

    private function Reveal takes unit u, player p returns nothing
        call SetUnitOwner(u, p, true)
        call ShowUnit(u, true)
        call SetUnitInvulnerable(u, false)
    endfunction

    private function Build takes nothing returns nothing
        local group tempGroup = CreateGroup()
        local Person tempPerson = PersonsByFaction[FACTION_STORMWIND]  //Stormwind
        local player recipient = tempPerson.p 

        //Transfer all Neutral Passive units in HonorHold to one of the above factions
        call Reveal(gg_unit_h05Z_3325, recipient)  //Honor Hold
        call Reveal(gg_unit_hbla_3319, recipient)  //Blacksmith  
        call Reveal(gg_unit_h03W_1656, recipient)  //Danath Trollbane
        call Reveal(gg_unit_hgtw_3320, recipient)  //Guard Tower
        call Reveal(gg_unit_hars_3321, recipient)  //Arcane Sanctum

        //Display message
        call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "With the destruction of Hellfire Citadel, Danath Trollbane decides to aid Varian Wrynn and his allies while repairs begin on Honor Hold.")  

        //Set animations of doodads within Honor Hold
        call SetDoodadAnimationRectBJ( "hide", 'ISrb', gg_rct_HonorHold )
        call SetDoodadAnimationRectBJ( "hide", 'LSst', gg_rct_HonorHold )
        call SetDoodadAnimationRectBJ( "unhide", 'CSra', gg_rct_HonorHold )    

        //Cleanup
        call DestroyGroup (TempGroup)
        call DestroyTrigger(GetTriggeringTrigger())
        set recipient = null
        set tempGroup = null
    endfunction

    private function Dies takes nothing returns nothing
        if GetUnitTypeId(GetTriggerUnit()) == 'o008' and PersonsByFaction[FACTION_STORMWIND] != 0 then
            call Build()
        endif
    endfunction

    private function OnInit takes nothing returns nothing
        local trigger trig = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_DEATH )
        call TriggerAddCondition(trig, Condition(function Dies))       
    endfunction

endlibrary