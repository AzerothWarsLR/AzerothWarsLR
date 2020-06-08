library FelHordeMasteryConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_FELBLOODMASTERY
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_FELBLOODMASTERY = FactionMod.create()
    call FACTIONMOD_FELBLOODMASTERY.registerObjectLimit('ndfl', 1)   //Defiled Fountain of Life    
  endfunction
    
endlibrary                                         
