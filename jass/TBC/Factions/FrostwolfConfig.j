library FrostwolfSetup initializer OnInit requires Faction, TeamSetup

  globals
    LiegeFaction FACTION_FROSTWOLF
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f
    set FACTION_FROSTWOLF = LiegeFaction.create("Frostwolf", PLAYER_COLOR_RED, "|c00ff0303","ReplaceableTextures\\CommandButtons\\BTNThrall.blp", 3)
    set f = FACTION_FROSTWOLF
    set f.VictoryMusic = "OrcVictory"
    set f.Team = TEAM_WESTALLIANCE
    set f.PresenceResearch = 'R05V'

    call f.ModObjectLimit('ogre', UNLIMITED)   //Great Hall
    call f.ModObjectLimit('ostr', UNLIMITED)   //Stronghold
    call f.ModObjectLimit('ofrt', UNLIMITED)   //Fortress
    call f.ModObjectLimit('oalt', UNLIMITED)   //Altar of Storms
    call f.ModObjectLimit('obar', UNLIMITED)   //Barracks
    call f.ModObjectLimit('ofor', UNLIMITED)   //War Mill
    call f.ModObjectLimit('otto', UNLIMITED)   //Tauren Totem
    call f.ModObjectLimit('osld', UNLIMITED)   //Spirit Lodge
    call f.ModObjectLimit('obea', UNLIMITED)   //Bestiary
    call f.ModObjectLimit('otrb', UNLIMITED)   //Orc Burrow
    call f.ModObjectLimit('owtw', UNLIMITED)   //Watch Tower
    call f.ModObjectLimit('o002', UNLIMITED)   //Improved Watch Tower
    call f.ModObjectLimit('ovln', UNLIMITED)   //Voodoo Lounge
    call f.ModObjectLimit('oshy', UNLIMITED)   //Shipyard

    call f.ModObjectLimit('opeo', UNLIMITED)   //Peon
    call f.ModObjectLimit('ogru', UNLIMITED)   //Grunt
    call f.ModObjectLimit('otau', UNLIMITED)   //Tauren
    call f.ModObjectLimit('ohun', UNLIMITED)   //Troll Headhunter
    call f.ModObjectLimit('ocat', 6)           //Catapult
    call f.ModObjectLimit('otbr', 12)          //Troll Batrider
    call f.ModObjectLimit('owyv', 8)           //Wind Rider
    call f.ModObjectLimit('odoc', UNLIMITED)   //Troll Witch Doctor
    call f.ModObjectLimit('oshm', UNLIMITED)   //Shaman
    call f.ModObjectLimit('ospw', UNLIMITED)   //Spirit Walker
    call f.ModObjectLimit('o00A', 6)           //Far Seer
    call f.ModObjectLimit('okod', 4)           //Kodo Beast
    call f.ModObjectLimit('obot', UNLIMITED)   //Transport Ship
    call f.ModObjectLimit('odes', UNLIMITED)   //Orc Frigate
    call f.ModObjectLimit('oosc', UNLIMITED)   //Pack Kodo
    call f.ModObjectLimit('ojgn', 12)          //Juggernaught

    call f.ModObjectLimit('h00C', 1)           //Drek'thar

    call f.ModObjectLimit('Rovs', UNLIMITED)   //Envenomed Spears
    call f.ModObjectLimit('Rows', UNLIMITED)   //Improved Pulverize
    call f.ModObjectLimit('Rost', UNLIMITED)   //Shaman Adept Training
    call f.ModObjectLimit('Rowd', UNLIMITED)   //Witch Doctor Adept Training
    call f.ModObjectLimit('Rowt', UNLIMITED)   //Spirit Walker Adept Training
    call f.ModObjectLimit('R023', UNLIMITED)   //Spiritual Infusion
    call f.ModObjectLimit('Rolf', UNLIMITED)   //Liquid Fire
    call f.ModObjectLimit('Rosp', UNLIMITED)   //Spiked Barricades
    call f.ModObjectLimit('Rorb', UNLIMITED)   //reinforced Defenses
    call f.ModObjectLimit('R00H', UNLIMITED)   //Animal Companion
    call f.ModObjectLimit('R00D', UNLIMITED)   //For the Horde!
    call f.ModObjectLimit('R00R', UNLIMITED)   //Improved Chain Lightning
    call f.ModObjectLimit('R00W', UNLIMITED)   //Toughened Hides
    call f.ModObjectLimit('R017', UNLIMITED)   //Kor'kron Guardsmen
  endfunction
    
endlibrary