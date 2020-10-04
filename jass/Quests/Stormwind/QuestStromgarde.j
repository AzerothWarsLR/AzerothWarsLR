library QuestStromgarde requires QuestData, QuelthalasConfig, LegendNeutral

  struct QuestStromgarde extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Galen Trollbane has pleged his forces to Stormwind's cause."
    endmethod

    private method GiveStromgarde takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      if whichPlayer == FACTION_STORMWIND.Player then
        call UnitDetermineLevel(gg_unit_H00Z_1936, 1.0)
      else
        call RemoveUnit(gg_unit_H00Z_1936)  
      endif
      //Transfer all Neutral Passive units in Stromgarde
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Stromgarde, null)
      loop
        set u = FirstOfGroup(tempGroup)
        exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, this.Holder.Person.Player)
        endif
        call GroupRemoveUnit(tempGroup, u)
      endloop
      //Cleanup
      call DestroyGroup(tempGroup)
      set tempGroup = null
    endmethod

    private method OnFail takes nothing returns nothing
      call this.GiveStromgarde(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GiveStromgarde(this.Holder.Player)
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Stromgarde", "Although Stromgarde's strength has dwindled since the days of the Arathorian Empire, it remains a significant bastion of humanity. They could be convinced to mobilize their forces for Stormwind.", "ReplaceableTextures\\CommandButtons\\BTNTheCaptain.blp")
      call this.AddQuestItem(QuestItemAnyUnitInRect.create(gg_rct_Stromgarde, "Stromgarde", true))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_STORMWIND.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary