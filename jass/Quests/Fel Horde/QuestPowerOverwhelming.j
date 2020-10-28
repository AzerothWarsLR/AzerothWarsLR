library QuestPowerOverwhelming initializer OnInit requires QuestData, FelHordeConfig, QuestItemLegendHasArtifact, LegendFelHorde, ArtifactConfig

  globals
    private constant string ICON_PATH = "ReplaceableTextures\\CommandButtons\\BTNChaosOrb.blp"
  endglobals

  struct QuestPowerOverwhelming extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Magtheridon has consumed the Eye of Sargeras. His scales crackle with fel lightning, and his triumphant roar can be heard leagues away."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "The Eye of Sargeras is consumed. Magtheridon permanently gains twice its stats and all of its abilities, as well as 4000 experience"
    endmethod   

    private method OnComplete takes nothing returns nothing
      call ARTIFACT_EYEOFSARGERAS.setStatus(ARTIFACT_STATUS_HIDDEN)
      call ARTIFACT_EYEOFSARGERAS.setDescription("Consumed")
      call SetItemPosition(ARTIFACT_EYEOFSARGERAS.item, 20195, 24177)
      call UnitAddItem(LEGEND_MAGTHERIDON.Unit, CreateItem('I00Z', 0, 0))
      call AddHeroAttributes(LEGEND_MAGTHERIDON.Unit, 20, 20, 40)
      call AddHeroXP(LEGEND_MAGTHERIDON.Unit, 4000, true)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Power Overwhelming", "The Eye of Sargeras remains somewhere on Azeroth. It rightfully belongs to Magtheridon, Lord of Outland.", ICON_PATH)
      call this.AddQuestItem(QuestItemLegendHasArtifact.create(LEGEND_MAGTHERIDON, ARTIFACT_EYEOFSARGERAS))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_FEL_HORDE.AddQuest(QuestPowerOverwhelming.create())
  endfunction

endlibrary