
library NewHordeConfig initializer OnInit requires Faction

  globals
    Faction FACTION_NEW_HORDE
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f

    set FACTION_NEW_HORDE = Faction.create("New Horde", PLAYER_COLOR_RED, "|c00ff0303","ReplaceableTextures\\CommandButtons\\BTNThrallNew.blp", 4)
    set f = FACTION_NEW_HORDE

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
    call f.registerObjectLimit('oshy', UNLIMITED)   //Shipyard
    call f.registerObjectLimit('o009', UNLIMITED)   //Horde Embassy
    call f.registerObjectLimit('ovln', UNLIMITED)   //Voodoo Lounge

    call f.registerObjectLimit('opeo', UNLIMITED)   //Peon
    call f.registerObjectLimit('ogru', UNLIMITED)   //Grunt
    call f.registerObjectLimit('otau', UNLIMITED)   //Tauren
    call f.registerObjectLimit('ohun', UNLIMITED)   //Troll Headhunter
    call f.registerObjectLimit('h04M', 9)           //Dynamite Team
    call f.registerObjectLimit('okod', 2)           //Kodo Beast
    call f.registerObjectLimit('nzep', 2)           //Goblin Zeppelin
    call f.registerObjectLimit('owyv', 6)           //Wind Rider
    call f.registerObjectLimit('nogn', UNLIMITED)   //Stonemaul Ogre Magi
    call f.registerObjectLimit('otbr', 6)           //Troll Batrider
    call f.registerObjectLimit('odoc', UNLIMITED)   //Troll Witch Doctor
    call f.registerObjectLimit('oshm', UNLIMITED)   //Shaman
    call f.registerObjectLimit('ospw', UNLIMITED)   //Spirit Walker
    call f.registerObjectLimit('o00A', 6)           //Far Seer
    call f.registerObjectLimit('obot', UNLIMITED)   //Transport Ship
    call f.registerObjectLimit('odes', UNLIMITED)   //Orc Frigate
    call f.registerObjectLimit('ojgn', 24)          //Juggernaught
    call f.registerObjectLimit('n062', UNLIMITED)   //Goblin Shredder

    call f.registerObjectLimit('h00C', 1)           //Drek'thar
    call f.registerObjectLimit('n065', 1)           //Drazilb
    call f.registerObjectLimit('o01R', 1)           //Nazgrel
    call f.registerObjectLimit('h04E', 1)           //Chen

    call f.registerObjectLimit('Rolf', UNLIMITED)   //Liquid Fire
    call f.registerObjectLimit('Robs', UNLIMITED)   //Berseker Strength
    call f.registerObjectLimit('Rotr', UNLIMITED)   //Troll Regeneration
    call f.registerObjectLimit('Rows', UNLIMITED)   //Pulverize
    call f.registerObjectLimit('Rost', UNLIMITED)   //Shaman Adept Training
    call f.registerObjectLimit('R023', UNLIMITED)   //Spiritual Infusion
    call f.registerObjectLimit('R02I', UNLIMITED)   //Ogre Magi Adept Training
    call f.registerObjectLimit('Rorb', UNLIMITED)   //Reinforced Defenses
    call f.registerObjectLimit('Rosp', UNLIMITED)   //Spiked Barricades
    call f.registerObjectLimit('Rwdm', UNLIMITED)   //War Drums
    call f.registerObjectLimit('Rowd', UNLIMITED)   //Witch Doctor Adept Training
    call f.registerObjectLimit('Rowt', UNLIMITED)   //Spirit Walker Adept Training
    call f.registerObjectLimit('Rovs', UNLIMITED)   //Envenomed Spears

    call f.registerObjectLimit('R00R', UNLIMITED)   //Spiritual Mastery
    call f.registerObjectLimit('R00W', UNLIMITED)   //Tauren Mastery
    call f.registerObjectLimit('R017', UNLIMITED)   //Warrior Spirit Mastery

    call f.registerObjectLimit('R01O', UNLIMITED)   //Age of Prosperity
    call f.registerObjectLimit('R02T', UNLIMITED)   //Season of Thunder
    call f.registerObjectLimit('R02R', UNLIMITED)   //Voodic Command

    call f.registerObjectLimit('R04X', UNLIMITED)   //Tauren Elite Mastery
    call f.registerObjectLimit('R04Y', UNLIMITED)   //Warrior Ascendance Mastery
    call f.registerObjectLimit('R04Z', UNLIMITED)   //Elemental Connection Mastery
    
    call f.registerObjectLimit('R021', UNLIMITED)   //Horde War Machine
    call f.registerObjectLimit('Rhfs', UNLIMITED)   //Dragmentation Shards
    call f.registerObjectLimit('R01T', UNLIMITED)   //Move your arse
  endfunction 
  
endlibrary