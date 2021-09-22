library QuestShadowfang requires QuestData, LordaeronSetup, QuestItemKillUnit


  struct QuestShadowfang extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Shadowfang has been liberated, and its military is now free to assist the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Shadowfang"
    endmethod

    private method GrantShadowfang takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Shadowfang
      call GroupEnumUnitsInRect(tempGroup, gg_rct_ShadowfangUnlock, null)
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
      call this.GrantShadowfang(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantShadowfang(this.Holder.Player)
    endmethod

    private method OnAdd takes nothing returns nothing
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Shadows of Silverspine Forest", "The woods of Silverspine are unsafe for travellers, they need to be investigated", "ReplaceableTextures\\CommandButtons\\BTNworgen.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_o02J_0984)) //Worgen
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01D')))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary