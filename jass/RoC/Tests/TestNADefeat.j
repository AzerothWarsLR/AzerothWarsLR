//Takes away NA's CPs, then kills their capitals except Sunwell, then gives the Sunwell to Scourge.
//Should defeat NA and complete the Sunwell corruption quest for Scourge.
library TestNADefeat requires Test, FactionSetup

  struct TestNADefeat extends Test
    method Run takes nothing returns nothing
      local group tempGroup = CreateGroup()
      local unit u
      call BlzGroupAddGroupFast(ControlPoints, tempGroup)
      loop
        set u = FirstOfGroup(tempGroup)
        exitwhen u == null or TEAM_NORTH_ALLIANCE.ControlPointCount == 0
        if GetOwningPlayer(u) == FACTION_LORDAERON.Player or GetOwningPlayer(u) == FACTION_DALARAN.Player or GetOwningPlayer(u) == FACTION_QUELTHALAS.Player then
          call SetUnitOwner(u, Player(0), true)
        endif
        call GroupRemoveUnit(tempGroup, u)
      endloop
      set u = null
      call KillUnit(LEGEND_STRATHOLME.Unit)
      call KillUnit(LEGEND_CAPITALPALACE.Unit)
      call KillUnit(LEGEND_TYRSHAND.Unit)
      call KillUnit(LEGEND_SILVERMOON.Unit)
      call KillUnit(LEGEND_DALARAN.Unit)
      call SetUnitOwner(LEGEND_SUNWELL.Unit, FACTION_SCOURGE.Player, true)
    endmethod

    private static method onInit takes nothing returns nothing 
      call thistype.create("nadefeat")
    endmethod
  endstruct

endlibrary