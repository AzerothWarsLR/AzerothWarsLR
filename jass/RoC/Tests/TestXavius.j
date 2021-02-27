library TestXavius requires Test, VassalXavius

  struct TestXavius extends Test
    method Run takes nothing returns nothing
      local Person druidsPerson = FACTION_DRUIDS.Person
      set druidsPerson.Faction = VASSAL_XAVIUS
      call this.Assert(druidsPerson.Faction == VASSAL_XAVIUS, "Expected Druids player to change to the Xavius faction")
      call this.Assert(VASSAL_XAVIUS.Team == FACTION_LEGION.Team, "Expected Xavius to be on the same team as Legion")
    endmethod

    private static method onInit takes nothing returns nothing 
      call thistype.create("xavius")
    endmethod
  endstruct

endlibrary