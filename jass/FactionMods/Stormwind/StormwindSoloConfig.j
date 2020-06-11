library StormwindSoloConfig initializer OnInit requires FactionMod

  globals
     FactionMod FACTIONMOD_STORMWINDSOLO
  endglobals

  private function OnInit takes nothing returns nothing  
    local FactionMod f
    set FACTIONMOD_STORMWINDSOLO = FactionMod.create()
    call FACTIONMOD_STORMWINDSOLO.modWeight(2) 
  endfunction
    
endlibrary