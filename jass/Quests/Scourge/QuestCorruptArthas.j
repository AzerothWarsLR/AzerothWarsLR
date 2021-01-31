library QuestCorruptArthas initializer OnInit requires Persons, GameTimer, GeneralHelpers, LegionConfig, ScourgeConfig, DetermineLevel

  struct QuestCorruptArthas extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Having failed to protect his people, Arthas seizes the cursed runeblade Frostmourne as the instrument of his vengeance. The malevolence of the blade overwhelms him. Arthas is now a loyal Death Knight of the Scourge, and will soon become its greatest champion."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Gain control of Arthas as a Death Knight"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetUnitOwner(LEGEND_ARTHAS.Unit, this.Holder.Player, true)
      set LEGEND_ARTHAS.UnitType = 'Uear'
      call UnitDropAllItems(LEGEND_ARTHAS.Unit)
      call LEGEND_ARTHAS.Spawn(this.Holder.Player, -3623, 21213, 135)
      set LEGEND_ARTHAS.PlayerColor = PLAYER_COLOR_PURPLE
      call UnitDetermineLevel(LEGEND_ARTHAS.Unit, 1.00)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Culling", "When the last bastion of Lordaeron falls, Prince Arthas will abandon his people and join the Scourge as their champion.", "ReplaceableTextures\\CommandButtons\\BTNHeroDeathKnight.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_CAPITALPALACE))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_STRATHOLME))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_TYRSHAND))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_SCOURGE.AddQuest(QuestCorruptArthas.create())
  endfunction

endlibrary