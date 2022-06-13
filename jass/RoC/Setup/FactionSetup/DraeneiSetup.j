
library DraeneiSetup requires Faction, TeamSetup

  globals
    LiegeFaction FACTION_DRAENEI
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_DRAENEI = LiegeFaction.create("The Exodar", PLAYER_COLOR_NAVY, "|cff000080","ReplaceableTextures\\CommandButtons\\BTNBOSSVelen.blp")
    set f = FACTION_DRAENEI
    set f.Team = TEAM_DRAENEI
    set f.PresentResearch = 'R06E'
    set f.StartingGold = 200
    set f.StartingLumber = 500

    call f.ModObjectLimit('o02P', UNLIMITED)   //Crystal Hall
    call f.ModObjectLimit('o050', UNLIMITED)   //Metropolis
    call f.ModObjectLimit('o051', UNLIMITED)   //Divine Citadel
    call f.ModObjectLimit('o058', UNLIMITED)   //Altar of Light
    call f.ModObjectLimit('o052', UNLIMITED)   //Ceremonial Altar
    call f.ModObjectLimit('o053', UNLIMITED)   //Smithery
    call f.ModObjectLimit('o054', UNLIMITED)   //Astral Sanctum
    call f.ModObjectLimit('o055', UNLIMITED)   //Crystal Spire
    call f.ModObjectLimit('o056', UNLIMITED)   //Arcane Well
    call f.ModObjectLimit('o057', UNLIMITED)   //Vaults of Relic
    call f.ModObjectLimit('u00U', UNLIMITED)   //Crystal Protector
    call f.ModObjectLimit('u01Q', UNLIMITED)   //Crystal Protector improved
    call f.ModObjectLimit('o059', UNLIMITED)   //Improved Ancient Protector 

    call f.ModObjectLimit('o05A', UNLIMITED)   //Wisp 
    call f.ModObjectLimit('o05B', UNLIMITED)   //Defender
    call f.ModObjectLimit('h09T', UNLIMITED)   //Rangari
    call f.ModObjectLimit('e01K', 3)           //Polybolos
    call f.ModObjectLimit('o05D', UNLIMITED)   //Elementalist
    call f.ModObjectLimit('o05C', UNLIMITED)   //Luminarch
    call f.ModObjectLimit('h09R', 6)           //Vindicator
    call f.ModObjectLimit('nmdr', UNLIMITED)   //Elekk
    call f.ModObjectLimit('h09U', 4)           //Elekk Knight
    call f.ModObjectLimit('u02H', 6)           //Nether Ray

    call f.ModObjectLimit('etrs', 12)   	    //Night Elf Transport Ship
    call f.ModObjectLimit('edes', 12) 	      //Night Elf Frigate
    call f.ModObjectLimit('ebsh', 6)          //Night Elf Battleship

    call f.ModObjectLimit('H09S', 1)           //Maraad
    call f.ModObjectLimit('E01I', 1)           //Velen
    call f.ModObjectLimit('E01J', 1)           //Nobundo

    call f.ModObjectLimit('R023', UNLIMITED)   //Spiritual Infusion
    call f.ModObjectLimit('R078', UNLIMITED)   //Elementalist training
    call f.ModObjectLimit('R07C', UNLIMITED)   //Luminarch training

  endfunction
    
endlibrary