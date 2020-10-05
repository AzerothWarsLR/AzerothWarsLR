library QuestKultiras initializer OnInit requires QuestData, DetermineLevel, DalaranConfig

  struct QuestKultiras extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Admiral Daelin Prodmoore has finally mobilized Kul'tiras for war, and is now ready to aid " + this.Holder.Team.Name + " forces on the mainland."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Gain the hero Daein Proudmoore and control of all units at Kul'tiras"
    endmethod

    private static method GrantToPlayer takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u = null

      //Level Admiral Proudmoore
      call ShowUnit(LEGEND_DAELIN.Unit, true)
      call UnitDetermineLevel(LEGEND_DAELIN.Unit, 1.0)

      //Reveal and grant all units in Kul'tiras
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Kultiras, null)
      loop
        set u = FirstOfGroup(tempGroup)
        exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call SetUnitOwner(u, whichPlayer, true)
          call ShowUnit(u, true)
          call SetUnitInvulnerable(u, false)
        endif
        call GroupRemoveUnit(tempGroup, u)
      endloop

      //Remove pathing blockers
      call RemoveDestructable( gg_dest_B011_23621 )
      call RemoveDestructable( gg_dest_B011_23622 )
      call RemoveDestructable( gg_dest_B00A_23623 )
      call RemoveDestructable( gg_dest_B011_23624 )
      call RemoveDestructable( gg_dest_B00A_23625 )

      //Cleanup
      call DestroyGroup(tempGroup)
      set tempGroup = null
    endmethod

    private method OnComplete takes nothing returns nothing
      call thistype.GrantToPlayer(this.Holder.Player)
    endmethod

    private method OnFail takes nothing returns nothing
      call thistype.GrantToPlayer(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The City at Sea", "The independent nation of Kul'tiras is conspicuously absent from the Second War. Hopefully they arrive soon.", "ReplaceableTextures\\CommandButtons\\BTNProudmoore.blp")
      call this.AddQuestItem(QuestItemTime.create(480))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_DALARAN.AddQuest(QuestKultiras.create())
  endfunction

endlibrary