library QuestT2FelHorde initializer OnInit requires QuestData, FelHordeConfig, QuestItemUnitDead, LegendStormwind, LegendIronforge

  globals
    private constant integer RESEARCH_ID = 'R05Z'
  endglobals

  struct QuestT2FelHorde extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The sheer brutality of Magtheridon's conquest has reached the ears of each of the Fel Horde clans. The Shadowmoon Clan and the Dragonmaw Clan offer up their allegiances, demanding participation in the coming bloodshed."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Unlock tier 2 researches"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, RESEARCH_ID, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.modObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Savage Negotations", "Diplomatic negotations amongst the Fel Orcish clans are prolonged, deadly engagements. Only the destruction of Stormwind and Ironforge will truly rally the clans, for it would signal the beginning of Magtheridon's ultimate invasion.", "ReplaceableTextures\\CommandButtons\\BTNChaosGrunt.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_STORMWINDKEEP))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_GREATFORGE))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_FEL_HORDE.AddQuest(QuestT2FelHorde.create())
  endfunction

endlibrary