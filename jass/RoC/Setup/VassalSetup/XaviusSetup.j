	library XaviusSetup requires Faction, LegionSetup, LegendXavius

  globals
    VassalFaction VASSAL_XAVIUS
  endglobals

  public function OnInit takes nothing returns nothing
    set VASSAL_XAVIUS = VassalFaction.create("Xavius", PLAYER_COLOR_EMERALD, "|CFF00781E","ReplaceableTextures\\CommandButtons\\BTNSatyr.blp", FACTION_LEGION, LEGEND_XAVIUS)
    set VASSAL_XAVIUS.AbsenceResearch = 'R03S'
    set VASSAL_XAVIUS.WorkerItemType = 'I00W'
    set VASSAL_XAVIUS.TeleportItemType = 'I00V'

	  //Units
    call VASSAL_XAVIUS.registerObjectLimit('u00D', UNLIMITED)   //Legion Herald
    call VASSAL_XAVIUS.registerObjectLimit('nsty', UNLIMITED)   //Satyr Warrior
    call VASSAL_XAVIUS.registerObjectLimit('nsat', UNLIMITED)   //Trickster
    call VASSAL_XAVIUS.registerObjectLimit('nstl', UNLIMITED)   //Soulstealer
    //Building
    call VASSAL_XAVIUS.registerObjectLimit('e00Z', UNLIMITED)   //Corrupted Ancient of the Wild
    call VASSAL_XAVIUS.registerObjectLimit('n040', UNLIMITED)   //Armory
    call VASSAL_XAVIUS.registerObjectLimit('u00E', UNLIMITED)   //House

    call VASSAL_XAVIUS.registerObjectLimit('Rhme', 0)   //Attack Upgrade
    call VASSAL_XAVIUS.registerObjectLimit('Rhar', 0)   //defense Upgrade
  
  endfunction  
endlibrary