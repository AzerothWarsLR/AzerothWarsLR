library QuestWarMachine initializer OnInit requires QuestData, WarsongConfig

  globals
    private QuestData QUEST_WARMACHINE
    private QuestItemData QUESTITEM_RESEARCH

    private integer Progress = QUEST_PROGRESS_UNDISCOVERED
  endglobals

  private function BlessPlayer takes player whichPlayer returns nothing
    call SetPlayerTechResearched(whichPlayer, 'Rhme', GetPlayerTechCount(whichPlayer, 'Rhme', true) + 1)
    call SetPlayerTechResearched(whichPlayer, 'Rhar', GetPlayerTechCount(whichPlayer, 'Rhar', true) + 1)
    call SetPlayerTechResearched(whichPlayer, 'Rorb', 3)
    call SetPlayerTechResearched(whichPlayer, 'Rosp', 3)
  endfunction

  private function ChangesOwnership takes nothing returns nothing
    if GetOwningPlayer(GetTriggerUnit()) != Player(PLAYER_NEUTRAL_PASSIVE) and Progress == QUEST_PROGRESS_UNDISCOVERED then
      call FACTION_WARSONG.setQuestItemStatus(QUESTITEM_RESEARCH, QUEST_PROGRESS_INCOMPLETE, true)
      call DestroyTrigger(GetTriggeringTrigger())
    endif
  endfunction

  private function Dies takes nothing returns nothing
    if Progress < QUEST_PROGRESS_COMPLETE then
      call FACTION_WARSONG.setQuestItemStatus(QUESTITEM_RESEARCH, QUEST_PROGRESS_FAILED, true)
    endif
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function Research takes nothing returns nothing
    local integer i = 0
    if GetResearched() == 'R021' then
      set Progress = QUEST_PROGRESS_COMPLETE
      loop
        exitwhen i == MAX_PLAYERS
        if FACTION_WARSONG.Person.Team.containsPlayer(Player(i)) then
          call BlessPlayer(Player(i))
        endif
        set i = i + 1
      endloop
      call FACTION_WARSONG.setQuestItemStatus(QUESTITEM_RESEARCH, QUEST_PROGRESS_COMPLETE, true)
    endif
  endfunction  

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH)
    call TriggerAddAction(trig, function Research)

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent(trig, gg_unit_o01I_0449, EVENT_UNIT_DEATH)
    call TriggerAddAction(trig, function Dies)

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent(trig, gg_unit_o01I_0449, EVENT_UNIT_CHANGE_OWNER)
    call TriggerAddAction(trig, function ChangesOwnership)

    set QUEST_WARMACHINE = QuestData.create("The War Machine", "The bountiful woodlands of Ashenvale are now accessible to the Horde. It is time to begin harvesting and armament operations.", "The massive exploitation of Ashenvale has bolstered the entire Horde's weapons, armour and defenses.", "ReplaceableTextures\\CommandButtons\\BTNBundleOfLumber.blp")
    set QUESTITEM_RESEARCH = QUEST_WARMACHINE.addItem("Research Horde War Machine")
    call FACTION_WARSONG.addQuest(QUEST_WARMACHINE)
    call FACTION_WARSONG.setQuestItemStatus(QUESTITEM_RESEARCH, QUEST_PROGRESS_UNDISCOVERED, false)
  endfunction

endlibrary