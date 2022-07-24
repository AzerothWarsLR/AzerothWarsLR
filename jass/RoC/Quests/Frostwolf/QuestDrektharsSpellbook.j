library QuestDrektharsSpellbook requires QuestData, Artifact, FrostwolfSetup, LegendFrostwolf, LegendDruids, QuestItemControlLegend, QuestItemAnyUnitInRect, GeneralHelpers

  struct QuestDrektharsSpellbook extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The World Tree, Nordrassil, has been captured by the forces of the Horde. Drek'thar has gifted Warchief Thrall his magical spellbook for this achievement."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "德雷克塔尔的法术书"
    endmethod   

    private method OnComplete takes nothing returns nothing
      call ARTIFACT_DREKTHARSSPELLBOOK.setStatus(ARTIFACT_STATUS_GROUND)
      call UnitAddItemSafe(LEGEND_THRALL.Unit, ARTIFACT_DREKTHARSSPELLBOOK.item)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("德雷克塔尔的法术书", "野蛮的暗夜精灵们威胁着整个部落的安危。占领他们的世界之树并把萨尔带到它的脚下。", "ReplaceableTextures\\CommandButtons\\BTNSorceressMaster.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_NORDRASSIL, false))
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_THRALL, gg_rct_Drekthars_Spellbook, "诺达希尔"))
      return this
    endmethod
  endstruct
  
endlibrary