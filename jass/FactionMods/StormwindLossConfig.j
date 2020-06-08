library StormwindLossConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTINMOD_STORMWINDLOSS
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTINMOD_STORMWINDLOSS = FactionMod.create()
    call FACTINMOD_STORMWINDLOSS.registerObjectLimit('h05F', -UNLIMITED)      //Stormwind Champion
  endfunction
    
endlibrary
