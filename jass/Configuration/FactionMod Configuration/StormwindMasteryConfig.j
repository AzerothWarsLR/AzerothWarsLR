library StormwindMasteryConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_MASTERY_SHIPWRIGHT
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_MASTERY_SHIPWRIGHT = FactionMod.create()
    call FACTIONMOD_MASTERY_SHIPWRIGHT.registerObjectLimit('h060', 1)   //Arathor Flagship
    call FACTIONMOD_MASTERY_SHIPWRIGHT.registerObjectLimit('h024', UNLIMITED)   //Light House
    call FACTIONMOD_MASTERY_SHIPWRIGHT.registerObjectLimit('h061', UNLIMITED)   //Naval Outpost    
  endfunction
    
endlibrary                                         
