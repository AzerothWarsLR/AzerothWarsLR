library QuestKelthuzad initializer OnInit requires QuestData, ScourgeConfig, LegendScourge, LegendQuelthalas

  globals
    private QuestData QUEST_KELTHUZAD
    private QuestItemData QUESTITEM_KELTHUZAD
    private constant integer LICH_ID = 'Uktl'
  endglobals

  private function EntersRegion takes nothing returns nothing
    if GetTriggerUnit() == LEGEND_KELTHUZAD.Unit and FACTION_SCOURGE.Person.Team.containsPlayer(GetOwningPlayer(LEGEND_SUNWELL.Unit)) then
      call FACTION_SCOURGE.setQuestItemStatus(QUESTITEM_KELTHUZAD, QUEST_PROGRESS_COMPLETE, true)
      set LEGEND_KELTHUZAD.UnitType = LICH_ID
      call DestroyTrigger(GetTriggeringTrigger())
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterEnterRectSimple(trig, gg_rct_Sunwell)
    call TriggerAddCondition(trig, Condition(function EntersRegion))     

    set QUEST_KELTHUZAD = QuestData.create("Fall of Silvermoon", "Kel'thuzad is the leader of the Cult of the Damned and an extraordinarily powerful necromancer. If he were to be brought to the Sunwell and submerged in its waters, he would be reanimated as an immortal Lich.", "Kel'thuzad has been reanimated and empowered through the unlimited magical energies of the Sunwell. He now has the ability to summon the Burning Legion.", "ReplaceableTextures\\CommandButtons\\BTNLichVersion2.blp")
    set QUESTITEM_KELTHUZAD = QUEST_KELTHUZAD.addItem("Bring Kel'thuzad to the Sunwell")
    call FACTION_SCOURGE.addQuest(QUEST_KELTHUZAD)           
  endfunction

endlibrary