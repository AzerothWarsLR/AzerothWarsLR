library SentinelsConfig initializer OnInit requires Faction, TeamSetup

  globals
    LiegeFaction FACTION_SENTINELS
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_SENTINELS = LiegeFaction.create("Sentinels", PLAYER_COLOR_MINT, "|CFFBFFF80","ReplaceableTextures\\CommandButtons\\BTNPriestessOfTheMoon.blp", 3)
    set f = FACTION_SENTINELS
    set f.VictoryMusic = "NightElfVictory"
    set f.Team = TEAM_NIGHT_ELVES
    set f.PresenceResearch = 'R05Y'

    call f.registerObjectLimit('e00V', UNLIMITED)   //Temple of Elune
    call f.registerObjectLimit('e00R', UNLIMITED)   //Altar of Watchers 
    call f.registerObjectLimit('e00L', UNLIMITED)   //War Academy
    call f.registerObjectLimit('edob', UNLIMITED)   //Hunter's Hall
    call f.registerObjectLimit('eden', UNLIMITED)   //Ancient of Wonders
    call f.registerObjectLimit('e011', UNLIMITED)   //Night Elf Shipyard
    call f.registerObjectLimit('h03N', UNLIMITED)   //Enchanged Runestone
    call f.registerObjectLimit('h03M', UNLIMITED)   //Runestone
    call f.registerObjectLimit('n06O', UNLIMITED)   //Sentinel Embassy
    call f.registerObjectLimit('n06P', UNLIMITED)   //Sentinel Enclave
    call f.registerObjectLimit('n06J', UNLIMITED)   //Sentinel Outpost
    call f.registerObjectLimit('n06M', UNLIMITED)   //Residence 
    call f.registerObjectLimit('edos', UNLIMITED)   //Roost 

    call f.registerObjectLimit('ewsp', UNLIMITED)   //Wisp 
    call f.registerObjectLimit('e006', UNLIMITED)   //Priestess
    call f.registerObjectLimit('n06C', UNLIMITED)   //Trapper
    call f.registerObjectLimit('h04L', 6)           //Priestess of the Moon
    call f.registerObjectLimit('earc', UNLIMITED)   //Archer
    call f.registerObjectLimit('esen', UNLIMITED)   //Huntress
    call f.registerObjectLimit('ebal', 8)           //Glaive Thrower
    call f.registerObjectLimit('ehpr', 6)           //Hippogryph Rider
    call f.registerObjectLimit('nwat', UNLIMITED)   //Nightblade  
    call f.registerObjectLimit('etrs', UNLIMITED)   //Night Elf Transport Ship
    call f.registerObjectLimit('edes', UNLIMITED)   //Night Elf Frigate
    call f.registerObjectLimit('ebsh', 12)          //Night Elf Battleship
    call f.registerObjectLimit('nnmg', 12)          //Redeemed Highborne 

    call f.registerObjectLimit('e009', 1)           //Naisha

    call f.registerObjectLimit('R00S', UNLIMITED)   //Priestess Adept Training
    call f.registerObjectLimit('R064', UNLIMITED)   //Sentinel Fortifications
    call f.registerObjectLimit('R01W', UNLIMITED)   //Trapper Adept Training  
    call f.registerObjectLimit('R026', UNLIMITED)   //Elune's Power Infusion
    call f.registerObjectLimit('Reib', UNLIMITED)   //Improved Bows
    call f.registerObjectLimit('Reuv', UNLIMITED)   //Ultravision
    call f.registerObjectLimit('Remg', UNLIMITED)   //Upgraded Moon Glaive
    call f.registerObjectLimit('Roen', UNLIMITED)   //Ensnare
    call f.registerObjectLimit('R04E', UNLIMITED)   //Ysera's Gift (World Tree upgrade)
    call f.registerObjectLimit('R002', UNLIMITED)   //Blackwald Enhancement
    call f.registerObjectLimit('R03J', UNLIMITED)   //Wind Walk
    call f.registerObjectLimit('R013', UNLIMITED)   //Elune's Blessing
  endfunction
    
endlibrary