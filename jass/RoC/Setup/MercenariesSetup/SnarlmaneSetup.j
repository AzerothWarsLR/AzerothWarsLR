library SnarlmaneSetup requires Faction

  globals
    SnarlmaneMercFaction MERC_SNARLMANE
  endglobals

  public function OnInit takes nothing returns nothing
    set MERC_SNARLMANE = SnarlmaneMercFaction.create("Blackmane", PLAYER_COLOR_ORANGE, "|c00ff8000","ReplaceableTextures\\CommandButtons\\BTNGnollKing.blp", LEGEND_SNARLMANE)
    set MERC_SNARLMANE.TeleportItemType = 'I00V'  
    set MERC_SNARLMANE.AbsenceResearch = 'R076'

    call MERC_SNARLMANE.ModObjectLimit('o05V', UNLIMITED)           //Brawler
    call MERC_SNARLMANE.ModObjectLimit('o05Y', UNLIMITED)           //Crossbowman
    call MERC_SNARLMANE.ModObjectLimit('o05Z', UNLIMITED)           //Warden
    call MERC_SNARLMANE.ModObjectLimit('h0AJ', 4)           //Overseer

    call MERC_SNARLMANE.ModObjectLimit('O05S', UNLIMITED)           //Snarlmane


    call MERC_SNARLMANE.ModObjectLimit('Rhme', 0)   //Attack Upgrade
    call MERC_SNARLMANE.ModObjectLimit('Rhar', 0)   //defense Upgrade

endfunction

endlibrary