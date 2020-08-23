library QuestNewGuardian initializer OnInit requires DalaranConfig, LegendDalaran, Display, ArtifactConfig

  globals
    private trigger AcquireTrigger

    private QuestItemData QUESTITEM_ACQUIRE
    private QuestItemData QUESTITEM_CAST
    private constant integer ABIL_ID = 'A0BW'
    private constant integer RESEARCH_VALID = 'R04V'
  endglobals

  private function EmpowerGuardian takes unit whichUnit returns nothing
    local Legend whichLegend = Legend.ByHandle(whichUnit)
    call AddSpecialEffectTarget("war3mapImported\\Soul Armor Cosmic.mdx", whichUnit, "chest")
    call BlzSetUnitName(whichUnit, "Guardian of Tirisfal")
    call UnitAddAbility(whichUnit, 'ACm2') //Spell Immunity
    call UnitAddAbility(whichUnit, 'A0BX') //Guardian of Tirisfal Spellbook
    call UnitRemoveAbility(whichUnit, 'A0WD') //Counterspell
    call UnitRemoveAbility(whichUnit, 'A0WG') //Counterspell Spell Book
    call BlzSetUnitIntegerField(whichUnit, UNIT_IF_DEFENSE_TYPE, 6) //Divine
    call BlzSetUnitWeaponIntegerField(whichUnit, UNIT_WEAPON_IF_ATTACK_ATTACK_TYPE, 0, 5) //Chaos
    call SetHeroInt(whichUnit, GetHeroInt(whichUnit, false) + 20, true)
    call whichLegend.ClearUnitDependencies()
    set whichLegend.PermaDies = false
  endfunction

  private function Cast takes nothing returns nothing
    local integer i = 0
    if GetSpellAbilityId() == ABIL_ID then
      call EmpowerGuardian(GetTriggerUnit())
      call FACTION_DALARAN.setQuestItemProgress(QUESTITEM_CAST, QUEST_PROGRESS_COMPLETE, true)

      loop
        exitwhen i == MAX_PLAYERS
        call SetPlayerTechResearched(Player(i), RESEARCH_VALID, 0)
        set i = i + 1
      endloop

      call DestroyTrigger(GetTriggeringTrigger())
      call DestroyTrigger(AcquireTrigger)
    endif
  endfunction

  private function Acquire takes nothing returns nothing
    if GetTriggerArtifact() == ARTIFACT_BOOKOFMEDIVH then
      //Update quest
      if ARTIFACT_BOOKOFMEDIVH.owningPerson.Faction == FACTION_DALARAN then
        call FACTION_DALARAN.setQuestItemProgress(QUESTITEM_ACQUIRE, QUEST_PROGRESS_COMPLETE, true)
      else
        call FACTION_DALARAN.setQuestItemProgress(QUESTITEM_ACQUIRE, QUEST_PROGRESS_INCOMPLETE, true)
      endif
      //Update research
      if ARTIFACT_BOOKOFMEDIVH.owningUnit == LEGEND_JAINA.Unit or ARTIFACT_BOOKOFMEDIVH.owningUnit == LEGEND_ANTONIDAS.Unit then
        call SetPlayerTechResearched(FACTION_DALARAN.Player, RESEARCH_VALID, 1)
      else
        call SetPlayerTechResearched(FACTION_DALARAN.Player, RESEARCH_VALID, 0)
      endif
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig
    local QuestData tempQuest
    local integer i = 0
    set AcquireTrigger = CreateTrigger()
    call OnArtifactOwnerChange.register(AcquireTrigger)
    call TriggerAddAction(AcquireTrigger, function Acquire)

    set trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_SPELL_FINISH)
    call TriggerAddAction(trig, function Cast)

    set tempQuest = QuestData.create("Guardian of Tirisfal", "Medivh's death left Azeroth without a Guardian. The spell book he left behind could be used to empower a new one.", "Dalaran has empowered a new Guardian of Tirisfal, endowing them with a portion of the Council of Tirisfal's power." , "ReplaceableTextures\\CommandButtons\\BTNAstral Blessing.blp")
    set QUESTITEM_ACQUIRE = tempQuest.addItem("Acquire the Book of Medivh")
    set QUESTITEM_CAST = tempQuest.addItem("Use Jaina or Antonidas to cast Empower Guardian")
    call FACTION_DALARAN.addQuest(tempQuest)
    set tempQuest.Global = true

    if GetObjectName(ABIL_ID) == null then
      call BJDebugMsg("ERROR: Empower Guardian ability doesn't exist. QuestNewGuardian won't work")
    endif

    call FACTION_DALARAN.modObjectLimit(RESEARCH_VALID, UNLIMITED)
  endfunction

endlibrary