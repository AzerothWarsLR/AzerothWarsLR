library QuestThunderEagle requires QuestData, ControlPoint, LordaeronConfig, LegendLegion

  globals
    private constant integer RESEARCH_ID = 'R04L'
    private constant integer THUNDER_EAGLE_ID = 'nwe2'
  endglobals

  struct QuestThunderEagle extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Thunder Eagles, now in safe hands " + this.Holder.ColoredName + "."
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
      call DisplayUnitTypeAcquired(this.Holder.Player, THUNDER_EAGLE_ID, "You can now train Thunder Eagles from upgraded Town Halls and from your capitals.")
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("To the Skies!", "The Thunder Eagles of the Storm Peaks live in fear of the Legion. Wipe out the Legion Nexus to bring these great birds out into the open.", "ReplaceableTextures\\CommandButtons\\BTNWarEagle.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_LEGIONNEXUS))
      call this.AddQuestItem(QuestItemCaptureUnitType.create('n02S'))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_LORDAERON.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary