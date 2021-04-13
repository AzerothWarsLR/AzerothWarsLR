library SylvanasSetup requires Faction, ScourgeSetup

  globals
    VassalFaction VASSAL_SYLVANAS
  endglobals

  public function OnInit takes nothing returns nothing
    set VASSAL_SYLVANAS = VassalFaction.create("Sylvanas", PLAYER_COLOR_BLUE, "|c000042ff","ReplaceableTextures\\CommandButtons\\BTNBansheeRanger.blp", FACTION_SCOURGE, LEGEND_SYLVANASV)
    set VASSAL_SYLVANAS.AbsenceResearch = 'R04W'
    set VASSAL_SYLVANAS.WorkerItemType = 'I013'
    set VASSAL_SYLVANAS.TeleportItemType = 'I00V'   

	  //Units
    call VASSAL_SYLVANAS.registerObjectLimit('uaco', UNLIMITED)   //acolyte
    call VASSAL_SYLVANAS.registerObjectLimit('ugho', UNLIMITED)   //Ghoul
    call VASSAL_SYLVANAS.registerObjectLimit('uban', UNLIMITED)   //Banshee
    call VASSAL_SYLVANAS.registerObjectLimit('nska', UNLIMITED)   //Skeleton archer
    //Building
    call VASSAL_SYLVANAS.registerObjectLimit('o02J', UNLIMITED)   //Forsaken Hall
    call VASSAL_SYLVANAS.registerObjectLimit('ugrv', UNLIMITED)   //Armory
    call VASSAL_SYLVANAS.registerObjectLimit('uzig', UNLIMITED)   //ziggurat

    call VASSAL_SYLVANAS.registerObjectLimit('Ruba', UNLIMITED)   //Banshee Adept Training
    call VASSAL_SYLVANAS.SetObjectLevel('Ruba', 2)

    call VASSAL_SYLVANAS.registerObjectLimit('R02A', 2)           //Infusion
    call VASSAL_SYLVANAS.SetObjectLevel('R02A', 2)

    call VASSAL_SYLVANAS.registerObjectLimit('Rhme', 0)   //Attack Upgrade
    call VASSAL_SYLVANAS.registerObjectLimit('Rhar', 0)   //defense Upgrade

endfunction
    
endlibrary