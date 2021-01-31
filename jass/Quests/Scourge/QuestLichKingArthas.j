library QuestLichKingArthas initializer OnInit requires QuestData, ScourgeConfig, Artifact

  globals
    private constant integer LEVEL_REQUIREMENT = 15
  endglobals

  struct QuestLichKingArthas extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Arthas has ascended the Frozen Throne itself and shattered Ner'zhul's frozen prison. Ner'zhul and Arthas are now joined, body and soul, into one being: the god-like Lich King."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Arthas becomes the Lich King"
    endmethod

    private method OnComplete takes nothing returns nothing
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
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Ascension", "From within the depths of the Frozen Throne, the Lich King Ner'zhul cries out for his champion. Release the Helm of Domination from its confines and merge its power with that of the Scourge's greatest Death Knight.", "ReplaceableTextures\\CommandButtons\\BTNRevenant.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_ARTHAS, false))
      call this.AddQuestItem(QuestItemLegendLevel.create(LEGEND_ARTHAS, 15))
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_ARTHAS, gg_rct_LichKing, "Icecrown Citadel"))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_SCOURGE.AddQuest(QuestLichKingArthas.create())
  endfunction

endlibrary