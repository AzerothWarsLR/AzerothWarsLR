library QuestCrystalGolem requires QuestItemCaptureLegend, DalaranConfig, LegendLegion

  globals
    private constant integer RESEARCH_ID = 'R045'
  endglobals

  struct QuestBlueDragons extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return this.Holder.ColoredName + "'s Earth Golems have been infused with living crystal."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Transform your Earth Golems into Crystal Golems."
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, RESEARCH_ID, 1)
      call DisplayResearchAcquired(Holder.Player, RESEARCH_ID, 1)
      call Holder.modObjectLimit('n096', -6)
      call Holder.modObjectLimit('n0AD', 6)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.modObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Crystalsong Forest", "The living crystal of the Crystalsong Forest suffers from its proximity to the Legion. Freed from that corruption, it could be used to empower Dalaran's constructs.", "ReplaceableTextures\\CommandButtons\\BTNRockGolem.blp")
      call this.AddQuestItem(QuestItemCaptureUnitType.create('n02R'))
      call this.AddQuestItem(QuestItemKillLegend.create(LEGEND_LEGIONNEXUS))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_DALARAN.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary