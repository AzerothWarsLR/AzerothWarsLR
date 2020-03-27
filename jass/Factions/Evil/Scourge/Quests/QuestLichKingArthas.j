library QuestLichKingArthas initializer OnInit requires QuestData, ScourgeConfig, Artifact

  globals
    private constant integer LEVEL_REQUIREMENT = 15

    private QuestData QUEST_LICHKINGARTHAS
    public QuestItemData QUESTITEM_LICHKINGARTHAS_GETARTHAS
    private QuestItemData QUESTITEM_LICHKINGARTHAS_LEVELARTHAS
    private QuestItemData QUESTITEM_LICHKINGARTHAS_GOTHRONE
  endglobals

  private function CreateLichKing takes nothing returns nothing
    local unit DeathKnight = GetTriggerUnit()
    local unit LichKing = null
    local item tempItem = null
    local integer i = 0
    local Artifact tempArtifact = Artifact.artifactsByType['I01Y']

    call PlayThematicMusicBJ( "Sound\\Music\\mp3Music\\LichKingTheme.mp3" )
    set LichKing = CreateUnit(GetOwningPlayer(DeathKnight), 'N023', -3464, 20914, 135) 
    call SetHeroLevel(LichKing, 12, false)
    loop
    exitwhen i > 6
      call UnitAddItem(LichKing, UnitItemInSlot(DeathKnight, i))
      set i = i + 1
    endloop
    if tempArtifact != 0 then
      call UnitAddItem(LichKing, tempArtifact.item)
    endif
    call RemoveUnit(gg_unit_u000_0649)      //The Frozen Throne
    call RemoveUnit(GetTriggerUnit())
    //call DisableTrigger( gg_trg_ThrallnNZ )
    //call DisableTrigger( gg_trg_Throne_Protection_2 )
    call FACTION_SCOURGE.setQuestItemStatus(QUESTITEM_LICHKINGARTHAS_GOTHRONE, QUEST_PROGRESS_COMPLETE, true)
    //Cleanup
    set DeathKnight = null
    set LichKing = null     
    set tempItem = null 
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function EntersRegion takes nothing returns nothing
    if GetUnitTypeId(GetTriggerUnit()) == 'Uear' and GetHeroLevel(GetTriggerUnit()) >= LEVEL_REQUIREMENT then
      call CreateLichKing()
    endif
  endfunction

  private function UnitGainsLevel takes nothing returns nothing
    if GetUnitTypeId(GetTriggerUnit()) == 'Uear' and GetHeroLevel(GetTriggerUnit()) >= LEVEL_REQUIREMENT then
      call FACTION_SCOURGE.setQuestItemStatus(QUESTITEM_LICHKINGARTHAS_LEVELARTHAS, QUEST_PROGRESS_COMPLETE, true)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterEnterRectSimple(trig, gg_rct_LichKing)
    call TriggerAddCondition(trig, Condition(function EntersRegion))    

    set trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_HERO_LEVEL)
    call TriggerAddAction(trig, function UnitGainsLevel)

    set QUEST_LICHKINGARTHAS = QuestData.create("The Ascension", "From within the depths of the Frozen Throne, the Lich King Ner'zhul cries out for his champion. Release the Helm of Domination from its confines and merge its power with that of the Scourge's greatest Death Knight.", "Arthas has ascended the Frozen Throne itself and shattered Ner'zhul's frozen prison. Ner'zhul and Arthas are now joined, body and soul, into one being: the god-like Lich King.", "ReplaceableTextures\\CommandButtons\\BTNRevenant.blp")
    set QUEST_LICHKINGARTHAS.Global = true
    set QUESTITEM_LICHKINGARTHAS_GETARTHAS = QUEST_LICHKINGARTHAS.addItem("Corrupt Prince Arthas")
    set QUESTITEM_LICHKINGARTHAS_LEVELARTHAS = QUEST_LICHKINGARTHAS.addItem("Get Arthas to level 18")
    set QUESTITEM_LICHKINGARTHAS_GOTHRONE = QUEST_LICHKINGARTHAS.addItem("Bring Arthas to the Frozen Throne")
    call FACTION_SCOURGE.addQuest(QUEST_LICHKINGARTHAS)            
  endfunction

endlibrary