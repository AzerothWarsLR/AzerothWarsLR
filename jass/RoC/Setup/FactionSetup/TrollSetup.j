library TrollSetup requires Faction, TeamSetup

  globals
    Faction FACTION_TROLL
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f
    set FACTION_TROLL = Faction.create("Zandalar", PLAYER_COLOR_PEACH, "|cffff8c6c","ReplaceableTextures\\CommandButtons\\BTNHeadHunterBerserker.blp", 0)
    set f = FACTION_TROLL
    set f.Team = TEAM_HORDE
    set f.StartingGold = 150
    set f.StartingLumber = 500

    call f.registerObjectLimit('o03R', UNLIMITED)   //Great Hall
    call f.registerObjectLimit('o03Y', UNLIMITED)   //Stronghold
    call f.registerObjectLimit('o03Z', UNLIMITED)   //Fortress
    call f.registerObjectLimit('o040', UNLIMITED)   //Altar of Storms
    call f.registerObjectLimit('o041', UNLIMITED)   //Barracks
    call f.registerObjectLimit('o042', UNLIMITED)   //War Mill
    call f.registerObjectLimit('o044', UNLIMITED)   //Tauren Totem
    call f.registerObjectLimit('o043', UNLIMITED)   //Spirit Lodge
    call f.registerObjectLimit('o045', UNLIMITED)   //Orc Burrow
    call f.registerObjectLimit('o046', UNLIMITED)   //Watch Tower
    call f.registerObjectLimit('o048', UNLIMITED)   //Improved Watch Tower
    call f.registerObjectLimit('o047', UNLIMITED)   //Voodoo Lounge
    call f.registerObjectLimit('o049', UNLIMITED)   //Shipyard

    call f.registerObjectLimit('o04A', UNLIMITED)   //Peon
    call f.registerObjectLimit('h021', UNLIMITED)   //Grunt
    call f.registerObjectLimit('o04D', UNLIMITED)   //Troll Headhunter
    call f.registerObjectLimit('n07R', 8)           //WarTurtle
    call f.registerObjectLimit('e00Z', 6)           //Direhorn
    call f.registerObjectLimit('o04F', UNLIMITED)   //Troll Witch Doctor
    call f.registerObjectLimit('o04G', UNLIMITED)   //Haruspex
    call f.registerObjectLimit('o04E', 6)           //Boneseer
    call f.registerObjectLimit('h05D', UNLIMITED)   //Raptor Rider 
    call f.registerObjectLimit('obot', 24)  	    //Transport Ship
    call f.registerObjectLimit('odes', 24)  	    //Orc Frigate
    call f.registerObjectLimit('ojgn', 12)          //Juggernaught

    call f.registerObjectLimit('O026', 1)           //Rasthakan
    call f.registerObjectLimit('O01J', 1)           //Zul
    call f.registerObjectLimit('H08M', 1)           //Ju'loa

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