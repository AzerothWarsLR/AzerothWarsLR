library PaladinLossConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_PALADINLOSS
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_PALADINLOSS = FactionMod.create()
    call FACTIONMOD_PALADINLOSS.registerObjectLimit('h00F', -UNLIMITED)      //Lordaeron Paladin
  endfunction
    
endlibrary
