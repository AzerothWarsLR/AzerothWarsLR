library QuestGundrak requires LegendNeutral

  globals
    private constant integer GUNDRAK_RESEARCH = 'R02Q'
  endglobals

  struct QuestGundrak extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Gundrak has fallen. The Drakkari trolls lend their might to the " + this.Holder.Team.Name 
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of Gundrak, the ability to train Warlords"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, GUNDRAK_RESEARCH, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(GUNDRAK_RESEARCH, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Drakkari Fortress", "The Drakkari troll of Gundrak believe their fortress to be impregnable. Capture it to gain their loyalty.", "ReplaceableTextures\\CommandButtons\\BTNTerrorTroll.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_GUNDRAK, false))
      return this
    endmethod
  endstruct

endlibrary