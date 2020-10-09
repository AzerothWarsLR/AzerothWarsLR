library VassalJarod initializer OnInit requires Faction, SentinelsConfig

  globals
    VassalFaction VASSAL_JAROD
  endglobals

  private function OnInit takes nothing returns nothing
    set VASSAL_JAROD = VassalFaction.create("Jarod", PLAYER_COLOR_LAVENDER, "|cFFC184F9","ReplaceableTextures\\CommandButtons\\BTNNightElfPriest.blp", FACTION_SENTINELS, LEGEND_JAROD)
    set VASSAL_JAROD.AbsenceResearch = 'R05G'
    set VASSAL_JAROD.WorkerItemType = 'I01G'
    set VASSAL_JAROD.TeleportItemType = 'I00V'  

    //Units
    call VASSAL_JAROD.registerObjectLimit('ewsp', UNLIMITED)   //Wisp
    call VASSAL_JAROD.registerObjectLimit('earc', UNLIMITED)   //Archer
    call VASSAL_JAROD.registerObjectLimit('nwat', UNLIMITED)   //Nightblade
    call VASSAL_JAROD.registerObjectLimit('h045', 4)  	       //Warden
    //Building
    call VASSAL_JAROD.registerObjectLimit('e00Y', UNLIMITED)   //Ancient of the Wild
    call VASSAL_JAROD.registerObjectLimit('emow', UNLIMITED)   //Moonwell

    call VASSAL_JAROD.registerObjectLimit('Rhme', 0)   //Attack Upgrade
    call VASSAL_JAROD.registerObjectLimit('Rhar', 0)   //defense Upgrade

endfunction
    
endlibrary