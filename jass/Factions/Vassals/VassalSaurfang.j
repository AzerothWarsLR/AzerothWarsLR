library VassalSaurfang initializer OnInit requires Faction, WarsongConfig

  globals
    VassalFaction VASSAL_SAURFANG
  endglobals

  private function OnInit takes nothing returns nothing
    set VASSAL_SAURFANG = VassalFaction.create("Saurfang", PLAYER_COLOR_LIGHT_GRAY, "|cFF949494","ReplaceableTextures\\CommandButtons\\BTNVarokSaurfang.blp", FACTION_WARSONG, LEGEND_SAURFANG)
    set VASSAL_SAURFANG.AbsenceResearch = 'R05D'
    set VASSAL_SAURFANG.WorkerItemType = 'I00O'
    set VASSAL_SAURFANG.TeleportItemType = 'I00V'   

    //Units
    call VASSAL_SAURFANG.registerObjectLimit('o02I', UNLIMITED)   //Worker
    call VASSAL_SAURFANG.registerObjectLimit('orai', UNLIMITED)   //Raider
    call VASSAL_SAURFANG.registerObjectLimit('noga', 3)           //Korkron Elite
    call VASSAL_SAURFANG.registerObjectLimit('owyv', 4)           //Wyvern
    //Building
    call VASSAL_SAURFANG.registerObjectLimit('o02F', UNLIMITED)   //Clan Gathering
    call VASSAL_SAURFANG.registerObjectLimit('otrb', UNLIMITED)   //Farm
    call VASSAL_SAURFANG.registerObjectLimit('ofor', UNLIMITED)   //Lumber Mill

    call VASSAL_SAURFANG.registerObjectLimit('Rhme', 0)   //Attack Upgrade
    call VASSAL_SAURFANG.registerObjectLimit('Rhar', 0)   //defense Upgrade

endfunction
    
endlibrary