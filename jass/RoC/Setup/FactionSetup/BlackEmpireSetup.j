library BlackEmpireSetup requires Faction, TeamSetup

    globals
        Faction FACTION_BLACKEMPIRE
    endglobals

    public function OnInit takes nothing returns nothing
     local Faction f   
     set FACTION_BLACKEMPIRE = Faction.create("Black Empire", PLAYER_COLOR_TURQUOISE, "|cff008080","ReplaceableTextures\\CommandButtons\\BTNYogg-saronIcon.blp", 0)
     set f = FACTION_BLACKEMPIRE
     set f.Team = TEAM_OLDGOD
     set f.StartingGold = 150
     set f.StartingLumber = 500

            //Units
            call f.registerObjectLimit('h06U', UNLIMITED)   //Siphoning Crystal
            call f.registerObjectLimit('h09E', UNLIMITED)   //Madness Pool
            call f.registerObjectLimit('n0B2', UNLIMITED)   //Ominous Vault
            call f.registerObjectLimit('n0AV', UNLIMITED)   //Altar of madness
            call f.registerObjectLimit('n0AT', UNLIMITED)   //Cathedral of madness
            call f.registerObjectLimit('n0AW', UNLIMITED)   //Creation hive
            call f.registerObjectLimit('n0B3', UNLIMITED)   //Library of forbidden knowledge
            call f.registerObjectLimit('n0AX', UNLIMITED)   //prison of the unspeakable
            call f.registerObjectLimit('n0AU', UNLIMITED)   //pulsating portal
            call f.registerObjectLimit('n0AR', UNLIMITED)   //twisted halls
            call f.registerObjectLimit('n0AS', UNLIMITED)   //whispering chambers
            call f.registerObjectLimit('n0AY', UNLIMITED)   //acid spitter
            call f.registerObjectLimit('n0AZ', UNLIMITED)   //sleepeless watcher
            call f.registerObjectLimit('n0B1', UNLIMITED)   //Improved Spitter
            call f.registerObjectLimit('n0B0', UNLIMITED)   //Improved Watcher

            

            //Structures
            call f.registerObjectLimit('n05B', UNLIMITED)   //Cultist        
            call f.registerObjectLimit('o04Z', 12)          //Flying horror
            call f.registerObjectLimit('n0AH', 4)          //Deformed Chimera
            call f.registerObjectLimit('n0B4', 6)           //Reaper
            call f.registerObjectLimit('o01G', UNLIMITED)   //Macemen
            call f.registerObjectLimit('o04V', UNLIMITED)   //Huntsman
            call f.registerObjectLimit('u029', 12)           //Stygian Reavver
            call f.registerObjectLimit('n077', UNLIMITED)   //Sorcerer
            call f.registerObjectLimit('o04Y', UNLIMITED)   //Fateweaver
            call f.registerObjectLimit('h09F', UNLIMITED)           //Gladiator

            call f.registerObjectLimit('U02A', 1)           //R'khem
            call f.registerObjectLimit('E01D', 1)           //Volazj
            call f.registerObjectLimit('U02B', 1)           //Soggoth

            //Upgrades
            call f.registerObjectLimit('R02A', UNLIMITED)   //Void Infusion

            //Masteries

    endfunction
    
endlibrary