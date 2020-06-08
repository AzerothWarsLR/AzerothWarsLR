//Chen Stormstout is a demihero that, when approached by someone with Warsong or True Horde in their team, is given to Warsong or True Horde.

library EventChenStormstout initializer OnInit requires Persons, WarsongConfig, MannorothConfig

  globals
    private Set EligibleFactions
    private constant integer CHEN_RESEARCH = 'R037'

    private QuestData QUEST_CHEN
    private QuestItemData QUESTITEM_VISIT
  endglobals

  private function EnableUnitForPlayer takes unit u, player p returns nothing
    call ShowUnit(u, true)
    call SetUnitInvulnerable(u, false)
    call SetUnitOwner(u, p, true)
  endfunction

  private function PersonGrantChen takes Person whichPerson returns nothing
    call SetPlayerTechResearched(whichPerson.p, CHEN_RESEARCH, 1)
    call EnableUnitForPlayer(gg_unit_h04E_2670, whichPerson.p) //Chen Stormstout
  endfunction

  private function EntersRegion takes nothing returns nothing
    local Person triggerPerson = Persons[GetPlayerId(GetOwningPlayer(GetTriggerUnit()))]
    local Person tempPerson
    local integer i = 0

    //If the entering unit is in the same team as an eligible Faction, give Chen to the first player from that group
    loop
      exitwhen i == EligibleFactions.size
      set tempPerson = PersonsByFaction[EligibleFactions[i]]
      if triggerPerson.team.containsPlayer(tempPerson.p) then
        call FACTION_WARSONG.setQuestItemStatus(QUESTITEM_VISIT, QUEST_PROGRESS_COMPLETE, true)
        call FACTION_MANNOROTH.setQuestItemStatus(QUESTITEM_VISIT, QUEST_PROGRESS_COMPLETE, true)
        call PersonGrantChen(tempPerson)
        call DestroyTrigger(GetTriggeringTrigger())
        return
      endif
      set i = i + 1
    endloop
  endfunction

  //If Warsong leaves, just remove Chen
  private function PersonFactionChanges takes nothing returns nothing
    if GetChangingPersonPrevFaction() == FACTION_WARSONG and GetTriggerPerson().faction != FACTION_MANNOROTH then
      call RemoveUnit(gg_unit_h04E_2670)
      call FACTION_WARSONG.setQuestItemStatus(QUESTITEM_VISIT, QUEST_PROGRESS_FAILED, true)
      call FACTION_MANNOROTH.setQuestItemStatus(QUESTITEM_VISIT, QUEST_PROGRESS_FAILED, true)
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

    set EligibleFactions = Set.create()
    call EligibleFactions.add(FACTION_WARSONG)
    call EligibleFactions.add(FACTION_MANNOROTH)  

    //Quest setup
    set QUEST_CHEN = QuestData.create("The Wandering Brewmaster", "Rumours tell of a strange white-furred creature from a foreign land. Perhaps it could be convinced to join the Horde.", "Chen Stormstout has joined the Horde.", "ReplaceableTextures\\CommandButtons\\BTNPandarenBrewmaster.blp")
    set QUESTITEM_VISIT = QUEST_CHEN.addItem("Bring a unit to Chen Stormstout")
    call FACTION_WARSONG.addQuest(QUEST_CHEN)
    call FACTION_MANNOROTH.addQuest(QUEST_CHEN)
  endfunction
endlibrary