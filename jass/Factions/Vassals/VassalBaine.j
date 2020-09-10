library VassalBaine initializer OnInit requires Faction, FrostwolfConfig

  globals
    VassalFaction VASSAL_BAINE
  endglobals

  private function OnInit takes nothing returns nothing
    set VASSAL_BAINE = VassalFaction.create("Baine", PLAYER_COLOR_YELLOW, "|c00fffc01","ReplaceableTextures\\CommandButtons\\BTNSpiritWalker.blp", FACTION_FROSTWOLF, 0)
  endfunction
    
endlibrary