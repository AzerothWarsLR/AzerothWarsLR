library ScarletSetup requires Faction, TeamSetup

  globals
    LiegeFaction FACTION_SCARLET
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f
    set FACTION_SCARLET = LiegeFaction.create("Militia", PLAYER_COLOR_MAROON, "|cff800000","ReplaceableTextures\\CommandButtons\\BTNPeasant.blp")
    set f = FACTION_SCARLET
    set f.Team = TEAM_ALLIANCE
    set f.StartingGold = 150
    set f.StartingLumber = 500

    //Structures
    call f.ModObjectLimit('h07X', UNLIMITED)   //Town Hall
    call f.ModObjectLimit('h07Y', UNLIMITED)   //Keep
    call f.ModObjectLimit('h07Z', UNLIMITED)   //Castle
    call f.ModObjectLimit('h088', UNLIMITED)   //Farm
    call f.ModObjectLimit('h080', UNLIMITED)   //Altar of Kings
    call f.ModObjectLimit('h081', UNLIMITED)   //Barracks
    call f.ModObjectLimit('h06G', UNLIMITED)   //Blacksmith
    call f.ModObjectLimit('h083', UNLIMITED)   //Chapel
    call f.ModObjectLimit('h084', UNLIMITED)   //Scout Tower
    call f.ModObjectLimit('h085', UNLIMITED)   //Guard Tower
    call f.ModObjectLimit('h087', UNLIMITED)   //Guard Tower (Improved)
    call f.ModObjectLimit('hshy', UNLIMITED)   //Alliance Shipyard
    call f.ModObjectLimit('h086', UNLIMITED)   //Marketplace 
    call f.ModObjectLimit('h082', UNLIMITED)   //Aviary      
    call f.ModObjectLimit('h097', UNLIMITED)   //Training Camp 
    call f.ModObjectLimit('h09M', UNLIMITED)   //Training Camp 2
    call f.ModObjectLimit('h09N', UNLIMITED)   //Training Camp 3
    call f.ModObjectLimit('h09P', UNLIMITED)   //Training Camp 4
    call f.ModObjectLimit('h09O', UNLIMITED)   //Training Camp 5
    call f.ModObjectLimit('h09Q', UNLIMITED)   //Training Camp 6

    //Units
    call f.ModObjectLimit('hpea', UNLIMITED)   //Peasant
    call f.ModObjectLimit('hbot', 12) 	    //Alliance Transport Ship
    call f.ModObjectLimit('hdes', 12) 	    //Alliance Frigate
    call f.ModObjectLimit('hbsh', 6)          //Alliance Battle Ship
    call f.ModObjectLimit('h08I', UNLIMITED)   //Crusader
    call f.ModObjectLimit('h08M', UNLIMITED)   //Men-at-arms
    call f.ModObjectLimit('h095', UNLIMITED)   //Bowman
    call f.ModObjectLimit('h096', UNLIMITED)   //Light Cavalry
    call f.ModObjectLimit('h08L', UNLIMITED)   //Cavalier
    call f.ModObjectLimit('n068', UNLIMITED)   //Inquisitor
    call f.ModObjectLimit('h06B', 6)           //Templar
    call f.ModObjectLimit('h08J', UNLIMITED)   //Arbalest
    call f.ModObjectLimit('h08K', UNLIMITED)   //Chaplain
    call f.ModObjectLimit('n09N', 6)           //Bishop
    call f.ModObjectLimit('n07N', 6)           //Airship
    call f.ModObjectLimit('o04C', 6)           //Mortar
    call f.ModObjectLimit('o00X', 3)           //Archangel
    call f.ModObjectLimit('h09X', 12)           //Mounted Archer

    //Heroes
    call f.ModObjectLimit('H08G', 1)           //Saiden
    call f.ModObjectLimit('H08H', 1)           //Isilien
    call f.ModObjectLimit('H00Y', 1)           //Brigitte
    call f.ModObjectLimit('H0A2', 1)           //Renault
    call f.ModObjectLimit('H09Z', 1)           //Tirion

    call f.ModObjectLimit('h09H', 1)           //Herod
    call f.ModObjectLimit('h05W', 1)           //Isilien

    //Upgrades
    call f.ModObjectLimit('R05D', UNLIMITED)   //Chaplain Adept Training
    call f.ModObjectLimit('R04F', UNLIMITED)   //Inquisitor traiing
    call f.ModObjectLimit('R00K', UNLIMITED)   //Power Infusion
    call f.ModObjectLimit('Rhse', UNLIMITED)   //Magic Sentry
    call f.ModObjectLimit('Rhlh', UNLIMITED)   //Improved Lumber Harvesting
    call f.ModObjectLimit('Rhac', UNLIMITED)   //Improved Masonry
    call f.ModObjectLimit('R06Q', UNLIMITED)   //Paladin Adept Training
    call f.ModObjectLimit('R01P', UNLIMITED)   //Ensnare

  endfunction
    
endlibrary