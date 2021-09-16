library QuestCapitalCity requires QuestData, LordaeronSetup, QuestItemKillUnit

  struct QuestCapitalCity extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Capital City has been liberated, and its military is now free to assist the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Capital City"
    endmethod

    private method GrantCapitalcity takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Capitalcity
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Terenas, null)
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
      call this.GrantCapitalcity(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantCapitalcity(this.Holder.Player)
    endmethod

    private method OnAdd takes nothing returns nothing
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Hearthlands", "The territories of Lordaeron is fragmented, regain control of the old alliance's hold to secure the kingdom.", "ReplaceableTextures\\CommandButtons\\BTNCastle.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01M')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01I')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01C')))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary