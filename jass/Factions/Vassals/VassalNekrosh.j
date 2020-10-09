library VassalNekrosh initializer OnInit requires Faction, FelHordeConfig

  globals
    VassalFaction VASSAL_NEKROSH
  endglobals

  private function OnInit takes nothing returns nothing
    set VASSAL_NEKROSH = VassalFaction.create("Nek'rosh", PLAYER_COLOR_MINT, "|CFFBFFF80","ReplaceableTextures\\CommandButtons\\BTNNecroMagus.blp", FACTION_FEL_HORDE, LEGEND_NEKROSH)
    set VASSAL_NEKROSH.AbsenceResearch = 'R04Y'
    set VASSAL_NEKROSH.WorkerItemType = 'I00O'
    set VASSAL_NEKROSH.TeleportItemType = 'I00V'  

    //Units
    call VASSAL_NEKROSH.registerObjectLimit('o02I', UNLIMITED)   //Worker
    call VASSAL_NEKROSH.registerObjectLimit('ogru', UNLIMITED)   //grunt
    call VASSAL_NEKROSH.registerObjectLimit('nchw', UNLIMITED)   //Warlock
    call VASSAL_NEKROSH.registerObjectLimit('nbdk', 4)  	       //Drake
    //Building
    call VASSAL_NEKROSH.registerObjectLimit('o02F', UNLIMITED)   //Clan Gathering
    call VASSAL_NEKROSH.registerObjectLimit('otrb', UNLIMITED)   //Farm
    call VASSAL_NEKROSH.registerObjectLimit('ofor', UNLIMITED)   //Lumber Mill

    call VASSAL_NEKROSH.registerObjectLimit('R00M', UNLIMITED)   //Warlock training
    call VASSAL_NEKROSH.SetObjectLevel('R00M', 2)
    call VASSAL_NEKROSH.registerObjectLimit('R036', UNLIMITED)   //Dragonmaw tier 2
    call VASSAL_NEKROSH.SetObjectLevel('R036', 1)

    call VASSAL_NEKROSH.registerObjectLimit('R023', UNLIMITED)   //Infusion
    call VASSAL_NEKROSH.SetObjectLevel('R023', 2)

    call VASSAL_NEKROSH.registerObjectLimit('Rhme', 0)   //Attack Upgrade
    call VASSAL_NEKROSH.registerObjectLimit('Rhar', 0)   //defense Upgrade

endfunction
    
endlibrary