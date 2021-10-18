library QuestMaievOutland requires Persons, QuelthalasSetup, GeneralHelpers

  struct QuestMaievOutland extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "Maiev's Outland outpost have been constructed."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of Maiev's Outland outpost and moves Maiev to Outland"
    endmethod    

    private method GiveMaievOutland takes player whichPlayer returns nothing
      local unit u

      //Transfer all Neutral Passive units in MaievOutland to one of the above factions
      set u = FirstOfGroup(udg_MaievUnlockOutland)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) and GetUnitFoodUsed(u) != 10  then
          call UnitRescue(u, whichPlayer)
        else
          if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, Player(PLAYER_NEUTRAL_PASSIVE))
          endif
        endif
        call GroupRemoveUnit(udg_MaievUnlockOutland, u)
        set u = FirstOfGroup(udg_MaievUnlockOutland)
      endloop

      //Cleanup
      call DestroyGroup(udg_MaievUnlockOutland)
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetUnitPosition(LEGEND_MAIEV.Unit, -5252, -27597)
      call UnitRemoveAbilityBJ( 'A0J5', LEGEND_MAIEV.Unit)
      call this.GiveMaievOutland(this.Holder.Player)
      set this.Holder.Team = TEAM_NAGA
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Driven by Vengeance", "Maiev drive for vengeance leads her to chase Illidan all the way to other worlds.", "ReplaceableTextures\\CommandButtons\\BTNMaievArmor.blp")
      call this.AddQuestItem(QuestItemCastSpell.create('A0J5', true))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_MAIEV, true))
      return this
    endmethod
  endstruct

endlibrary