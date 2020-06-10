library RiteofStrengthConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_RITEOFSTRENGTH
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_RITEOFSTRENGTH = FactionMod.create()
    call FACTIONMOD_RITEOFSTRENGTH.registerObjectLimit('n03F', 6)           //Ogre Lord     
  endfunction
    
endlibrary
