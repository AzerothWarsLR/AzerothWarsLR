library QuestTuurem requires QuestData, DalaranSetup

  struct QuestTuurem extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The messenger has arrived, Tuurem has been reached in time."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all buildings in Tuurem"
    endmethod

    private method GrantTuurem takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Tuurem
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Tuurem, null)
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
      call this.GrantTuurem(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantTuurem(this.Holder.Player)
    endmethod


    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Warn Tuurem", "The city of Tuurem has to be warned of the imminent Orc invasion", "ReplaceableTextures\\CommandButtons\\BTNCallToArms.blp")
      call this.AddQuestItem(QuestItemAnyUnitInRect.create(gg_rct_Tuurem, "Tuurem", false))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary