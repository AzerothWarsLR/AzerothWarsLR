library MannorothConfig initializer OnInit requires Faction
  globals
    Faction FACTION_MANNOROTH
  endglobals

    private function OnInit takes nothing returns nothing
      local Faction f

      set FACTION_MANNOROTH = Faction.create("Bloodpact", PLAYER_COLOR_RED, "|c00ff0303","ReplaceableTextures\\CommandButtons\\BTNMannoroth.blp", 4)
      set f = FACTION_MANNOROTH

      call f.registerObjectLimit('ogre', UNLIMITED)   //Great Hall
      call f.registerObjectLimit('ostr', UNLIMITED)   //Stronghold
      call f.registerObjectLimit('ofrt', UNLIMITED)   //Fortress
      call f.registerObjectLimit('oalt', UNLIMITED)   //Altar of Storms
      call f.registerObjectLimit('obar', UNLIMITED)   //Barracks
      call f.registerObjectLimit('ofor', UNLIMITED)   //War Mill
      call f.registerObjectLimit('o006', UNLIMITED)   //Ogre Barrack
      call f.registerObjectLimit('obea', UNLIMITED)   //Bestiary
      call f.registerObjectLimit('otrb', UNLIMITED)   //Orc Burrow
      call f.registerObjectLimit('owtw', UNLIMITED)   //Watch Tower
      call f.registerObjectLimit('o002', UNLIMITED)   //Improved Watch Tower
      call f.registerObjectLimit('o01T', UNLIMITED)   //Goblin Hardware Shop
      call f.registerObjectLimit('oshy', UNLIMITED)   //Shipyard
      call f.registerObjectLimit('o01M', UNLIMITED)   //Goblin Laboratory

      call f.registerObjectLimit('o00E', UNLIMITED)   //Peon
      call f.registerObjectLimit('o00S', UNLIMITED)   //Raider
      call f.registerObjectLimit('n03L', UNLIMITED)   //Orc Warlock
      call f.registerObjectLimit('nftk', 12)          //Darkspear Warlord
      call f.registerObjectLimit('otbk', UNLIMITED)   //Troll Berseker
      call f.registerObjectLimit('nogo', UNLIMITED)   //Stonemaul SOldier
      call f.registerObjectLimit('nogn', UNLIMITED)   //Stonemaul Ogre Magi
      call f.registerObjectLimit('n03R', 6)           //Orc Champion
      call f.registerObjectLimit('o00P', UNLIMITED)   //Warsong Grunt
      call f.registerObjectLimit('o00I', 6)           //Horde War Machine
      call f.registerObjectLimit('n061', 12)          //Goblin Sapper
      call f.registerObjectLimit('n062', 8)           //Goblin Shredder
      call f.registerObjectLimit('obot', UNLIMITED)   //Transport Ship
      call f.registerObjectLimit('odes', UNLIMITED)   //Orc Frigate
      call f.registerObjectLimit('ojgn', 12)          //Juggernaught
      call f.registerObjectLimit('o005', 6)           //Blademaster
      call f.registerObjectLimit('n03F', 6)           //Ogre Lord
      call f.registerObjectLimit('nckb', 2)           //Kodo
      call f.registerObjectLimit('nzep', 2)           //Goblin Zeppelin

      call f.registerObjectLimit('n065', 1)           //Drazilb
      call f.registerObjectLimit('o01R', 1)           //Nazgrel
      call f.registerObjectLimit('h04E', 1)           //Chen

      call f.registerObjectLimit('Robs', UNLIMITED)   //Berserker Strength
      call f.registerObjectLimit('Rotr', UNLIMITED)   //Troll Regeneration
      call f.registerObjectLimit('R023', UNLIMITED)   //Spiritual Infusion
      call f.registerObjectLimit('Roen', UNLIMITED)   //Ensnare
      call f.registerObjectLimit('Rwdm', UNLIMITED)   //War Drums
      call f.registerObjectLimit('R02I', UNLIMITED)   //Ogre Magi Adept Training
      call f.registerObjectLimit('R03Q', UNLIMITED)   //Warlock Adept Training
      call f.registerObjectLimit('Rorb', UNLIMITED)   //Reinforced Defenses
      call f.registerObjectLimit('Rosp', UNLIMITED)   //Spiked Barricades

      call f.registerObjectLimit('R00X', UNLIMITED)   //Bloodfury Mastery
      call f.registerObjectLimit('R015', UNLIMITED)   //Ogre Might Mastery
      call f.registerObjectLimit('R016', UNLIMITED)   //Troll Combat Mastery

      call f.registerObjectLimit('R02O', UNLIMITED)   //Rite of Blood
      call f.registerObjectLimit('R02Q', UNLIMITED)   //Rite of Strength
      
      call f.registerObjectLimit('R021', UNLIMITED)   //Horde War Machine
      call f.registerObjectLimit('R02M', UNLIMITED)   //True Horde
  endfunction
endlibrary