library QuestKelthuzad initializer OnInit requires QuestData, ScourgeConfig, LegendScourge, LegendQuelthalas, SortScourgeLegends

  globals
    private QuestData QUEST_KELTHUZAD
    private QuestItemData QUESTITEM_KELTHUZAD
  endglobals

  private function EntersRegion takes nothing returns nothing
    if GetTriggerUnit() == LEGEND_KELTHUZAD.Unit and FACTION_SCOURGE.Person.Team.containsPlayer(GetOwningPlayer(LEGEND_SUNWELL.Unit)) then
      call FACTION_SCOURGE.setQuestItemStatus(QUESTITEM_KELTHUZAD, QUEST_PROGRESS_COMPLETE, true)
      set LEGEND_KELTHUZAD.UnitType = UNITTYPE_KELTHUZAD_LICH
      set LEGEND_KELTHUZAD.PermaDies = false
      call SetUnitState(LEGEND_KELTHUZAD.Unit, UNIT_STATE_LIFE, GetUnitState(LEGEND_KELTHUZAD.Unit, UNIT_STATE_MAX_LIFE))
      call SetUnitState(LEGEND_KELTHUZAD.Unit, UNIT_STATE_MANA, GetUnitState(LEGEND_KELTHUZAD.Unit, UNIT_STATE_MAX_MANA))
      call SetHeroXP(LEGEND_KELTHUZAD.Unit, KelthuzadExp, false)
      call DestroyEffect(AddSpecialEffect("war3mapImported\\Soul Beam Blue.mdx", GetUnitX(LEGEND_KELTHUZAD.Unit), GetUnitY(LEGEND_KELTHUZAD.Unit)))
      call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl", GetUnitX(LEGEND_KELTHUZAD.Unit), GetUnitY(LEGEND_KELTHUZAD.Unit)))
      call SortScourgeLegends()
      call DestroyTrigger(GetTriggeringTrigger())
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterEnterRectSimple(trig, gg_rct_Sunwell)
    call TriggerAddCondition(trig, Condition(function EntersRegion))     

    set QUEST_KELTHUZAD = QuestData.create("Life Beyond Death", "Kel'thuzad is the leader of the Cult of the Damned and an extraordinarily powerful necromancer. If he were to be brought to the Sunwell and submerged in its waters, he would be reanimated as an immortal Lich.", "Kel'thuzad has been reanimated and empowered through the unlimited magical energies of the Sunwell. He now has the ability to summon the Burning Legion.", "ReplaceableTextures\\CommandButtons\\BTNLichVersion2.blp")
    set QUESTITEM_KELTHUZAD = QUEST_KELTHUZAD.addItem("Bring Kel'thuzad to the Sunwell")
    call FACTION_SCOURGE.addQuest(QUEST_KELTHUZAD)           
  endfunction

endlibrary