library QuestKillRagnaros requires QuestItemKillUnit, IronforgeConfig

  globals
    private constant integer RESEARCH_ID = 'R043'
  endglobals

  struct QuestKillRagnaros extends QuestData
    method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(FACTION_IRONFORGE.Player, RESEARCH_ID, 1)
      call DisplayResearchAcquired(FACTION_IRONFORGE.Player, RESEARCH_ID, 1)
    endmethod

    static method create takes nothing returns nothing
      local thistype this = thistype.allocate(unitToKill)
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_N00D_1457))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_IRONFORGE.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary