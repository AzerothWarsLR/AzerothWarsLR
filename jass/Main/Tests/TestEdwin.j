library TestEdwin requires Test, EdwinSetup

  struct TestEdwin extends Test
    method Run takes nothing returns nothing
      local Person druidsPerson = FACTION_DRUIDS.Person
      set MERC_EDWIN.Liege = FACTION_LORDAERON
      set druidsPerson.Faction = MERC_EDWIN
      call this.Assert(druidsPerson.Faction == MERC_EDWIN, "Expected Druids player to change to the Edwin faction")
      call this.Assert(MERC_EDWIN.Team == FACTION_LORDAERON.Team, "Expected Edwin to be on the same team as Lorderon")
    endmethod

    private static method onInit takes nothing returns nothing 
      call thistype.create("Edwin")
    endmethod
  endstruct

endlibrary