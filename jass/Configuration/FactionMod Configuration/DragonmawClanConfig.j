library DragonmawClanConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_DRAGONMAW
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_DRAGONMAW = FactionMod.create()
    //Fel Horde tier 2 research, mutually exclusive with Shadowmoon Clan Reformed
    call FACTIONMOD_DRAGONMAW.registerObjectLimit('nbwm', 2)              //Ancient Black Dragon
    call FACTIONMOD_DRAGONMAW.registerObjectLimit('nbdk', 2)              //Black Drake
    call FACTIONMOD_DRAGONMAW.registerObjectLimit('o00H', -UNLIMITED)     //Shattered Hand Executioner
    call FACTIONMOD_DRAGONMAW.registerObjectLimit('nbdm', UNLIMITED)      //Blackrock Dragonspawn
  endfunction
    
endlibrary
