library NzothConfig initializer OnInit requires Faction
  globals
    Faction FACTION_NZOTH
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f

    set FACTION_NZOTH = Faction.create("N'zoth", PLAYER_COLOR_VIOLET, "|c00BE00FE","ReplaceableTextures\\CommandButtons\\BTNNagaSeaWitch.blp", 5)
    set f = FACTION_NZOTH

      //Units
      call f.registerObjectLimit('nmpe', UNLIMITED)   //Mur'gul Slave
      call f.registerObjectLimit('nsgb', 2)           //Sea Giant Behemoth
      call f.registerObjectLimit('nahy', 2)           //Ancient Hydra
      call f.registerObjectLimit('h03L', UNLIMITED)   //Myrmidon
      call f.registerObjectLimit('nnsw', UNLIMITED)   //Naga Siren
      call f.registerObjectLimit('nsnp', UNLIMITED)   //Snap Dragon
      call f.registerObjectLimit('nnsu', UNLIMITED)   //Summoner
      call f.registerObjectLimit('nwgs', 6)           //Couatl
      call f.registerObjectLimit('nnrg', 6)           //Naga Royal Guard
      call f.registerObjectLimit('nhyc', 6)           //Dragon Turtle                         

      //Structures
      call f.registerObjectLimit('nmrb', UNLIMITED)   //Trading Post    
      call f.registerObjectLimit('h01D', UNLIMITED)   //Mur'gul Lumber Mill   
      call f.registerObjectLimit('n045', UNLIMITED)   //Temple of Azshara   
      call f.registerObjectLimit('n005', UNLIMITED)   //Improved Tidal Guardian   
      call f.registerObjectLimit('n077', UNLIMITED)   //The First Guardian   
      call f.registerObjectLimit('nnad', UNLIMITED)   //Altar of the Depths   
      call f.registerObjectLimit('nnfm', UNLIMITED)   //Coral Bed   
      call f.registerObjectLimit('nnsa', UNLIMITED)   //Shrine of Azshara   
      call f.registerObjectLimit('nnsg', UNLIMITED)   //Spawning Grounds   
      call f.registerObjectLimit('nntt', UNLIMITED)   //Temple of Tides
      call f.registerObjectLimit('nntg', UNLIMITED)   //Tidal Guardian     
  endfunction
endlibrary
