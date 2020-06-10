library SentinelsMasteryConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_AERIALEXPERTISE
    FactionMod FACTIONMOD_LOSTHERITAGE
  endglobals

  private function OnInit takes nothing returns nothing  
    //Aerial Expertise Mastery
    set FACTIONMOD_AERIALEXPERTISE = FactionMod.create()
    call FACTIONMOD_AERIALEXPERTISE.registerObjectLimit('e00C', 4)   //Hippogryph Rider Captain
    
    //Lost Heritage Mastery
    set FACTIONMOD_LOSTHERITAGE = FactionMod.create()
    call FACTIONMOD_LOSTHERITAGE.registerObjectLimit('nnmg', 12)   //Redeemed Highborne                
  endfunction
    
endlibrary                                         
