library BrannSetup requires Faction, IronforgeSetup

  globals
    VassalFaction VASSAL_BRANN
  endglobals

  public function OnInit takes nothing returns nothing
    set VASSAL_BRANN = VassalFaction.create("Brann", PLAYER_COLOR_ORANGE, "|c00ff8000","ReplaceableTextures\\CommandButtons\\BTNRifleman.blp", FACTION_IRONFORGE, LEGEND_BRANN)
    set VASSAL_BRANN.AbsenceResearch = 'R05I'
    set VASSAL_BRANN.WorkerItemType = 'I00A'
    set VASSAL_BRANN.TeleportItemType = 'I00V'  

    //Units
    call VASSAL_BRANN.registerObjectLimit('h019', UNLIMITED)   //Masons
    call VASSAL_BRANN.registerObjectLimit('hrif', UNLIMITED)   //Rifleman
    call VASSAL_BRANN.registerObjectLimit('hmtm', 5)           //Mortar Team
    call VASSAL_BRANN.registerObjectLimit('h037', UNLIMITED)   //Engineer

    //Building
    call VASSAL_BRANN.registerObjectLimit('h057', UNLIMITED)   //Explorers Tavern
    call VASSAL_BRANN.registerObjectLimit('h01S', UNLIMITED)   //Tavern
    call VASSAL_BRANN.registerObjectLimit('h048', UNLIMITED)   //Guild
    call VASSAL_BRANN.registerObjectLimit('Rhme', 0)           //Attack Upgrade
    call VASSAL_BRANN.registerObjectLimit('Rhar', 0)           //defense Upgrade
    call VASSAL_BRANN.registerObjectLimit('Rhri', UNLIMITED)   //Long Rifles
    call VASSAL_BRANN.registerObjectLimit('Rhfl', UNLIMITED)   //Flare
    call VASSAL_BRANN.registerObjectLimit('Rhfs', UNLIMITED)   //Fragmentation Shards
    call VASSAL_BRANN.SetObjectLevel('Rhri', 1)
    call VASSAL_BRANN.SetObjectLevel('Rhfl', 1)
    call VASSAL_BRANN.SetObjectLevel('Rhfs', 1)
endfunction
    
endlibrary