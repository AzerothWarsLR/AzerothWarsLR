library QuestFreeNerzhul requires QuestData, LegendFrostwolf, FrostwolfConfig

  struct QuestFreeNerzhul extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Ner'zhul is finally free from his tortured existence as the bearer of the Helm of Domination. With his dying breath, he passes his wisdom on to Thrall."
    endmethod

    private method OnComplete takes nothing returns nothing
      call AddHeroAttributes(LEGEND_THRALL.Unit, 10, 10, 10)
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Jailor of the Damned", "Before he became the Lich King, Ner'zhul was the chieftain and elder shaman of the Shadowmoon Clan. Perhaps something of his former self still survives within the Frozen Throne.", "ReplaceableTextures\\CommandButtons\\BTNShaman.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(LEGEND_FROZENTHRONE.Unit))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_FROSTWOLF.AddQuest()
    endmethod
  endstruct

endlibrary