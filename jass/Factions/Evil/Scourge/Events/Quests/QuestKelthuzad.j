library QuestKelthuzad initializer OnInit requires QuestData, ScourgeConfig, EventKelthuzadDeath, QuelthalasConfig

  globals
    QuestData QUEST_KELTHUZAD
    QuestItemData QUESTITEM_KELTHUZAD
  endglobals

  private function CreateLich takes nothing returns nothing
    local unit Necromancer = GetTriggerUnit()
    local unit Lich = null
    local item tempItem = null
    local integer i = 0

    call PlayThematicMusicBJ( "Sound\\Music\\mp3Music\\LichKingTheme.mp3" )
    set Lich = CreateUnit(GetOwningPlayer(GetTriggerUnit()), 'Uktl', 18560, 21261, 270) 
    if GetUnitTypeId(GetTriggerUnit()) == 'U001' then   //Normal necromancer
      call SetHeroXP(Lich, GetHeroXP(GetTriggerUnit()), false)
    else                                                //Ghost
      call SetHeroXP(Lich, KelthuzadExp, false)
    endif
    loop
    exitwhen i > 6
      call UnitAddItem(Lich, UnitItemInSlot(Necromancer, i))
      set i = i + 1
    endloop
    call RemoveUnit(GetTriggerUnit())
    call FACTION_SCOURGE.setQuestItemStatus(QUESTITEM_KELTHUZAD, QUEST_PROGRESS_COMPLETE, true)
    //Cleanup
    set Necromancer = null
    set Lich = null     
    set tempItem = null 
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function EntersRegion takes nothing returns nothing
    local Person triggerPerson = Persons[GetPlayerId(GetOwningPlayer(gg_unit_n001_0165))]
    local Person scourgePerson = PersonsByFaction[FACTION_SCOURGE]
    if (GetUnitTypeId(GetTriggerUnit()) == 'U001' or GetUnitTypeId(GetTriggerUnit()) == 'uktg') and triggerPerson.team.containsPlayer(scourgePerson.p) then
      call CreateLich()
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