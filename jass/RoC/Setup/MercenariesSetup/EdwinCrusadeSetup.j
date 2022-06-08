library EdwinCrusadeSetup requires Faction

  globals
    MercFaction MERC_EDWIN
  endglobals

  public function OnInit takes nothing returns nothing
    set MERC_EDWIN = MercFaction.create("Defias", PLAYER_COLOR_COAL, "|cFF808080","ReplaceableTextures\\CommandButtons\\BTNDarkSoldier2.blp", LEGEND_EDWIN)
    set MERC_EDWIN.TeleportItemType = 'I00V'  

    call MERC_EDWIN.ModObjectLimit('h0AI', 4)           //Assassin


    call MERC_EDWIN.ModObjectLimit('Rhme', 0)   //Attack Upgrade
    call MERC_EDWIN.ModObjectLimit('Rhar', 0)   //defense Upgrade

endfunction

endlibrary