library RhoninSetup requires Faction, DalaranSetup

  globals
    VassalFaction VASSAL_RHONIN
  endglobals

  public function OnInit takes nothing returns nothing
    set VASSAL_RHONIN = VassalFaction.create("Rhonin", PLAYER_COLOR_ORANGE, "|c00ff8000","ReplaceableTextures\\CommandButtons\\BTNRagnarFlamebeard.blp", FACTION_DALARAN, LEGEND_RHONIN)
    set VASSAL_RHONIN.AbsenceResearch = 'R051'
    set VASSAL_RHONIN.WorkerItemType = 'I00Q'
    set VASSAL_RHONIN.TeleportItemType = 'I00V'   

    call VASSAL_RHONIN.registerObjectLimit('h05K', UNLIMITED)   //Worker
    call VASSAL_RHONIN.registerObjectLimit('h032', UNLIMITED)   //Battlemage
    call VASSAL_RHONIN.registerObjectLimit('n03E', UNLIMITED)   //Pyromancer
    call VASSAL_RHONIN.registerObjectLimit('h01I', UNLIMITED)   //Arcanist

    //Building
    call VASSAL_RHONIN.registerObjectLimit('h057', UNLIMITED)   //Adventurer's Tavern
    call VASSAL_RHONIN.registerObjectLimit('hhou', UNLIMITED)   //Farm
    call VASSAL_RHONIN.registerObjectLimit('hlum', UNLIMITED)   //Lumber Mill
  
    call VASSAL_RHONIN.registerObjectLimit('R01I', UNLIMITED)   //Arcanist training
    call VASSAL_RHONIN.SetObjectLevel('R01I', 2)
    call VASSAL_RHONIN.registerObjectLimit('R00D', UNLIMITED)   //Pyromancer training
    call VASSAL_RHONIN.SetObjectLevel('R00D', 2)

    call VASSAL_RHONIN.registerObjectLimit('R00K', 2)           //Infusion
    call VASSAL_RHONIN.SetObjectLevel('R00K', 2)

    call VASSAL_RHONIN.registerObjectLimit('Rhme', 0)   //Attack Upgrade
    call VASSAL_RHONIN.registerObjectLimit('Rhar', 0)   //defense Upgrade

endfunction
    
endlibrary