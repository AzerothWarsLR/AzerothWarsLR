library SilvermoonLossConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_SILVERMOONLOSS
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_SILVERMOONLOSS = FactionMod.create()
    call FACTIONMOD_SILVERMOONLOSS.registerObjectLimit('n00A', -UNLIMITED)      //Farstrider
  endfunction
    
endlibrary
