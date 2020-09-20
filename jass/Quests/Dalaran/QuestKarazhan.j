library QuestKarazhan requires DalaranConfig, LegendNeutral

  struct QuestKarazhan extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Karazhan has been captured. " + this.Holder.ColoredName + "'s  archivists scour its halls for arcane resources."
    endmethod

    private static method OnAdd takes nothing returns nothing
      call Holder.modObjectLimit('R020', UNLIMITED)   //Rain: An Amalgam
      call Holder.modObjectLimit('R03M', UNLIMITED)   //Methods of Control
      call Holder.modObjectLimit('R01B', UNLIMITED)   //A Treatise on Barriers
    endmethod

    private static method create takes nothing returns nothing
      local thistype this = thistype.allocate("Secrets of Karazhan", "The spire of Medivh stands mysteriously idle. Dalaran could make use of its grand magicks.", "ReplaceableTextures\\CommandButtons\\BTNMedivh.blp")
      call this.AddQuestItem(QuestItemCaptureLegend.create(LEGEND_KARAZHAN))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_DALARAN.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary