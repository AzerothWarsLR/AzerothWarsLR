library EventWildhammer

    //Ironforge gains Falstad Wildhammer, access to the Wildhammer FactionMod, and all units in Aerie Peak.
    //If Ironforge is not in the game, then Stormwind gains the units only.
    //This event is called by other events. 

    globals
        private constant integer RESEARCH = 'RO1T'
    endglobals

    function DoWildhammer takes nothing returns nothing
        local player recipient = Player(PLAYER_NEUTRAL_AGGRESSIVE)
        local Person tempPerson = 0
        local unit falstad = null
        local group tempGroup = CreateGroup()
        local unit u = null

        if PersonsByFaction[FACTION_IRONFORGE] != 0 then                    //Ironforge
            set tempPerson = PersonsByFaction[FACTION_IRONFORGE]
            set recipient = tempPerson.p
            call tempPerson.applyFactionMod(FACTIONMOD_WILDHAMMER)      //Wildhammer
            set falstad = CreateUnit(recipient, 'H028', 14081, 4580, 35)
            call SetHeroXP(falstad, GetHeroXP(gg_unit_H00S_1948), false)        //Set experience of Falstad to be the same as Magni
            call SetPlayerTechResearched(recipient, RESEARCH, 1)                      
        endif

        //Remove pathing blockers obstructing Aerie Peak
        call RemoveDestructable( gg_dest_YTpc_7559 )
        call RemoveDestructable( gg_dest_YTpc_2065 )
        call RemoveDestructable( gg_dest_YTpc_2067 )
        call RemoveDestructable( gg_dest_YTpc_12037 )

        //Transfer all Neutral Passive units in region to one of the above factions
        call GroupEnumUnitsInRect(tempGroup, gg_rct_Aerie_Peak, null)
        set u = FirstOfGroup(tempGroup)
        loop
        exitwhen u == null
            if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
                call SetUnitInvulnerable(u, false)
                call SetUnitOwner(u, recipient, true)
            endif
            call GroupRemoveUnit(tempGroup, u)
            set u = FirstOfGroup(tempGroup)
        endloop

        //Give resources and display message
        call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "King Magni Bronzebeard has traveled to Aerie Peak and enlisted the aid of his Dwarven brethern.")

        //Cleanup
        set falstad = null
        call DestroyGroup(tempGroup)
        set tempGroup = null
    endfunction

endlibrary