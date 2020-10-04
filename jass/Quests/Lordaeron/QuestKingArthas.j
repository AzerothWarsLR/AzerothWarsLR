//Prince Arthas goes to the Frozen Throne after it's destroyed. He becomes King Arthas, gets the Crown of Lordaeron, and Terenas dies.
library QuestKingArthas requires QuestData, LordaeronConfig, LegendLordaeron

  struct QuestKingArthas extends QuestData
    private integer CROWN_ID = 'I001'

    private method operator CompletionPopup takes nothing returns string
      return "With the Lich King eliminated, the Kingdom of Lordaeron is free of its greatest threat. King Terenas Menethil passes peacefully into the night, and Arthas is crowned the new King."
    endmethod

    private method OnComplete takes nothing returns nothing
      set LEGEND_ARTHAS.UnitType = 'Harf'
      //Give Crown of Lordaeron
      if ARTIFACT_CROWNLORDAERON.status < ARTIFACT_STATUS_SPECIAL and ARTIFACT_CROWNLORDAERON.owningPerson == this.Holder.Person then
        call SetItemPosition(ARTIFACT_CROWNLORDAERON.item, GetUnitX(LEGEND_ARTHAS.Unit), GetUnitY(LEGEND_ARTHAS.Unit))
        call UnitAddItem(LEGEND_ARTHAS.Unit, ARTIFACT_CROWNLORDAERON.item)
      endif
      call KillUnit(gg_unit_nemi_0019) //Terenas
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Crown Prince", "Arthas Menethil is the one true heir of the Kingdom of Lordaeron. The only thing standing in the way of his coronation is the world-ending threat of the Scourge.", "ReplaceableTextures\\CommandButtons\\BTNArthas.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_ARTHAS))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_LICHKING))
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_ARTHAS, gg_rct_LichKing))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_LORDAERON.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary