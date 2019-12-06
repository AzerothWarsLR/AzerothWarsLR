library AhnqirajConfig initializer OnInit requires Faction

  globals
    Faction FACTION_AHNQIRAJ
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_AHNQIRAJ = Faction.create("Ahn'qiraj", PLAYER_COLOR_WHEAT, "|cFFFFDF80","ReplaceableTextures\\CommandButtons\\BTNForgottenOne.blp")
    set f = FACTION_AHNQIRAJ
    
      //Units
      call f.registerObjectLimit('o00R', UNLIMITED)   //Black Pyramid
      call f.registerObjectLimit('ushp', UNLIMITED)   //Undead Shipyard
      call f.registerObjectLimit('o00D', UNLIMITED)   //Ancient Tomb
      call f.registerObjectLimit('u01F', UNLIMITED)   //Altar of the Old Ones
      call f.registerObjectLimit('u01G', UNLIMITED)   //Spirit Hall
      call f.registerObjectLimit('u01H', UNLIMITED)   //Void Portal
      call f.registerObjectLimit('u01I', UNLIMITED)   //Chamber of Wonders
      call f.registerObjectLimit('n073', UNLIMITED)   //Ahn'Qiraj Nexus
      call f.registerObjectLimit('n071', UNLIMITED)   //Pillars of C'thun

      //Structures
      call f.registerObjectLimit('u019', UNLIMITED)   //Cultist        
      call f.registerObjectLimit('h01Q', 4)           //Immortal Guardian
      call f.registerObjectLimit('h01K', 12)          //Silithid Overlord
      call f.registerObjectLimit('o000', 6)           //Silithid Colossus
      call f.registerObjectLimit('o00L', UNLIMITED)   //Silithid Reaver
      call f.registerObjectLimit('n06I', UNLIMITED)   //Faceless One
      call f.registerObjectLimit('u013', UNLIMITED)   //Giant Scarab
      call f.registerObjectLimit('n05V', UNLIMITED)   //Faceless Shadow Weaver
      call f.registerObjectLimit('n060', UNLIMITED)   //Silithid Tunneler
      call f.registerObjectLimit('o001', 6)           //Tol'vir Statue
      call f.registerObjectLimit('ubot', UNLIMITED)   //Undead Transport Ship
      call f.registerObjectLimit('udes', UNLIMITED)   //Undead Frigate
      call f.registerObjectLimit('uubs', 24)          //Undead Battleship

      //Upgrades
      call f.registerObjectLimit('Ruwb', UNLIMITED)   //Web
      call f.registerObjectLimit('R03G', UNLIMITED)   //Void Infusion

      //Masteries

  endfunction
    
endlibrary