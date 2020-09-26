library QuestCorruptArthas requires Persons, GameTimer, GeneralHelpers, LegionConfig, ScourgeConfig, DetermineLevel

  struct QuestCorruptArthas extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Having failed to protect his people, Arthas seizes the cursed runeblade Frostmourne as the instrument of his vengeance. The malevolence of the blade overwhelms him. Arthas is now a loyal Death Knight of the Scourge, and will soon become its greatest champion."
    endmethod

    private method OnComplete takes nothing returns nothing
      set LEGEND_ARTHAS.UnitType = 'Uear'
      call UnitDropAllItems(LEGEND_ARTHAS.Unit)
      call LEGEND_ARTHAS.Spawn(this.Holder.Player, GetRectCenterX(gg_rct_LichKing), GetRectCenterY(gg_rct_LichKing), 135)
      call UnitDetermineLevel(LEGEND_ARTHAS.Unit, 1.00)
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Culling", "When the last bastion of Lordaeron falls, Prince Arthas will abandon his people and join the Scourge as their champion.", "ReplaceableTextures\\CommandButtons\\BTNHeroDeathKnight.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_CAPITALPALACE))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_STRATHOLME))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_TYRSHAND))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_SCOURGE.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary