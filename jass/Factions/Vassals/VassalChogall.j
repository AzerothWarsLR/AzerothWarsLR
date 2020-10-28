library VassalChogall initializer OnInit requires Faction, FelHordeConfig

  globals
    VassalFaction VASSAL_CHOGALL
  endglobals

  private function OnInit takes nothing returns nothing
    set VASSAL_CHOGALL = VassalFaction.create("Cho'gall", PLAYER_COLOR_PURPLE, "|c00540081","ReplaceableTextures\\CommandButtons\\BTNHeroChogall.blp", FACTION_FEL_HORDE, LEGEND_CHOGALL)
    set VASSAL_CHOGALL.AbsenceResearch = 'R04X'
    set VASSAL_CHOGALL.WorkerItemType = 'I00O'
    set VASSAL_CHOGALL.TeleportItemType = 'I00V'  

    //Units
    call VASSAL_CHOGALL.registerObjectLimit('o02I', UNLIMITED)   //Worker
    call VASSAL_CHOGALL.registerObjectLimit('nogr', UNLIMITED)   //Ogre Warrior
    call VASSAL_CHOGALL.registerObjectLimit('u00V', UNLIMITED)   //Necrolyte
    call VASSAL_CHOGALL.registerObjectLimit('nogn', UNLIMITED)   //Ogre Magi
    //Building
    call VASSAL_CHOGALL.registerObjectLimit('o02F', UNLIMITED)   //Clan Gathering
    call VASSAL_CHOGALL.registerObjectLimit('otrb', UNLIMITED)   //Farm
    call VASSAL_CHOGALL.registerObjectLimit('ofor', UNLIMITED)   //Lumber Mill

    call VASSAL_CHOGALL.registerObjectLimit('R024', UNLIMITED)   //Necrolyte training
    call VASSAL_CHOGALL.SetObjectLevel('R024', 2)
    call VASSAL_CHOGALL.registerObjectLimit('R02I', UNLIMITED)   //Ogre Magi training
    call VASSAL_CHOGALL.SetObjectLevel('R02I', 2)

    call VASSAL_CHOGALL.registerObjectLimit('R023', UNLIMITED)   //Infusion
    call VASSAL_CHOGALL.SetObjectLevel('R023', 2)

    call VASSAL_CHOGALL.registerObjectLimit('Rhme', 0)   //Attack Upgrade
    call VASSAL_CHOGALL.registerObjectLimit('Rhar', 0)   //defense Upgrade
  endfunction
    
endlibrary