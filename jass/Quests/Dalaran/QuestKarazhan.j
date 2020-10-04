library QuestKarazhan initializer OnInit requires DalaranConfig, LegendNeutral

  struct QuestKarazhan extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Karazhan has been captured. " + this.Holder.ColoredName + "'s  archivists scour its halls for arcane resources."
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.modObjectLimit('R020', UNLIMITED)   //Rain: An Amalgam
      call Holder.modObjectLimit('R03M', UNLIMITED)   //Methods of Control
      call Holder.modObjectLimit('R01B', UNLIMITED)   //A Treatise on Barriers
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Secrets of Karazhan", "The spire of Medivh stands mysteriously idle. Dalaran could make use of its grand magicks.", "ReplaceableTextures\\CommandButtons\\BTNMedivh.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_KARAZHAN))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_DALARAN.AddQuest(QuestKarazhan.create())
  endfunction

endlibrary