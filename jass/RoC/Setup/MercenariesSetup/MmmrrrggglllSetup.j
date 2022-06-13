library MmmrrrggglllSetup requires Faction

  globals
    MmmrrrggglllMercFaction MERC_MMMRRRGGGLLL
  endglobals

  public function OnInit takes nothing returns nothing
    set MERC_MMMRRRGGGLLL = MmmrrrggglllMercFaction.create("Grimscale", PLAYER_COLOR_BLUE, "|c000042ff","ReplaceableTextures\\CommandButtons\\BTNMurlocFlesheater.blp", LEGEND_MMMRRRGGGLLL)
    set MERC_MMMRRRGGGLLL.TeleportItemType = 'I00V'  
    set MERC_MMMRRRGGGLLL.AbsenceResearch = 'R04H'

    call MERC_MMMRRRGGGLLL.ModObjectLimit('o061', UNLIMITED)           //Brawler
    call MERC_MMMRRRGGGLLL.ModObjectLimit('o062', UNLIMITED)           //Crossbowman
    call MERC_MMMRRRGGGLLL.ModObjectLimit('n0DD', UNLIMITED)           //Warden
    call MERC_MMMRRRGGGLLL.ModObjectLimit('n0DE', 4)           //Overseer


    call MERC_MMMRRRGGGLLL.ModObjectLimit('Rhme', 0)   //Attack Upgrade
    call MERC_MMMRRRGGGLLL.ModObjectLimit('Rhar', 0)   //defense Upgrade

endfunction

endlibrary