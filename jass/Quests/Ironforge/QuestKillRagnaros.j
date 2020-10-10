library QuestKillRagnaros initializer OnInit requires QuestItemKillUnit, IronforgeConfig

  globals
    private constant integer RESEARCH_ID = 'R043'
  endglobals

  struct QuestKillRagnaros extends QuestData
    method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, RESEARCH_ID, 1)
      call DisplayResearchAcquired(Holder.Player, RESEARCH_ID, 1)
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "Ragnaros has been slain. His essence has been harvested and will be put to use immediately."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "A research improving your fire based units"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Harness the Inferno", "The Firelord Ragnaros resides deep within the Molten Core. With his death, the elemental smiths of Ironforge could leverage his primal fire to enhance their creations.", "ReplaceableTextures\\CommandButtons\\BTNOrbOfFire.blp")
      call this.AddQuestItem(QuestItemKillLegend.create(LEGEND_RAGNAROS))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_IRONFORGE.AddQuest(QuestKillRagnaros.create())
  endfunction

endlibrary