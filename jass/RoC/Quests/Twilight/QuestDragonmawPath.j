
library QuestDragonmawPath requires Persons, TwilightSetup, GeneralHelpers

  struct QuestDragonmawPath extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "Kul Tiras has joined the Scarlet Crusade"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Unlock Order Inquisitor and join the Scarlet Crusade"
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

    private method OnComplete takes nothing returns nothing
      call this.Holder.obliterate()
      call DisableTrigger( gg_trg_Cataclysm )
      call DisableTrigger( gg_trg_CorruptWorker )
      call DisableTrigger( gg_trg_GoldCultistLoop )

      call IssueImmediateOrderBJ( gg_unit_h01Z_0618, "berserk" )

      call SetPlayerAllianceStateBJ( Player(0), Player(19), bj_ALLIANCE_UNALLIED )
      call SetPlayerAllianceStateBJ( Player(1), Player(19), bj_ALLIANCE_UNALLIED )
      call SetPlayerAllianceStateBJ( Player(2), Player(19), bj_ALLIANCE_UNALLIED )
      call SetPlayerAllianceStateBJ( Player(3), Player(19), bj_ALLIANCE_UNALLIED )
      call SetPlayerAllianceStateBJ( Player(4), Player(19), bj_ALLIANCE_UNALLIED )
      call SetPlayerAllianceStateBJ( Player(5), Player(19), bj_ALLIANCE_UNALLIED )
      call SetPlayerAllianceStateBJ( Player(6), Player(19), bj_ALLIANCE_UNALLIED )
      call SetPlayerAllianceStateBJ( Player(7), Player(19), bj_ALLIANCE_UNALLIED )
      call SetPlayerAllianceStateBJ( Player(10), Player(19), bj_ALLIANCE_UNALLIED )
      call SetPlayerAllianceStateBJ( Player(12), Player(19), bj_ALLIANCE_UNALLIED )
      call SetPlayerAllianceStateBJ( Player(17), Player(19), bj_ALLIANCE_UNALLIED )
      call SetPlayerAllianceStateBJ( Player(22), Player(19), bj_ALLIANCE_UNALLIED )
      call SetPlayerAllianceStateBJ( Player(23), Player(19), bj_ALLIANCE_UNALLIED )
      call SetPlayerAbilityAvailableBJ( false, 'A0BW', Player(19) )

      set this.Holder.Person.Faction = FACTION_DRAGONMAW
      call RescueNeutralUnitsInRect(gg_rct_DragonmawPathUnlock, FACTION_DRAGONMAW.Player)

    endmethod

    private method OnFail takes nothing returns nothing
        call this.RemoveStartingUnits()
        call SetPlayerTechResearched(this.Holder.Player, 'R08R', 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Join the Crusade", "Daelin Proudmoore sees the plight of the Scarlet Crusade. As fellow human survivors of horrible war, they should join forces with Kul'tiras.", "ReplaceableTextures\\CommandButtons\\BTNDivine_Reckoning_Icon.blp")
      call this.AddQuestItem(QuestItemResearch.create('R08R', 'h05U'))
      call this.AddQuestItem(QuestItemExpire.create(80))
      return this
    endmethod
  endstruct

endlibrary