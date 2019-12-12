library LegionMasteryConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_MASTERY_INFERNO
    FactionMod FACTIONMOD_MASTERY_DOOM
    FactionMod FACTIONMOD_MASTERY_VOID
    FactionMod FACTIONMOD_MASTERY_FELSTEEL
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_MASTERY_INFERNO = FactionMod.create()
    call FACTIONMOD_MASTERY_INFERNO.registerObjectLimit('ninf', 4)   //Infernal

    set FACTIONMOD_MASTERY_DOOM = FactionMod.create()
    call FACTIONMOD_MASTERY_DOOM.registerObjectLimit('n04O', 2)   //Doom Guard

    set FACTIONMOD_MASTERY_VOID = FactionMod.create()
    call FACTIONMOD_MASTERY_VOID.registerObjectLimit('n04U', 2)   //Nether Dragon

    set FACTIONMOD_MASTERY_FELSTEEL = FactionMod.create()
    call FACTIONMOD_MASTERY_FELSTEEL.registerObjectLimit('n04L', 2)   //Infernal Juggernaut 
    call FACTIONMOD_MASTERY_FELSTEEL.registerObjectLimit('u00K', 2)   //Fel Reaver       
  endfunction
    
endlibrary                                         
