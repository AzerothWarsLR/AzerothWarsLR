library QuestWarMachine initializer OnInit requires QuestData, ScourgeConfig

  struct QuestWarMachine extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The massive exploitation of Ashenvale has bolstered the entire Horde's weapons, armour and defenses."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "You and all of your allies gain the researches " + GetObjectName('Rhme') + ", " + GetObjectName('Rhar') + ", " + GetObjectName('Rorb') + ", and " + GetObjectName('Rosp')
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

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The War Machine", "The bountiful woodlands of Ashenvale are now accessible to the Horde. It is time to begin harvesting and armament operations.", "ReplaceableTextures\\CommandButtons\\BTNBundleOfLumber.blp")
      call this.AddQuestItem(QuestItemResearch.create('R021'))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_LUMBERCAMP, false))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_WARSONG.AddQuest(QuestWarMachine.create())
  endfunction

endlibrary