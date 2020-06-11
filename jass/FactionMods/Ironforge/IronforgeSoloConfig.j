library IronforgeSoloConfig initializer OnInit requires FactionMod

  globals
     FactionMod FACTIONMOD_IRONFORGESOLO
  endglobals


    private function OnInit takes nothing returns nothing  
      local FactionMod f
      
      set FACTIONMOD_IRONFORGESOLO = FactionMod.create()
      call FACTIONMOD_IRONFORGESOLO.modWeight(2) 
 
   endfunction
    
endlibrary                                         