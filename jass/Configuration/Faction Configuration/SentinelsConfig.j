library SentinelsConfig initializer OnInit requires Faction

  globals
    constant integer FACTION_SENTINELS = 9
  endglobals

    private function OnInit takes nothing returns nothing
        local Faction f
        
        set f = Faction.create(FACTION_SENTINELS,"Sentinels", PLAYER_COLOR_MINT, "|CFFBFFF80","ReplaceableTextures\\CommandButtons\\BTNPriestessOfTheMoon.blp")
            call f.registerObjectLimit('e00V', UNLIMITED)   //Temple of Elune
            call f.registerObjectLimit('eate', UNLIMITED)   //Altar of Elders   
            call f.registerObjectLimit('eaom', UNLIMITED)   //Ancient of War
            call f.registerObjectLimit('edob', UNLIMITED)   //Hunter's Hall
            call f.registerObjectLimit('eden', UNLIMITED)   //Ancient of Wonders
            call f.registerObjectLimit('eshy', UNLIMITED)   //Night Elf Shipyard
            call f.registerObjectLimit('h03N', UNLIMITED)   //Enchanged Runestone
            call f.registerObjectLimit('h03M', UNLIMITED)   //Runestone
            call f.registerObjectLimit('n06O', UNLIMITED)   //Sentinel Embassy
            call f.registerObjectLimit('n06P', UNLIMITED)   //Sentinel Enclave
            call f.registerObjectLimit('n06J', UNLIMITED)   //Sentinel Outpost
            call f.registerObjectLimit('n06M', UNLIMITED)   //Residence 

            call f.registerObjectLimit('ewsp', UNLIMITED)   //Wisp 
            call f.registerObjectLimit('e006', UNLIMITED)   //Priestess
            call f.registerObjectLimit('n06C', UNLIMITED)   //Trapper
            call f.registerObjectLimit('n06E', 6)           //Shadowleaf Sentinel
            call f.registerObjectLimit('earc', UNLIMITED)   //Archer
            call f.registerObjectLimit('esen', UNLIMITED)   //Huntress
            call f.registerObjectLimit('ebal', 8)           //Glaive Thrower
            call f.registerObjectLimit('ehpr', 6)           //Hippogryph Rider
            call f.registerObjectLimit('nwat', UNLIMITED)   //Nightblade  
            call f.registerObjectLimit('etrs', UNLIMITED)   //Night Elf Transport Ship
            call f.registerObjectLimit('edes', UNLIMITED)   //Night Elf Frigate
            call f.registerObjectLimit('ebsh', 12)          //Night Elf Battleship

            call f.registerObjectLimit('R00S', UNLIMITED)   //Priestess Adept Training
            call f.registerObjectLimit('R01W', UNLIMITED)   //Trapper Adept Training  
            call f.registerObjectLimit('R026', UNLIMITED)   //Elune's Power Infusion
            call f.registerObjectLimit('Reib', UNLIMITED)   //Improved Bows
            call f.registerObjectLimit('Resc', UNLIMITED)   //Sentinel
            call f.registerObjectLimit('Reuv', UNLIMITED)   //Ultravision
            call f.registerObjectLimit('Remg', UNLIMITED)   //Upgraded Moon Glaive
            call f.registerObjectLimit('Roen', UNLIMITED)   //Ensnare
            call f.registerObjectLimit('R04E', UNLIMITED)   //Ysera's Gift (World Tree upgrade)

            call f.registerObjectLimit('R00U', UNLIMITED)   //Aerial Expertise Mastery
            call f.registerObjectLimit('R007', UNLIMITED)   //Lost Heritage Mastery
            call f.registerObjectLimit('R03J', UNLIMITED)   //Wind COntrol Mastery
            
            call f.registerObjectLimit('R04H', UNLIMITED)   //Night Elves United
    endfunction
    
endlibrary
