library FrostwolfSetup requires Faction, TeamSetup

  globals
    Faction FACTION_FROSTWOLF
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f
    set FACTION_FROSTWOLF = Faction.create("Frostwolf", PLAYER_COLOR_RED, "|c00ff0303","ReplaceableTextures\\CommandButtons\\BTNThrall.blp", 3)
    set f = FACTION_FROSTWOLF
    set f.Team = TEAM_HORDE
    set f.UndefeatedResearch = 'R05V'
    set f.StartingGold = 150
    set f.StartingLumber = 500

    call f.registerObjectLimit('ogre', UNLIMITED)   //Great Hall
    call f.registerObjectLimit('ostr', UNLIMITED)   //Stronghold
    call f.registerObjectLimit('ofrt', UNLIMITED)   //Fortress
    call f.registerObjectLimit('oalt', UNLIMITED)   //Altar of Storms
    call f.registerObjectLimit('obar', UNLIMITED)   //Barracks
    call f.registerObjectLimit('ofor', UNLIMITED)   //War Mill
    call f.registerObjectLimit('otto', UNLIMITED)   //Tauren Totem
    call f.registerObjectLimit('osld', UNLIMITED)   //Spirit Lodge
    call f.registerObjectLimit('otrb', UNLIMITED)   //Orc Burrow
    call f.registerObjectLimit('owtw', UNLIMITED)   //Watch Tower
    call f.registerObjectLimit('o002', UNLIMITED)   //Improved Watch Tower
    call f.registerObjectLimit('ovln', UNLIMITED)   //Voodoo Lounge
    call f.registerObjectLimit('oshy', UNLIMITED)   //Shipyard
    call f.registerObjectLimit('o01M', UNLIMITED)   //Goblin Laboratory

    call f.registerObjectLimit('opeo', UNLIMITED)   //Peon
    call f.registerObjectLimit('ogru', UNLIMITED)   //Grunt
    call f.registerObjectLimit('otau', UNLIMITED)   //Tauren
    call f.registerObjectLimit('ohun', UNLIMITED)   //Troll Headhunter
    call f.registerObjectLimit('ocat', 6)           //Catapult
    call f.registerObjectLimit('otbr', 12)          //Troll Batrider
    call f.registerObjectLimit('odoc', UNLIMITED)   //Troll Witch Doctor
    call f.registerObjectLimit('oshm', UNLIMITED)   //Shaman
    call f.registerObjectLimit('ospw', UNLIMITED)   //Spirit Walker
    call f.registerObjectLimit('o00A', 6)           //Far Seer
    call f.registerObjectLimit('obot', 24)  	    //Transport Ship
    call f.registerObjectLimit('odes', 24)  	    //Orc Frigate
    call f.registerObjectLimit('oosc', UNLIMITED)   //Pack Kodo
    call f.registerObjectLimit('ojgn', 12)          //Juggernaught
    call f.registerObjectLimit('n061', 12)          //Goblin Sapper
    call f.registerObjectLimit('n062', 8)           //Goblin Shredder

    call f.registerObjectLimit('h00C', 1)           //Drek'thar

    call f.registerObjectLimit('Rows', UNLIMITED)   //Improved Pulverize
    call f.registerObjectLimit('Rost', UNLIMITED)   //Shaman Adept Training
    call f.registerObjectLimit('Rowd', UNLIMITED)   //Witch Doctor Adept Training
    call f.registerObjectLimit('Rowt', UNLIMITED)   //Spirit Walker Adept Training
    call f.registerObjectLimit('R023', UNLIMITED)   //Spiritual Infusion
    call f.registerObjectLimit('Rolf', UNLIMITED)   //Liquid Fire
    call f.registerObjectLimit('Rosp', UNLIMITED)   //Spiked Barricades
    call f.registerObjectLimit('Rorb', UNLIMITED)   //reinforced Defenses
    call f.registerObjectLimit('R00H', UNLIMITED)   //Animal Companion
    call f.registerObjectLimit('R00R', UNLIMITED)   //Improved Chain Lightning
    call f.registerObjectLimit('R00W', UNLIMITED)   //Toughened Hides
    call f.registerObjectLimit('R01Z', UNLIMITED)   //Battle Stations
    call f.SetObjectLevel('R01Z', 1)                //Battle Stations
  endfunction
    
endlibrary