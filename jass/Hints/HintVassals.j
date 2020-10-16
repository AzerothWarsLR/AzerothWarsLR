library HintVictory initializer OnInit requires Hint, VassalFaction

  private function OnInit takes nothing returns nothing
    call Hint.create("If you have a misbehaving vassal, you can boot them by typing -boot followed by their faction name, e.g. -boot xavius.")
    call Hint.create("If you're doing poorly, you can pick a Vassal hero at the top right corner. You'll lose your current faction and play as a hero instead. Each Vassal is subservient to a specific faction.")
  endfunction

endlibrary