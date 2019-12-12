library ShadowmoonClanRemnantsConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_SHADOWMOONCLANREMNANTS
  endglobals

  //Fel Horde tier 2 research, mutually exclusive with Dragonmaw Clan
  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_SHADOWMOONCLANREMNANTS = FactionMod.create()
    call FACTIONMOD_SHADOWMOONCLANREMNANTS.registerObjectLimit('nina', 4)      //Infernal Juggernaut
    call FACTIONMOD_SHADOWMOONCLANREMNANTS.registerObjectLimit('n06Y', 1)      //Dimensional Gateway
    call FACTIONMOD_SHADOWMOONCLANREMNANTS.registerObjectLimit('o01V', 4)      //Eredar Elder Warlock
  endfunction
    
endlibrary
