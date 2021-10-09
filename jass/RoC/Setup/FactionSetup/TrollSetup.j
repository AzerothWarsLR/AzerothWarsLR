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
    call f.registerObjectLimit('o04X', UNLIMITED)   //Loa Shrine

    call f.registerObjectLimit('o04A', UNLIMITED)   //Peon
    call f.registerObjectLimit('h021', UNLIMITED)   //Grunt
    call f.registerObjectLimit('o04D', UNLIMITED)   //Troll Headhunter
    call f.registerObjectLimit('n09E', 2)           //Storm Wyrm
    call f.registerObjectLimit('e00Z', 8)           //Direhorn
    call f.registerObjectLimit('o04F', UNLIMITED)   //Troll Witch Doctor
    call f.registerObjectLimit('o04G', UNLIMITED)   //Haruspex
    call f.registerObjectLimit('o04E', 6)           //Boneseer
    call f.registerObjectLimit('h05D', UNLIMITED)   //Raptor Rider 
    call f.registerObjectLimit('o04W', 24)  	      //Golden Vessel
    call f.registerObjectLimit('ojgn', 6)          //Juggernaught
    call f.registerObjectLimit('o021', 12)          //Ravager
    call f.registerObjectLimit('nftk', 12)          //Warlord
    call f.registerObjectLimit('o02K', 6)          //Bear Rider

    call f.registerObjectLimit('O026', 1)           //Rasthakan
    call f.registerObjectLimit('O01J', 1)           //Zul

    call f.registerObjectLimit('Rers', UNLIMITED)   //Resistant Skin
    call f.registerObjectLimit('R00H', UNLIMITED)   //Animal Companion

  endfunction
    
endlibrary