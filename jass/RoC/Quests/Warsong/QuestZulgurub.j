library QuestZulgurub requires LegendNeutral

  globals
    private constant integer ZULGURUB_RESEARCH = 'R02M'
  endglobals

  struct QuestZulgurub extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Zul'Gurub has fallen. The Gurubashi trolls lend their might to the " + this.Holder.Team.Name 
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of Zul'Gurub, the ability to train Gurubashi Ravagers"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, ZULGURUB_RESEARCH, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(ZULGURUB_RESEARCH, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Heart of Hakkar", "The Gurubashi troll of Zul'Gurub follow the sacred Heart of Hakkar, hidden within the Shrine. Capture it to gain their loyalty.", "ReplaceableTextures\\CommandButtons\\BTNTrollRavager.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_ZULGURUB, false))
      return this
    endmethod
  endstruct

endlibrary