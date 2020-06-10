library IronforgeMasteryConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_FORTIFICATIONMASTERY
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_FORTIFICATIONMASTERY = FactionMod.create()
    call FACTIONMOD_FORTIFICATIONMASTERY.registerObjectLimit('h010', UNLIMITED)   //Sentinel Tower       
  endfunction
    
endlibrary                                         
