library IllidariConfig initializer OnInit requires Faction

    globals
        Faction FACTION_ILLIDARI
    endglobals

    private function OnInit takes nothing returns nothing
        local Faction f
        
        set FACTION_ILLIDARI = Faction.create("Illidari", PLAYER_COLOR_TURQUOISE, "|cFF00EAFF","ReplaceableTextures\\CommandButtons\\BTNEvilIllidan.blp", 5)
        set f = FACTION_ILLIDARI

            //Units
            call f.registerObjectLimit('nmpe', UNLIMITED)   //Mur'gul Slave
            call f.registerObjectLimit('nsgb', 2)           //Sea Giant Behemoth
            call f.registerObjectLimit('nahy', 2)           //Ancient Hydra
            call f.registerObjectLimit('h03L', UNLIMITED)   //Myrmidon
            call f.registerObjectLimit('nnsw', UNLIMITED)   //Naga Siren
            call f.registerObjectLimit('nsnp', UNLIMITED)   //Snap Dragon
            call f.registerObjectLimit('nnsu', UNLIMITED)   //Summoner
            call f.registerObjectLimit('nwgs', 6)           //Couatl
            call f.registerObjectLimit('nnrg', 6)           //Naga Royal Guard
            call f.registerObjectLimit('nhyc', 6)           //Dragon Turtle
            
            call f.registerObjectLimit('nbee', UNLIMITED)   //Elven Worker
            call f.registerObjectLimit('hbot', UNLIMITED)   //Alliance Transport Ship
            call f.registerObjectLimit('hdes', UNLIMITED)   //Alliance Frigate
            call f.registerObjectLimit('hbsh', 12)          //Alliance Battle Ship 
            call f.registerObjectLimit('nbel', UNLIMITED)   //Blood Elf Warrior
            call f.registerObjectLimit('hmpr', UNLIMITED)   //Priest
            call f.registerObjectLimit('hsor', UNLIMITED)   //Sorceress
            call f.registerObjectLimit('hdhw', 6)           //Dragonhawk Rider
            call f.registerObjectLimit('nhea', UNLIMITED)   //Archer
            call f.registerObjectLimit('e008', 8)           //Elven Ballista     
            call f.registerObjectLimit('n048', 6)           //Blood Mage
            call f.registerObjectLimit('hspt', 12)          //Spell Breaker                             

            //Structures
            call f.registerObjectLimit('nmrb', UNLIMITED)   //Trading Post    
            call f.registerObjectLimit('h01D', UNLIMITED)   //Mur'gul Lumber Mill   
            call f.registerObjectLimit('n045', UNLIMITED)   //Temple of Azshara   
            call f.registerObjectLimit('n005', UNLIMITED)   //Improved Tidal Guardian   
            call f.registerObjectLimit('n077', UNLIMITED)   //The First Guardian   
            call f.registerObjectLimit('nnad', UNLIMITED)   //Altar of the Depths   
            call f.registerObjectLimit('nnfm', UNLIMITED)   //Coral Bed   
            call f.registerObjectLimit('nnsa', UNLIMITED)   //Shrine of Azshara   
            call f.registerObjectLimit('nnsg', UNLIMITED)   //Spawning Grounds   
            call f.registerObjectLimit('nntt', UNLIMITED)   //Temple of Tides
            call f.registerObjectLimit('nntg', UNLIMITED)   //Tidal Guardian
            
            call f.registerObjectLimit('htow', UNLIMITED)   //Town Hall
            call f.registerObjectLimit('hkee', UNLIMITED)   //Keep
            call f.registerObjectLimit('hcas', UNLIMITED)   //Castle
            call f.registerObjectLimit('halt', UNLIMITED)   //Altar of Kings
            call f.registerObjectLimit('hlum', UNLIMITED)   //Lumber Mill
            call f.registerObjectLimit('hbla', UNLIMITED)   //Blacksmith
            call f.registerObjectLimit('hars', UNLIMITED)   //Arcane Sanctum
            call f.registerObjectLimit('hwtw', UNLIMITED)   //Scout Tower
            call f.registerObjectLimit('hatw', UNLIMITED)   //Arcane Tower
            call f.registerObjectLimit('h008', UNLIMITED)   //Arcane Tower (Improved)
            call f.registerObjectLimit('negt', UNLIMITED)   //High Elven Guard Tower
            call f.registerObjectLimit('n003', UNLIMITED)   //High Elven Guard Tower (Improved)
            call f.registerObjectLimit('h04V', UNLIMITED)   //Arcane Vault (Elven)
            call f.registerObjectLimit('nheb', UNLIMITED)   //High Elven Barracks
            call f.registerObjectLimit('hshy', UNLIMITED)   //Alliance Shipyard
            call f.registerObjectLimit('nefm', UNLIMITED)   //Elven Farm            

            //Upgrades
            call f.registerObjectLimit('400K', UNLIMITED)   //Power Infusion
            call f.registerObjectLimit('R045', UNLIMITED)   //Summoner Adept Training
            call f.registerObjectLimit('Rnsi', UNLIMITED)   //Abolish Magic
            
            call f.registerObjectLimit('R01S', UNLIMITED)   //Aimed Shot
            call f.registerObjectLimit('R00G', UNLIMITED)   //Feint
            call f.registerObjectLimit('R01R', UNLIMITED)   //Improved Bows
            call f.registerObjectLimit('R00K', UNLIMITED)   //Power Infusion
            call f.registerObjectLimit('Rhcd', UNLIMITED)   //Cloud
            call f.registerObjectLimit('Rhde', UNLIMITED)   //Defend
            call f.registerObjectLimit('Rhss', UNLIMITED)   //Control Magic
            call f.registerObjectLimit('Rhlh', UNLIMITED)   //Improved Lumber Harvesting
            call f.registerObjectLimit('Rhac', UNLIMITED)   //Improved Masonry
            call f.registerObjectLimit('Rhse', UNLIMITED)   //Magic Sentry
            call f.registerObjectLimit('Rhpt', UNLIMITED)   //Priest Adept Training
            call f.registerObjectLimit('Rhst', UNLIMITED)   //Sorceress Adept Training            
            
            //Masteries
            call f.registerObjectLimit('R044', UNLIMITED)   //Monster Taming Mastery
            call f.registerObjectLimit('R043', UNLIMITED)   //Naga Mastery
            call f.registerObjectLimit('R00H', UNLIMITED)   //Naga Mastery
            
    endfunction
    
endlibrary
