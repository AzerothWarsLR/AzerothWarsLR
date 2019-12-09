library EventDarkIron

    //Ironforge gains Dagran, access to the Darl Iron FactionMod, and all units in Shadowforge City.
    //If Ironforge is not in the game, then Stormwind gains the units only.
    //This event is called by other events. 

    globals
        private constant integer RESEARCH = 'R04R'
    endglobals

    function DoDarkIron takes nothing returns nothing
        local player recipient = Player(PLAYER_NEUTRAL_AGGRESSIVE)
        local Person tempPerson = 0
        local unit dagran = null
        local group tempGroup = CreateGroup()
        local unit u = null

        if PersonsByFaction[FACTION_IRONFORGE] != 0 then
            set tempPerson = PersonsByFaction[FACTION_IRONFORGE]
            set recipient = tempPerson.getPlayer()
            call tempPerson.applyFactionMod(12)      //Dark Iron
            set dagran = CreateUnit(recipient, 'H03G', -24540, -30728, 45)
            call SetHeroXP(dagran, GetHeroXP(gg_unit_H00S_1948), false)        //Set experience of Dagran to be the same as Magni
            call SetPlayerTechResearched(recipient, RESEARCH, 1)
        elseif PersonsByFaction[FACTION_STORMWIND] != 0 then
            set tempPerson = PersonsByFaction[FACTION_STORMWIND]
            set recipient = tempPerson.getPlayer()                                
        endif

        //Remove pathing blockers obstructing Shadowforge City
        call RemoveDestructable( gg_dest_YTpc_9638 )
        call RemoveDestructable( gg_dest_YTpc_9639 )
        call RemoveDestructable( gg_dest_YTpc_9637 )
        call RemoveDestructable( gg_dest_YTpc_9363 )
        call RemoveDestructable( gg_dest_YTpc_9372 )
        call RemoveDestructable( gg_dest_YTpc_9371 )
        call RemoveDestructable( gg_dest_YTpc_2452 )
        call RemoveDestructable( gg_dest_YTpc_9364 )

        //Transfer all Neutral Passive units in region to one of the above factions
        call GroupEnumUnitsInRect(tempGroup, gg_rct_Shadowforge_City, null)
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
        call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "King Magni has approached the Dark Iron dwarves and offered an alliance. The Dark Iron clan has reluctantly agreed.")

        //Cleanup
        set dagran = null
        call DestroyGroup(tempGroup)
        set tempGroup = null
    endfunction

endlibrary