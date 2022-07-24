library QuestHalaar requires QuestData, DalaranSetup

  struct QuestHalaar extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The messenger has arrived, Halaar has been reached in time."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all buildings in Halaar"
    endmethod

    private method GrantHalaar takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Halaar
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Halaar, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, whichPlayer)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null      
    endmethod

    private method OnFail takes nothing returns nothing
      call this.GrantHalaar(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantHalaar(this.Holder.Player)
    endmethod


    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Warn Halaar", "The city of Halaar has to be warned of the imminent Orc invasion", "ReplaceableTextures\\CommandButtons\\BTNCallToArms.blp")
      call this.AddQuestItem(QuestItemAnyUnitInRect.create(gg_rct_Halaar, "Halaar", false))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary