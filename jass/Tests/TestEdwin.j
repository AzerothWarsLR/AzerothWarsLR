library TestEdwin requires Test, EdwinSetup

  struct TestEdwin extends Test
    method Run takes nothing returns nothing
      local integer i
      call BJDebugMsg("Test Edwin")
      set i = 0
      loop
         exitwhen i > MAX_PLAYERS
         call BJDebugMsg(GetObjectName(MERC_EDWIN.AbsenceResearch))
         call BJDebugMsg(I2S(GetPlayerTechMaxAllowed(Player(i), MERC_EDWIN.AbsenceResearch)))
         set i = i + 1
      endloop
    endmethod

    private static method onInit takes nothing returns nothing 
      call thistype.create("Edwin")
    endmethod
  endstruct

endlibrary