library ScourgeMasteryConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_MASTERY_PLAGUEENGINEERING
  endglobals

  private function OnInit takes nothing returns nothing  
    //Plague Engineering Mastery
    set FACTIONMOD_MASTERY_PLAGUEENGINEERING = FactionMod.create()
    call FACTIONMOD_MASTERY_PLAGUEENGINEERING.registerObjectLimit('nfgl', 2)     //Flesh Golem
    call FACTIONMOD_MASTERY_PLAGUEENGINEERING.registerObjectLimit('umtw', 2)     //Meat Wagon
  endfunction
    
endlibrary
