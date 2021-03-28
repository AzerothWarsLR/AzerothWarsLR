library NathanosSetup requires Faction, LordaeronSetup

  globals
    VassalFaction VASSAL_NATHANOS
  endglobals

  public function OnInit takes nothing returns nothing
    set VASSAL_NATHANOS = VassalFaction.create("Nathanos", PLAYER_COLOR_BROWN, "|c004e2a04","ReplaceableTextures\\CommandButtons\\BTNNathanos.blp", FACTION_LORDAERON, LEGEND_NATHANOS)
    set VASSAL_NATHANOS.AbsenceResearch = 'R04Z'
    set VASSAL_NATHANOS.WorkerItemType = 'I00Q'
    set VASSAL_NATHANOS.TeleportItemType = 'I00V'   

    call VASSAL_NATHANOS.registerObjectLimit('h05K', UNLIMITED)   //Worker
    call VASSAL_NATHANOS.registerObjectLimit('h01C', UNLIMITED)   //Huntstman
    call VASSAL_NATHANOS.registerObjectLimit('hkni', UNLIMITED)   //Knight
    call VASSAL_NATHANOS.registerObjectLimit('nchp', UNLIMITED)   //Cleric

    //Building
    call VASSAL_NATHANOS.registerObjectLimit('h057', UNLIMITED)   //Adventurer's Tavern
    call VASSAL_NATHANOS.registerObjectLimit('hhou', UNLIMITED)   //Farm
    call VASSAL_NATHANOS.registerObjectLimit('hlum', UNLIMITED)   //Lumber Mill


    call VASSAL_NATHANOS.registerObjectLimit('R00I', UNLIMITED)   //Cleric training
    call VASSAL_NATHANOS.SetObjectLevel('R00I', 2)

    call VASSAL_NATHANOS.registerObjectLimit('R00K', 2)           //Infusion
    call VASSAL_NATHANOS.SetObjectLevel('R00K', 2)

    call VASSAL_NATHANOS.registerObjectLimit('Rhme', 0)   //Attack Upgrade
    call VASSAL_NATHANOS.registerObjectLimit('Rhar', 0)   //defense Upgrade

endfunction
    
endlibrary