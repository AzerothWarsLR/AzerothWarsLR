library QuestLichKingArthas initializer OnInit requires QuestData, ScourgeConfig, Artifact

  globals
    private constant integer LEVEL_REQUIREMENT = 15

    private QuestData QUEST_LICHKINGARTHAS
    public QuestItemData QUESTITEM_LICHKINGARTHAS_GETARTHAS
    private QuestItemData QUESTITEM_LICHKINGARTHAS_LEVELARTHAS
    private QuestItemData QUESTITEM_LICHKINGARTHAS_GOTHRONE
  endglobals

  private function EntersRegion takes nothing returns nothing
    if LEGEND_ARTHAS.OwningFaction == FACTION_SCOURGE and GetTriggerUnit() == LEGEND_ARTHAS.Unit and GetHeroLevel(GetTriggerUnit()) >= LEVEL_REQUIREMENT then
      call PlayThematicMusicBJ( "Sound\\Music\\mp3Music\\LichKingTheme.mp3" )
      set LEGEND_LICHKING.Hivemind = false
      set LEGEND_LICHKING.DeathMessage = ""
      call KillUnit(LEGEND_LICHKING.Unit)
      set LEGEND_ARTHAS.UnitType = 'N023'
      set LEGEND_ARTHAS.PermaDies = true
      set LEGEND_ARTHAS.Hivemind = true
      set LEGEND_ARTHAS.DeathMessage = "The great Lich King has been destroyed. With no central mind to command them, the forces of the Undead have gone rogue."
      call UnitDetermineLevel(LEGEND_ARTHAS.Unit, 1.00)
      call SetUnitState(LEGEND_ARTHAS.Unit, UNIT_STATE_LIFE, GetUnitState(LEGEND_ARTHAS.Unit, UNIT_STATE_MAX_LIFE))
      call SetUnitState(LEGEND_ARTHAS.Unit, UNIT_STATE_MANA, GetUnitState(LEGEND_ARTHAS.Unit, UNIT_STATE_MAX_MANA))
      call UnitAddItem(LEGEND_ARTHAS.Unit, ARTIFACT_HELMOFDOMINATION.item)
      call FACTION_SCOURGE.setQuestItemProgress(QUESTITEM_LICHKINGARTHAS_GOTHRONE, QUEST_PROGRESS_COMPLETE, true)
      call DestroyTrigger(GetTriggeringTrigger())
    endif
  endfunction

  private function UnitGainsLevel takes nothing returns nothing
    if LEGEND_ARTHAS.OwningFaction == FACTION_SCOURGE and GetTriggerUnit() == LEGEND_ARTHAS.Unit and GetHeroLevel(GetTriggerUnit()) >= LEVEL_REQUIREMENT then
      call FACTION_SCOURGE.setQuestItemProgress(QUESTITEM_LICHKINGARTHAS_LEVELARTHAS, QUEST_PROGRESS_COMPLETE, true)
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
    set QUESTITEM_LICHKINGARTHAS_LEVELARTHAS = QUEST_LICHKINGARTHAS.addItem("Get Arthas to level " + I2S(LEVEL_REQUIREMENT))
    set QUESTITEM_LICHKINGARTHAS_GOTHRONE = QUEST_LICHKINGARTHAS.addItem("Bring Arthas to the Frozen Throne")
    call FACTION_SCOURGE.addQuest(QUEST_LICHKINGARTHAS)            
  endfunction

endlibrary