library QuestKillCenarius initializer OnInit requires QuestData, WarsongConfig, MannorothConfig

  globals
    private QuestData QUEST_CENARIUS
    private QuestItemData QUESTITEM_KILL
  endglobals

  private function Dies takes nothing returns nothing
    local Person killingPerson = Persons[GetPlayerId(GetOwningPlayer(GetKillingUnit()))]
    if LEGEND_CENARIUS.Unit != null and GetTriggerUnit() == LEGEND_CENARIUS.Unit then 
      if killingPerson.team.containsPlayer(FACTION_WARSONG.whichPerson.p) or killingPerson.team.containsPlayer(FACTION_MANNOROTH.whichPerson.p) then
        call AddHeroXP(LEGEND_GROM.Unit, 2000, true)
        call AddHeroAttributes(LEGEND_GROM.Unit, 5, 5, 5)
        call FACTION_WARSONG.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)
        call FACTION_MANNOROTH.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)
      else
        call FACTION_WARSONG.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_FAILED, true)
        call FACTION_MANNOROTH.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_FAILED, true)
      endif
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig
    local integer i = 0
    local unit u = null

    set trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddAction(trig, function Dies)

    //Quest setup
    set QUEST_CENARIUS = QuestData.create("Thorn in Our Side", "The Night Elves are protected by a towering stag-like creature they call a demigod. Even he cannot stand against the might of the Warsong.", "The Demigod has fallen! Warsong is supreme!", "ReplaceableTextures\\CommandButtons\\BTNKeeperOfTheGrove.blp")
    set QUESTITEM_KILL = QUEST_CENARIUS.addItem("Kill Cenarius")
    call FACTION_WARSONG.addQuest(QUEST_CENARIUS)
    call FACTION_MANNOROTH.addQuest(QUEST_CENARIUS)
  endfunction

endlibrary