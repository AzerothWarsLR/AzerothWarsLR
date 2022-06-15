library EdwinSetup requires Faction

  globals
    EdwinMercFaction MERC_EDWIN
  endglobals

  public function OnInit takes nothing returns nothing
    set MERC_EDWIN = EdwinMercFaction.create("Defias", PLAYER_COLOR_COAL, "|cFF808080","ReplaceableTextures\\CommandButtons\\BTNDarkSoldier2.blp", LEGEND_EDWIN)
    set MERC_EDWIN.TeleportItemType = 'I00V' 
    set MERC_EDWIN.AbsenceResearch = 'R02C'

    call MERC_EDWIN.ModObjectLimit('o05W', UNLIMITED)           //Axeman
    call MERC_EDWIN.ModObjectLimit('o05X', UNLIMITED)           //Spearman
    call MERC_EDWIN.ModObjectLimit('n0DC', UNLIMITED)           //Mage
    call MERC_EDWIN.ModObjectLimit('h0AI', 4)           //Assassin

    call MERC_EDWIN.ModObjectLimit('E01H', UNLIMITED)           //Edwin


    call MERC_EDWIN.ModObjectLimit('Rhme', 0)   //Attack Upgrade
    call MERC_EDWIN.ModObjectLimit('Rhar', 0)   //defense Upgrade

endfunction

endlibrary