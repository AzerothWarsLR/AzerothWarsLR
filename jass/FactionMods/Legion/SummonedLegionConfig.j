library SummonedLegionConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_SUMMONEDLEGION
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_SUMMONEDLEGION = FactionMod.create()
    call FACTIONMOD_SUMMONEDLEGION.registerObjectLimit('n04U', 4)              //Nether Dragon
    call FACTIONMOD_SUMMONEDLEGION.registerObjectLimit('n04K', UNLIMITED)      //Succubus
    call FACTIONMOD_SUMMONEDLEGION.registerObjectLimit('ninf', 12)             //Infernal
    call FACTIONMOD_SUMMONEDLEGION.registerObjectLimit('n04H', UNLIMITED)      //Felguard
    call FACTIONMOD_SUMMONEDLEGION.registerObjectLimit('n04I', 12)             //Overlord
    call FACTIONMOD_SUMMONEDLEGION.registerObjectLimit('n04J', UNLIMITED)      //Fel Stalker
    call FACTIONMOD_SUMMONEDLEGION.registerObjectLimit('n04L', 6)              //Infernal Juggernaut
    call FACTIONMOD_SUMMONEDLEGION.registerObjectLimit('r02D', UNLIMITED)      //Mo'arg Constitution
    call FACTIONMOD_SUMMONEDLEGION.registerObjectLimit('n04O', 6)              //Doom Guard
    call FACTIONMOD_SUMMONEDLEGION.registerObjectLimit('ndmg', UNLIMITED)      //Demon Gate
    call FACTIONMOD_SUMMONEDLEGION.registerObjectLimit('o01V', 4)              //Eredar Elder Warlock
    call FACTIONMOD_SUMMONEDLEGION.registerObjectLimit('n04T', UNLIMITED)      //Nether Dragon Roos
  endfunction
    
endlibrary