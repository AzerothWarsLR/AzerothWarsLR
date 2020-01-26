
library NzothConfig initializer OnInit requires Faction

    globals
        Faction FACTION_NZOTH
    endglobals

    private function OnInit takes nothing returns nothing
        local Faction f

        set FACTION_NZOTH = Faction.create("Nazjatar", PLAYER_COLOR_LAVENDER, "|c00BE00FE","ReplaceableTextures\\CommandButtons\\BTNNagaSummoner.blp", 5)
        set f = FACTION_NZOTH     

            //Units
            call f.registerObjectLimit('nmpe', UNLIMITED)   //Mur'gul Slave
            call f.registerObjectLimit('h03L', UNLIMITED)   //Myrmidon
            call f.registerObjectLimit('nnsw', UNLIMITED)   //Naga Siren
            call f.registerObjectLimit('nsnp', UNLIMITED)   //Snap Dragon
            call f.registerObjectLimit('nnsu', UNLIMITED)   //Summoner
            call f.registerObjectLimit('nwgs', 6)           //Couatl
            call f.registerObjectLimit('nnrg', 6)           //Naga Royal Guard
            call f.registerObjectLimit('nhyc', 8)           //Dragon Turtle
            call f.registerObjectLimit('nlds', UNLIMITED)   //Deepseer
            call f.registerObjectLimit('nlpd', UNLIMITED)   //Scavenger
            call f.registerObjectLimit('n06K', UNLIMITED)   //Scout
            call f.registerObjectLimit('nsgb', 2)   	    //Behemoth
            call f.registerObjectLimit('nahy', 2)           //Hydra
            call f.registerObjectLimit('n06L', UNLIMITED)   //Transport Turtle
            call f.registerObjectLimit('n008', UNLIMITED)   //Spider Crab Behemoth


                                

            //Structures
            call f.registerObjectLimit('nmrb', UNLIMITED)   //Trading Post
            call f.registerObjectLimit('nnad', UNLIMITED)   //Altar
            call f.registerObjectLimit('nnfm', UNLIMITED)   //Coral Bed
            call f.registerObjectLimit('nnsa', UNLIMITED)   //Shrine of Azsara
            call f.registerObjectLimit('nnsg', UNLIMITED)   //Spawning Ground
            call f.registerObjectLimit('nntt', UNLIMITED)   //Temple of tides
            call f.registerObjectLimit('h06S', UNLIMITED)   //Lumber Camp
            call f.registerObjectLimit('n0A3', UNLIMITED)   //Deap Sea Pool
            call f.registerObjectLimit('n005', UNLIMITED)   //Improved Tidal Guardian
            call f.registerObjectLimit('nntg', UNLIMITED)   //Tidal Guardia


            //Upgrades
            call f.registerObjectLimit('400K', UNLIMITED)   //Power Infusion
            call f.registerObjectLimit('R045', UNLIMITED)   //Summoner Adept Training
            call f.registerObjectLimit('Rnsi', UNLIMITED)   //Abolish Magic           
            call f.registerObjectLimit('R00K', UNLIMITED)   //Power Infusion                  
    endfunction
    
endlibrary
