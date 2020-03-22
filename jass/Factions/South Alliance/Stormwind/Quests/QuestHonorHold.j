//When Hellfire Citadel is destroyed, give Honor Hold to Stormwind if they are in the game, and modify doodads for visuals.
//If Stormwind is not in the game, do nothing.

library QuestHonorHold initializer OnInit requires QuestData, StormwindConfig, GeneralHelpers

  globals
    private QuestData QUEST_HONORHOLD
    private QuestItemData QUESTITEM_KILL
  endglobals

  private function Build takes nothing returns nothing
    local group tempGroup = CreateGroup()
    local Person tempPerson = PersonsByFaction[FACTION_STORMWIND]  //Stormwind
    local player recipient = tempPerson.p 

    //Transfer all Neutral Passive units in HonorHold to one of the above factions
    call UnitRescue(gg_unit_h05Z_3325, recipient)  //Honor Hold
    call UnitRescue(gg_unit_hbla_3319, recipient)  //Blacksmith  
    call UnitRescue(gg_unit_h03W_1656, recipient)  //Danath Trollbane
    call UnitRescue(gg_unit_hgtw_3320, recipient)  //Guard Tower
    call UnitRescue(gg_unit_hars_3321, recipient)  //Arcane Sanctum

    //Display message
    call FACTION_STORMWIND.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)  

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

    set QUEST_HONORHOLD = QuestData.create("Honor Hold", "Despite Outland's incredibly harsh climate, some Alliance forces have managed to make a home there - a town called Honor Hold. If the threat of Hellfire Citadel were to be eliminated, Honor Hold could become a useful forward base.", "Honor Hold is now free from the constant looming threat of Hellfire Citadel. Danath Trollbane and his people elect to rejoin the Alliance.", "ReplaceableTextures\\CommandButtons\\BTNHumanBarracks.blp")
    set QUESTITEM_KILL = QUEST_HONORHOLD.addItem("Destroy Hellfire Citadel")
    call FACTION_STORMWIND.addQuest(QUEST_HONORHOLD)
  endfunction

endlibrary