library QuestWarMachine requires QuestData, ScourgeConfig

  struct QuestWarMachine extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The massive exploitation of Ashenvale has bolstered the entire Horde's weapons, armour and defenses."
    endmethod

    private method BlessPlayer takes player whichPlayer returns nothing
      call SetPlayerTechResearched(whichPlayer, 'Rhme', GetPlayerTechCount(whichPlayer, 'Rhme', true) + 1)
      call SetPlayerTechResearched(whichPlayer, 'Rhar', GetPlayerTechCount(whichPlayer, 'Rhar', true) + 1)
      call SetPlayerTechResearched(whichPlayer, 'Rorb', 3)
      call SetPlayerTechResearched(whichPlayer, 'Rosp', 3)
    endmethod

    private method OnComplete takes nothing returns nothing
      local integer i = 0
      loop
        exitwhen i == MAX_PLAYERS
        if this.Holder.Team.ContainsPlayer(Player(i)) then
          call BlessPlayer(Player(i))
        endif
        set i = i + 1
      endloop
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The War Machine", "The bountiful woodlands of Ashenvale are now accessible to the Horde. It is time to begin harvesting and armament operations.", "ReplaceableTextures\\CommandButtons\\BTNBundleOfLumber.blp")
      call this.AddQuestItem(QuestItemResearch.create('R021'))
      call this.AddQuestItem(QuestItemControlUnit.create(gg_unit_o01I_0449))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_WARSONG.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary