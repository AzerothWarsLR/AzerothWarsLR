library RoanaukSetup requires Faction, FrostwolfSetup

  globals
    VassalFaction VASSAL_ROANAUK
  endglobals

  public function OnInit takes nothing returns nothing
    set VASSAL_ROANAUK = VassalFaction.create("Roanauk", PLAYER_COLOR_SNOW, "|cFFFFFFFF","ReplaceableTextures\\CommandButtons\\BTNSpiritWalker.blp", FACTION_FROSTWOLF, LEGEND_ROANAUK)
    set VASSAL_ROANAUK.AbsenceResearch = 'R05C'
    set VASSAL_ROANAUK.WorkerItemType = 'I00O'
    set VASSAL_ROANAUK.TeleportItemType = 'I00V'  

    //Units
    call VASSAL_ROANAUK.registerObjectLimit('o02I', UNLIMITED)   //Worker
    call VASSAL_ROANAUK.registerObjectLimit('otau', UNLIMITED)   //Tauren
    call VASSAL_ROANAUK.registerObjectLimit('nmdr', 4)           //Mammoth
    call VASSAL_ROANAUK.registerObjectLimit('ospw', UNLIMITED)   //Spirit Walker

    //Building
    call VASSAL_ROANAUK.registerObjectLimit('o02F', UNLIMITED)   //Clan Gathering
    call VASSAL_ROANAUK.registerObjectLimit('otrb', UNLIMITED)   //Farm
    call VASSAL_ROANAUK.registerObjectLimit('ofor', UNLIMITED)   //Lumber Mill

    call VASSAL_ROANAUK.registerObjectLimit('Rowt', UNLIMITED)   //Spirit Walker training
    call VASSAL_ROANAUK.SetObjectLevel('Rowt', 2)

    call VASSAL_ROANAUK.registerObjectLimit('R023', 2)           //Infusion
    call VASSAL_ROANAUK.SetObjectLevel('R023', 2)

    call VASSAL_ROANAUK.registerObjectLimit('Rhme', 0)   //Attack Upgrade
    call VASSAL_ROANAUK.registerObjectLimit('Rhar', 0)   //defense Upgrade

  endfunction
    
endlibrary