//Chen Stormstout joins the Warsong when a Warsong unit approaches him.

library EventChenStormstout initializer OnInit requires WarsongConfig

  globals
    private constant integer CHEN_RESEARCH = 'R037'

    private QuestData QUEST_CHEN
    private QuestItemData QUESTITEM_VISIT
  endglobals

  private function EntersRegion takes nothing returns nothing
    if FACTION_WARSONG.Person.Team.containsPlayer(GetOwningPlayer(GetTriggerUnit())) then
      call SetPlayerTechResearched(FACTION_WARSONG.Person.p, CHEN_RESEARCH, 1)
      call UnitRescue(gg_unit_h04E_2670, FACTION_WARSONG.Person.p)
    endif
  endfunction

  //If Warsong leaves, just remove Chen
  private function PersonFactionChanges takes nothing returns nothing
    if GetChangingPersonPrevFaction() == FACTION_WARSONG then
      call RemoveUnit(gg_unit_h04E_2670)
      call FACTION_WARSONG.setQuestItemStatus(QUESTITEM_VISIT, QUEST_PROGRESS_FAILED, true)
    endif
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = null

    set trig = CreateTrigger()
    call TriggerRegisterEnterRectSimple(trig, gg_rct_Chen)
    call TriggerAddAction(trig, function EntersRegion)  

    set trig = CreateTrigger()
    call OnPersonFactionChange.register(trig)
    call TriggerAddAction(trig, function PersonFactionChanges)  

    //Quest setup
    set QUEST_CHEN = QuestData.create("The Wandering Brewmaster", "Rumours tell of a strange white-furred creature from a foreign land. Perhaps it could be convinced to join the Horde.", "Chen Stormstout has joined the Horde.", "ReplaceableTextures\\CommandButtons\\BTNPandarenBrewmaster.blp")
    set QUESTITEM_VISIT = QUEST_CHEN.addItem("Bring a unit to Chen Stormstout")
    call FACTION_WARSONG.addQuest(QUEST_CHEN)
  endfunction
endlibrary