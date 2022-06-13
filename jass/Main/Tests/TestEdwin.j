library TestEdwin requires Test, EdwinSetup

  struct TestEdwin extends Test
    method Run takes nothing returns nothing
      local integer i
          call BJDebugMsg("Test Edwin")
          set i = 0
          loop
          exitwhen i > MAX_PLAYERS
              call SetPlayerTechResearched(Player(i), MERC_EDWIN.AbsenceResearch, 1)
              call SetPlayerTechResearched(Player(i), MERC_MMMRRRGGGLLL.AbsenceResearch, 1)
              call SetPlayerTechResearched(Player(i), MERC_SNARLMANE.AbsenceResearch, 1)
            set i = i + 1
          endloop
    endmethod

    private static method onInit takes nothing returns nothing 
      call thistype.create("Edwin")
    endmethod
  endstruct

endlibrary