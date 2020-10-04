library QuestDrektharsSpellbook initializer OnInit requires QuestData, Artifact, FrostwolfConfig, LegendFrostwolf, LegendDruids, QuestItemControlLegend, QuestItemAnyUnitInRect

  struct QuestDrektharsSpellbook extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The World Tree, Nordrassil, has been captured by the forces of the Horde. Drek'thar has gifted Warchief Thrall his magical spellbook for this achievement."
    endmethod

    private method OnComplete takes nothing returns nothing
      call UnitAddItem(LEGEND_THRALL.Unit, ARTIFACT_DREKTHARSSPELLBOOK.item)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Drekthar's Spellbook", "The savage Night Elves threaten the safety of the entire Horde. Capture their World Tree and bring Thrall to its roots.", "ReplaceableTextures\\CommandButtons\\BTNSorceressMaster.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_NORDRASSIL))
      call this.AddQuestItem(QuestItemAnyUnitInRect.create(gg_rct_Drekthars_Spellbook, "Nordrassil", true))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_FROSTWOLF.AddQuest(QuestDrektharsSpellbook.create())
  endfunction

endlibrary