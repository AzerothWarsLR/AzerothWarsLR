library LegionSoloConfig initializer OnInit requires FactionMod

  globals
     FactionMod FACTIONMOD_LEGIONSOLO
  endglobals

  private function OnInit takes nothing returns nothing  
    local FactionMod f
    
    set FACTIONMOD_LEGIONSOLO = FactionMod.create()
    call FACTIONMOD_LEGIONSOLO.modWeight(2) 
    call FACTIONMOD_LEGIONSOLO.registerObjectLimit('R01X', UNLIMITED) //Plague Engineering Mastery
  endfunction
    
endlibrary                                         