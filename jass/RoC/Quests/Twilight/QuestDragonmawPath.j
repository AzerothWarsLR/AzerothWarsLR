
library QuestDragonmawPath requires Persons, TwilightSetup, GeneralHelpers

  struct QuestDragonmawPath extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "The Dragonmaw clan has reformed and has joined the new Horde."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Change your faction to the Dragonmaw Clan and join the Horde"
    endmethod  

    private method RemoveStartingUnits takes nothing returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      call GroupEnumUnitsInRect(tempGroup, gg_rct_DragonmawPathUnlock, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        call RemoveUnit(u)
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null      
    endmethod  

    private method RemoveOriginalUnits takes nothing returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      call GroupEnumUnitsInRect(tempGroup, gg_rct_TwilightOutside, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        call RemoveUnit(u)
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null      
    endmethod 

    private method OnComplete takes nothing returns nothing
      local integer i = 0
      loop
        exitwhen i > MAX_PLAYERS
        if not this.Holder.Team.ContainsPlayer(Player(i)) then
          call SetPlayerAlliance(Player(i), this.Holder.Player, ALLIANCE_SHARED_VISION, false)
        endif
        set i = i + 1
      endloop
      
      call this.Holder.obliterate()
      call this.RemoveOriginalUnits()
      call DisableTrigger( gg_trg_Cataclysm )
      call DisableTrigger( gg_trg_CorruptWorker )
      call DisableTrigger( gg_trg_GoldCultistLoop )


      //call SetPlayerAllianceStateBJ( Player(0), Player(19), bj_ALLIANCE_UNALLIED )
     // call SetPlayerAllianceStateBJ( Player(1), Player(19), bj_ALLIANCE_UNALLIED )
     // call SetPlayerAllianceStateBJ( Player(2), Player(19), bj_ALLIANCE_UNALLIED )
     // call SetPlayerAllianceStateBJ( Player(3), Player(19), bj_ALLIANCE_UNALLIED )
     // call SetPlayerAllianceStateBJ( Player(4), Player(19), bj_ALLIANCE_UNALLIED )
    // call SetPlayerAllianceStateBJ( Player(5), Player(19), bj_ALLIANCE_UNALLIED )
    //  call SetPlayerAllianceStateBJ( Player(6), Player(19), bj_ALLIANCE_UNALLIED )
    //  call SetPlayerAllianceStateBJ( Player(7), Player(19), bj_ALLIANCE_UNALLIED )
    //  call SetPlayerAllianceStateBJ( Player(10), Player(19), bj_ALLIANCE_UNALLIED )
    //  call SetPlayerAllianceStateBJ( Player(12), Player(19), bj_ALLIANCE_UNALLIED )
    //  call SetPlayerAllianceStateBJ( Player(17), Player(19), bj_ALLIANCE_UNALLIED )
    //  call SetPlayerAllianceStateBJ( Player(22), Player(19), bj_ALLIANCE_UNALLIED )
    //  call SetPlayerAllianceStateBJ( Player(23), Player(19), bj_ALLIANCE_UNALLIED )

      call SetPlayerAbilityAvailableBJ( false, 'A0BW', Player(19) )
      call SetPlayerAbilityAvailableBJ( false, 'A0OI', Player(19) )

      set this.Holder.Person.Faction = FACTION_DRAGONMAW
      call RescueNeutralUnitsInRect(gg_rct_DragonmawPathUnlock, FACTION_DRAGONMAW.Player)
      call AdjustPlayerStateBJ( 250, FACTION_DRAGONMAW.Player, PLAYER_STATE_RESOURCE_GOLD )
      call AdjustPlayerStateBJ( 500, FACTION_DRAGONMAW.Player, PLAYER_STATE_RESOURCE_LUMBER )
      call RemoveUnit(gg_unit_o03I_0466)
    
    endmethod

    private method OnFail takes nothing returns nothing
        call this.RemoveStartingUnits()
        call SetPlayerTechResearched(this.Holder.Player, 'R08R', 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Dragonmaw Clan", "The Dragonmaw clan is still roaming in the Twilight Highlands.", "ReplaceableTextures\\CommandButtons\\BTNNecroMagus.blp")
      call this.AddQuestItem(QuestItemResearch.create('R08R', 'h05U'))
      call this.AddQuestItem(QuestItemExpire.create(80))
      return this
    endmethod
  endstruct

endlibrary