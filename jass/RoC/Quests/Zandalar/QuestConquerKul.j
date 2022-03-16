library QuestConquerKul requires LegendNeutral, LegendKultiras, TrollSetup

  globals
    private constant integer QUEST_RESEARCH_ID = 'R08D'   //This research is given when the quest is completed
  endglobals

  struct QuestConquerKul extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Before setting sails we need to conquer Kul'tiras"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Unlock shipyards"
    endmethod

    private method operator FailurePopup takes nothing returns string
      return "Zandalar has fallen"
    endmethod

    private method operator FailureDescription takes nothing returns string
      return "You can no longer build shipyards, but you unlock Zulfarrak"
    endmethod

    private method OnFail takes nothing returns nothing
      local unit u
      local group tempGroup
      set tempGroup = CreateGroup()
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Zulfarrak, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) or GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_AGGRESSIVE) then
          if IsUnitType(u, UNIT_TYPE_HERO) == true then
            call KillUnit(u)
          else
            call UnitRescue(u, this.Holder.Player)
          endif
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop   
      call DestroyGroup(tempGroup)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Conquer Boralus", "The Kul'tiran people and their fleet have been a threat to the Zandalari Empire for ages, it is time to put them to rest. ", "ReplaceableTextures\\CommandButtons\\BTNGalleonIcon.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_DAZARALOR, true))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_BORALUS))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary