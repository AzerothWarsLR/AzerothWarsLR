library QuestKillCenarius requires QuestData, WarsongConfig

  struct QuestKillCenarius extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Demigod has fallen! Warsong is supreme!"
    endmethod

    private method OnComplete takes nothing returns nothing
      call AddHeroXP(LEGEND_GROM.Unit, 2000, true)
      call AddHeroAttributes(LEGEND_GROM.Unit, 5, 5, 5)
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Hunter of Shadows", "The Night Elves are protected by a towering stag-like creature they call a demigod. Even he cannot stand against the might of the Warsong.", "ReplaceableTextures\\CommandButtons\\BTNKeeperOfTheGrove.blp")
      call this.AddQuestItem(QuestItemKillLegend.create(LEGEND_CENARIUS))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_WARSONG.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary