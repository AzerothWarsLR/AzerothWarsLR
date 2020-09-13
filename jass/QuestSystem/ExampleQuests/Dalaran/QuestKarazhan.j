library QuestKarazhan requires DalaranConfig, LegendNeutral

  struct QuestKarazhan extends QuestData
    private static method create takes nothing returns nothing
      local thistype this = thistype.allocate("Secrets of Karazhan", "The spire of Medivh stands mysteriously idle. Dalaran could make use of its grand magicks.", "Karazhan has been captured. Dalaran's archivists scour its halls for arcane resources." , "ReplaceableTextures\\CommandButtons\\BTNMedivh.blp")
      call this.AddQuestItem(QuestItemCaptureLegend.create(LEGEND_KARAZHAN))
      return this
    endmethod

    private static method OnAdd takes nothing returns nothing
      call FACTION_DALARAN.modObjectLimit('R020', UNLIMITED)   //Rain: An Amalgam
      call FACTION_DALARAN.modObjectLimit('R03M', UNLIMITED)   //Methods of Control
      call FACTION_DALARAN.modObjectLimit('R01B', UNLIMITED)   //A Treatise on Barriers
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_DALARAN.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary