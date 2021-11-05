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
            call f.registerObjectLimit('n071', UNLIMITED)   //Pillars of C'thun
            call f.registerObjectLimit('o00R', UNLIMITED)   //Black Pyramid
            call f.registerObjectLimit('ushp', UNLIMITED)   //Undead Shipyard
            call f.registerObjectLimit('o00D', UNLIMITED)   //Ancient Tomb
            call f.registerObjectLimit('u01F', UNLIMITED)   //Altar of the Old Ones
            call f.registerObjectLimit('u01G', UNLIMITED)   //Spirit Hall
            call f.registerObjectLimit('u01H', UNLIMITED)   //Void Portal
            call f.registerObjectLimit('u01I', UNLIMITED)   //Chamber of Wonders
            call f.registerObjectLimit('u020', UNLIMITED)   //Monument
            call f.registerObjectLimit('u021', UNLIMITED)   //Temple
            call f.registerObjectLimit('u022', UNLIMITED)   //Nexus

            

            //Structures
            call f.registerObjectLimit('u019', UNLIMITED)   //Cultist        
            call f.registerObjectLimit('h01K', 12)          //Silithid Overlord
            call f.registerObjectLimit('o02N', 24)          //Wasp
            call f.registerObjectLimit('h01N', 8)          //Corrupter
            call f.registerObjectLimit('o000', 6)           //Silithid Colossus
            call f.registerObjectLimit('o00L', UNLIMITED)   //Silithid Reaver
            call f.registerObjectLimit('n06I', UNLIMITED)   //Faceless One
            call f.registerObjectLimit('u013', UNLIMITED)   //Giant Scarab
            call f.registerObjectLimit('n05V', UNLIMITED)   //Faceless Shadow Weaver
            call f.registerObjectLimit('n060', UNLIMITED)   //Silithid Tunneler
            call f.registerObjectLimit('o001', 6)           //Tol'vir Statue

            call f.registerObjectLimit('U00Z', 1)           //Moam
            call f.registerObjectLimit('E005', 1)           //Skeram

            //Upgrades
            call f.registerObjectLimit('Ruwb', UNLIMITED)   //Web
            call f.registerObjectLimit('R02A', UNLIMITED)   //Void Infusion

            //Masteries

    endfunction
    
endlibrary