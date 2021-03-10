library EdwinSetup requires Faction, StormwindSetup

  globals
    VassalFaction VASSAL_EDWIN
  endglobals

  public function OnInit takes nothing returns nothing
    set VASSAL_EDWIN = VassalFaction.create("Edwin", PLAYER_COLOR_COAL, "|cFF808080","ReplaceableTextures\\CommandButtons\\BTNDarkSoldier2.blp", FACTION_STORMWIND, LEGEND_EDWIN)
    set VASSAL_EDWIN.AbsenceResearch = 'R05J'
    set VASSAL_EDWIN.WorkerItemType = 'I00Q'
    set VASSAL_EDWIN.TeleportItemType = 'I00V'  

    call VASSAL_EDWIN.registerObjectLimit('h05K', UNLIMITED)   //Worker
    call VASSAL_EDWIN.registerObjectLimit('h05M', UNLIMITED)   //Enforcer
    call VASSAL_EDWIN.registerObjectLimit('h05V', 4)           //si-7 Agent
    call VASSAL_EDWIN.registerObjectLimit('h05T', UNLIMITED)   //Assassin

    //Building
    call VASSAL_EDWIN.registerObjectLimit('h057', UNLIMITED)   //Adventurer's Tavern
    call VASSAL_EDWIN.registerObjectLimit('hhou', UNLIMITED)   //Farm
    call VASSAL_EDWIN.registerObjectLimit('hlum', UNLIMITED)   //Lumber Mill

    call VASSAL_EDWIN.registerObjectLimit('Rhme', 0)   //Attack Upgrade
    call VASSAL_EDWIN.registerObjectLimit('Rhar', 0)   //defense Upgrade

endfunction
    
endlibrary