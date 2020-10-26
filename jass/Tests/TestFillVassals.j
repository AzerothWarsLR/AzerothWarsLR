//Puts a vassal on every team
library TestFillVassals requires Test, VassalSylvanas, VassalLorthemar, VassalSaurfang, VassalTortola, VassalEdwin, VassalNekrosh

  struct TestFillVassals extends Test
    method Run takes nothing returns nothing
      set Person.ById(1).Faction = VASSAL_SYLVANAS
      set Person.ById(3).Faction = VASSAL_LORTHEMAR
      set Person.ById(7).Faction = VASSAL_SAURFANG
      set Person.ById(9).Faction = VASSAL_TORTOLA
      set Person.ById(4).Faction = VASSAL_EDWIN
      set Person.ById(5).Faction = VASSAL_NEKROSH
    endmethod

    private static method onInit takes nothing returns nothing 
      call thistype.create("fillvassals")
    endmethod
  endstruct

endlibrary