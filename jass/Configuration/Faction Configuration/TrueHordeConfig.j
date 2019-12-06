library TrueHordeConfig initializer OnInit requires Faction

  globals
    Faction FACTION_TRUE_HORDE
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f
    set FACTION_TRUE_HORDE = Faction.create("True Horde", PLAYER_COLOR_ORANGE, "|c00ff8000","ReplaceableTextures\\CommandButtons\\BTNRaider.blp")
    set f = FACTION_TRUE_HORDE

      call f.registerObjectLimit('ogre', UNLIMITED)   //Great Hall
      call f.registerObjectLimit('ostr', UNLIMITED)   //Stronghold
      call f.registerObjectLimit('ofrt', UNLIMITED)   //Fortress
      call f.registerObjectLimit('oalt', UNLIMITED)   //Altar of Storms
      call f.registerObjectLimit('obar', UNLIMITED)   //Barracks
      call f.registerObjectLimit('ofor', UNLIMITED)   //War Mill
      call f.registerObjectLimit('osld', UNLIMITED)   //Spirit Lodge
      call f.registerObjectLimit('obea', UNLIMITED)   //Bestiary
      call f.registerObjectLimit('otrb', UNLIMITED)   //Orc Burrow
      call f.registerObjectLimit('owtw', UNLIMITED)   //Watch Tower
      call f.registerObjectLimit('o002', UNLIMITED)   //Improved Watch Tower
      call f.registerObjectLimit('ovln', UNLIMITED)   //Voodoo lounge
      call f.registerObjectLimit('oshy', UNLIMITED)   //Shipyard

      call f.registerObjectLimit('opeo', UNLIMITED)   //Peon
      call f.registerObjectLimit('orai', UNLIMITED)   //Raider
      call f.registerObjectLimit('okod', 2)           //Kodo
      call f.registerObjectLimit('noga', 6)           //Orc Champion
      call f.registerObjectLimit('o01K', UNLIMITED)   //Warsong Grunt
      call f.registerObjectLimit('o00I', 6)           //Horde War Machine
      call f.registerObjectLimit('obot', UNLIMITED)   //Transport Ship
      call f.registerObjectLimit('odes', UNLIMITED)   //Orc Frigate
      call f.registerObjectLimit('ojgn', 24)          //Juggernaught
      call f.registerObjectLimit('o00G', 6)	    //Blademaster
      call f.registerObjectLimit('owyv', 6)           //Wind Rider
      call f.registerObjectLimit('oshm', UNLIMITED)   //Shaman
      call f.registerObjectLimit('o00S', UNLIMITED)   //Spear Thrower
      call f.registerObjectLimit('o00P', UNLIMITED)   //Orc Witch Doctor
      call f.registerObjectLimit('o014', 6)  	    //Far Seer
      call f.registerObjectLimit('o00W', 2) 	    //War Station

      call f.registerObjectLimit('Robs', UNLIMITED)   //Berserker Strength
      call f.registerObjectLimit('R023', UNLIMITED)   //Spiritual Infusion
      call f.registerObjectLimit('Roen', UNLIMITED)   //Ensnare
      call f.registerObjectLimit('Rwdm', UNLIMITED)   //War Drums
      call f.registerObjectLimit('Rorb', UNLIMITED)   //Reinforced Defenses
      call f.registerObjectLimit('Rosp', UNLIMITED)   //Spiked Barricades
      call f.registerObjectLimit('Rost', UNLIMITED)   //Shaman Adept Training
      call f.registerObjectLimit('Rovs', UNLIMITED)   //Envenomed Spears
      call f.registerObjectLimit('R01J', UNLIMITED)   //Witch Doctor Adept Training
      
      call f.registerObjectLimit('R021', UNLIMITED)   //Horde War Machine
  endfunction 
endlibrary
