library EventBecomeNega requires IllidariConfig, QuelthalasConfig, TeamConfig, Artifact

    function DoBecomeNaga takes nothing returns nothing
        local Person triggerPerson = PersonsByFaction[FACTION_QUELTHELAS]
        local player triggerPlayer = triggerPerson.getPlayer()
        local Artifact tempArtifact = Artifact.artifactsByType['I007']

        call DisplayTextToForce(GetPlayersAll(), "Prince Kael'thas of Quel'thelas, desperate after the destruction of the Sunwell, has accepted aid from the Sea Witch Lady Vashj. He has been accused of betraying the alliance by Grand Marshal Garithos, and is awaiting summary execution in Dalaran Prison.")

        //If the Sunwell is already lost, apply punishment protocols
        if GetOwningPlayer(gg_unit_n001_0165) != triggerPlayer then
            if tempArtifact != 0 then
                call SetItemPosition(tempArtifact.item, 22784., 23755.)
                call tempArtifact.setStatus(ARTIFACT_STATUS_HIDDEN)
                call tempArtifact.setDescription("Hidden in the Dalaran Dungeons")
                call DisplayTextToPlayer(triggerPlayer, 0, 0, "Once you have escaped the Dalaran Prison, return to the Dalaran Dungeons to retrieve the Skull of Gul'dan.")
            endif
        endif

        //Transfer Sylvanas hero experience and items to Vashj before deleting her
        call SetHeroXP(gg_unit_Hvsh_1946, GetHeroXP(gg_unit_Hvwd_1515), false)
        call UnitTransferItems(gg_unit_Hvwd_1515, gg_unit_Hvsh_1946)
        call RemoveUnit(gg_unit_Hvwd_1515)

        //Move Kael'thas to Dalaran Dungeons and change owner temporarily to avoid him getting nuked in the next step
        call SetUnitPosition(gg_unit_Hkal_0630, GetRectCenterX(gg_rct_Kael_Prison_Location), GetRectCenterY(gg_rct_Kael_Prison_Location))
        call SetUnitOwner(gg_unit_Hkal_0630, Player(PLAYER_NEUTRAL_PASSIVE), false)
        call SetUnitState(gg_unit_Hkal_0630, UNIT_STATE_LIFE, GetUnitState(gg_unit_Hkal_0630, UNIT_STATE_MAX_LIFE))
        call SetUnitState(gg_unit_Hkal_0630, UNIT_STATE_MANA, GetUnitState(gg_unit_Hkal_0630, UNIT_STATE_MAX_MANA))

        //Put Quel'thalas back in the North Alliance, take away his resources, and kick him out again. This is just for building transfer
        call triggerPerson.setTeam(1)
        call SetPlayerState(triggerPlayer, PLAYER_STATE_RESOURCE_GOLD, 0)
        call SetPlayerState(triggerPlayer, PLAYER_STATE_RESOURCE_LUMBER, 0)
        call triggerPerson.leave()

        //Change faction and team
        if triggerPerson != 0 then
            call triggerPerson.setTeam(TEAM_ILLIDARI)
            call triggerPerson.setFaction(FACTION_ILLIDARI)
        endif

        //Grant ownership of Kael prison units and pan camera
        call ShowUnit(gg_unit_h03L_3529, true)
        call ShowUnit(gg_unit_h03L_3528, true)
        call ShowUnit(gg_unit_Hvsh_1946, true)
        call SetUnitOwner(gg_unit_h03L_3529, triggerPlayer, true)
        call SetUnitOwner(gg_unit_h03L_3528, triggerPlayer, true)
        call SetUnitOwner(gg_unit_Hvsh_1946, triggerPlayer, true)
        call SetUnitOwner(gg_unit_Hkal_0630, triggerPlayer, true)
        call KillDestructable(gg_dest_XTmp_17808)
        if GetLocalPlayer() == triggerPlayer then
          call SetCameraPosition(17415, -30249)
        endif

        //Cleanup
        set triggerPlayer = null
    endfunction

endlibrary