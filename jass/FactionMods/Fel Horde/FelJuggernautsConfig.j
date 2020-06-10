
library FelJuggernautsConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_FELJUGGERNAUTS
  endglobals

  //Awarded to the Fel Horde when they destroy Thelsamar and Darkshire
  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_FELJUGGERNAUTS = FactionMod.create()
    call FACTIONMOD_FELJUGGERNAUTS.registerObjectLimit('nina', 2)      //Infernal Juggernaut
  endfunction
    
endlibrary
