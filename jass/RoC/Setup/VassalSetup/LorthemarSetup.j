library LorthemarSetup requires Faction, QuelthalasSetup

  globals
    VassalFaction VASSAL_LORTHEMAR
  endglobals

  public function OnInit takes nothing returns nothing
    set VASSAL_LORTHEMAR = VassalFaction.create("Lor'themar", PLAYER_COLOR_MAROON, "|cFFC4000F","ReplaceableTextures\\CommandButtons\\BTNLorthemarv1.blp", FACTION_QUELTHALAS, LEGEND_LORTHEMAR)
    set VASSAL_LORTHEMAR.AbsenceResearch = 'R055'
    set VASSAL_LORTHEMAR.WorkerItemType = 'I00Q'
    set VASSAL_LORTHEMAR.TeleportItemType = 'I00V'   

    call VASSAL_LORTHEMAR.registerObjectLimit('h05K', UNLIMITED)   //Worker
    call VASSAL_LORTHEMAR.registerObjectLimit('hhes', UNLIMITED)   //Swordsman
    call VASSAL_LORTHEMAR.registerObjectLimit('h03S', 3)           //Blood Knight
    call VASSAL_LORTHEMAR.registerObjectLimit('nhea', UNLIMITED)   //Ranger

    //Building
    call VASSAL_LORTHEMAR.registerObjectLimit('h057', UNLIMITED)   //Adventurer's Tavern
    call VASSAL_LORTHEMAR.registerObjectLimit('hhou', UNLIMITED)   //Farm
    call VASSAL_LORTHEMAR.registerObjectLimit('hlum', UNLIMITED)   //Lumber Mill

    call VASSAL_LORTHEMAR.registerObjectLimit('R04U', UNLIMITED)   //Solo Path
    call VASSAL_LORTHEMAR.SetObjectLevel('R04U', 1)

    call VASSAL_LORTHEMAR.registerObjectLimit('Rhme', 0)   //Attack Upgrade
    call VASSAL_LORTHEMAR.registerObjectLimit('Rhar', 0)   //defense Upgrade

endfunction
    
endlibrary