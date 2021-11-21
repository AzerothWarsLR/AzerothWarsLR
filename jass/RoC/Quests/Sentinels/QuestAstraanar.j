library QuestAstranaar requires QuestData, SentinelsSetup

  struct QuestAstranaar extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Astranaar has been relieved and has joined the Sentinels in their war effort"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Astranaar Outpost and Darnassus"
    endmethod

    private method GrantAstranaar takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Astranaar
      call GroupEnumUnitsInRect(tempGroup, gg_rct_AstranaarUnlock, null)
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

    private method GrantDarnassus takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Darnassus
      call GroupEnumUnitsInRect(tempGroup, gg_rct_TeldrassilAmbient, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) and GetUnitFoodUsed(u) != 10  then
          call UnitRescue(u, whichPlayer)
        else
          if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, Player(PLAYER_NEUTRAL_PASSIVE))
          endif
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null      
    endmethod

    private method OnFail takes nothing returns nothing
      call this.GrantAstranaar(Player(PLAYER_NEUTRAL_AGGRESSIVE))
      call this.GrantDarnassus(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantAstranaar(this.Holder.Player)
      call this.GrantDarnassus(this.Holder.Player)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Astranaar Stronghold", "Darkshore is under attack by some Murloc. We should deal with them swiftly and then make for the Astranaar Outpost. Clearing the Murlocs will also reestablish communication with Darnassus.", "ReplaceableTextures\\CommandButtons\\BTNMurloc.blp")
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_TYRANDE, gg_rct_AstranaarUnlock, "Astranaar Outpost"))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n02U')))
      call this.AddQuestItem(QuestItemExpire.create(1430))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary