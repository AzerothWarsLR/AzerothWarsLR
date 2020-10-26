library VassalTortola initializer OnInit requires Faction, DruidsConfig

  globals
    VassalFaction VASSAL_TORTOLA
  endglobals

  private function OnInit takes nothing returns nothing
    set VASSAL_TORTOLA = VassalFaction.create("Tortola", PLAYER_COLOR_BLUE, "|c000042ff","ReplaceableTextures\\CommandButtons\\BTNSeaTurtleGreen.blp", FACTION_DRUIDS, LEGEND_TORTOLLA)
    set VASSAL_TORTOLA.AbsenceResearch = 'R05H'
    set VASSAL_TORTOLA.WorkerItemType = 'I01G'
    set VASSAL_TORTOLA.TeleportItemType = 'I00V'  

    //Units
    call VASSAL_TORTOLA.registerObjectLimit('ewsp', UNLIMITED)   //Wisp
    call VASSAL_TORTOLA.registerObjectLimit('ntrs', UNLIMITED)   //Sea Turtle
    call VASSAL_TORTOLA.registerObjectLimit('ntrh', UNLIMITED)   //Hatchling
    call VASSAL_TORTOLA.registerObjectLimit('nhyc', 4)  	       //Dragon Turtle
    //Building
    call VASSAL_TORTOLA.registerObjectLimit('e00Y', UNLIMITED)   //Ancient of the Wild
    call VASSAL_TORTOLA.registerObjectLimit('emow', UNLIMITED)   //Moonwell

    call VASSAL_TORTOLA.registerObjectLimit('Rhme', 0)   //Attack Upgrade
    call VASSAL_TORTOLA.registerObjectLimit('Rhar', 0)   //defense Upgrade

endfunction
    
endlibrary