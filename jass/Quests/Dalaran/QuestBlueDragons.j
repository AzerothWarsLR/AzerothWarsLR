library QuestBlueDragons requires QuestItemControlLegend, DalaranConfig

  globals
    private constant integer RESEARCH_ID = 'R00U'
    private constant integer DRAGON_ID = 'n0AC'
  endglobals

  struct QuestBlueDragons extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Nexus has been captured. The Blue Dragonflight fights for " + this.Holder.ColoredName + "."
    endmethod

    private method operator RewardDescription takes nothing returns string
      return "Ability to train Blue Dragons from the Nexus."
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, RESEARCH_ID, 1)
      call DisplayUnitTypeAcquired(Holder.Player, DRAGON_ID, "You can now train Blue Dragons from the Nexus.")
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Blue Dragonflight", "The Blue Dragons of Northrend are the wardens of magic on Azeroth. They might be convinced to willingly join the mages of Dalaran.", "ReplaceableTextures\\CommandButtons\\BTNAzureDragon.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_NEXUS))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_DALARAN.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary