library QuestStratholme requires QuestData, LordaeronSetup, QuestItemKillUnit


  struct QuestStratholme extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Stratholme has been liberated, and its military is now free to assist the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Stratholme"
    endmethod

    private method GrantStratholme takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Stratholme
      call GroupEnumUnitsInRect(tempGroup, gg_rct_StratholmeUnlock, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) and GetUnitFoodUsed(u) != 10  then
          call UnitRescue(u, whichPlayer)
        else
          if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, Player(PLAYER_NEUTRAL_PASSIVE))
          endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null      
    endmethod

    private method OnFail takes nothing returns nothing
      call this.GrantStratholme(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantStratholme(this.Holder.Player)
    endmethod

    private method OnAdd takes nothing returns nothing
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Clear the Outskirts", "The Blackrock clan has taken over Alterac, they must be eliminated for the safety of Lordaeron", "ReplaceableTextures\\CommandButtons\\BTNChaosBlademaster.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_o00B_1316)) //Jubei
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n019')))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary