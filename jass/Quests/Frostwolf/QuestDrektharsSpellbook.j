library QuestDrektharsSpellbook requires QuestData, Artifact, FrostwolfConfig, LegendFrostwolf, LegendDruids, QuestItemCaptureLegend, QuestItemAnyHeroInRect

  struct QuestDrektharsSpellbook extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The World Tree, Nordrassil, has been captured by the forces of the Horde. Drek'thar has gifted Warchief Thrall his magical spellbook for this achievement."
    endmethod

    private method OnComplete takes nothing returns nothing
      call UnitAddItem(LEGEND_THRALL.Unit, ARTIFACT_DREKTHARSSPELLBOOK.item)
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Drekthar's Spellbook", "The savage Night Elves threaten the safety of the entire Horde. Capture their World Tree and bring Thrall to its roots.", "ReplaceableTextures\\CommandButtons\\BTNSorceressMaster.blp")
      set this.fallbackFaction = fallbackFaction
      call this.AddQuestItem(QuestItemCaptureLegend.create(LEGEND_NORDRASSIL))
      call this.AddQuestItem(QuestItemAnyHeroInRect.create(gg_rct_Crossroads))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_FROSTWOLF.AddQuest()
    endmethod
  endstruct

endlibrary