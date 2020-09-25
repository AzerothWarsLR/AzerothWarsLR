//Garithos is spawned spawns after a timer expires.
library QuestGarithos requires QuestData, LordaeronConfig, LegendLordaeron

  struct QuestGarithos extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Grand General Othmar Garithos has finally arrived with reinforcements."
    endmethod

    private method OnComplete takes nothing returns nothing
      call LEGEND_GARITHOS.Spawn(this.Holder.Player, GetRectCenterX(gg_rct_Garithos), GetRectCenterY(gg_rct_Garithos), 270)
      call UnitDetermineLevel(LEGEND_GARITHOS.Unit, 1.00)
      call CreateUnits((this.Holder.Player, 'hkni', GetRectCenterX(gg_rct_Garithos), GetRectCenterY(gg_rct_Garithos), 270, 24)
    endmethod

    private static method create takes nothing returns nothing
      local thistype this = thistype.allocate("The Grand Marshal", "The Kingdom of Lordaeron is in a dire situation. Grand Marshal Othmar Garithos is on his way, accompanied by a small army.", "ReplaceableTextures\\CommandButtons\\BTNGarithos.blp")
      call this.AddQuestItem(QuestItemTime.create(900))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_LORDAERON.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary