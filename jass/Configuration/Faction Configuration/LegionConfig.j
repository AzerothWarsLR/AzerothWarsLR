

library LegionConfig initializer OnInit requires Faction

    globals
      Faction FACTION_LEGION
    endglobals

    private function OnInit takes nothing returns nothing
        local Faction f
        
        set FACTION_LEGION = Faction.create("Legion", PLAYER_COLOR_PEANUT, "|CFFBF8F4F","ReplaceableTextures\\CommandButtons\\BTNKiljaedin.blp")
        set f = FACTION_LEGION

            call f.setPresenceResearch('R04T')
            //Structures
            call f.registerObjectLimit('u00H', UNLIMITED)   //Legion Defensive Pylon
            call f.registerObjectLimit('u00I', UNLIMITED)   //Improved Defensive Pylon
            call f.registerObjectLimit('u00F', UNLIMITED)   //Burning Shrine
            call f.registerObjectLimit('n040', UNLIMITED)   //Armory
            call f.registerObjectLimit('u009', UNLIMITED)   //Undead Shipyard
            call f.registerObjectLimit('u00E', UNLIMITED)   //Generator
            call f.registerObjectLimit('u01M', UNLIMITED)   //Burning Altar
            call f.registerObjectLimit('u017', UNLIMITED)   //Nether Portal
            call f.registerObjectLimit('u015', UNLIMITED)   //Unholy Reliquary
            call f.registerObjectLimit('demo', UNLIMITED)   //Hell Forge
            call f.registerObjectLimit('n04T', UNLIMITED)   //Burning Citadel
            call f.registerObjectLimit('u006', UNLIMITED)   //Void Summoning Spire

            //Units
            call f.registerObjectLimit('u00D', UNLIMITED)   //Legion Herald
            call f.registerObjectLimit('u007', 6)           //Dreadlord
            call f.registerObjectLimit('n04P', UNLIMITED)   //Warlock
            call f.registerObjectLimit('ninc', UNLIMITED)   //Infernal Contraption
            call f.registerObjectLimit('n04K', UNLIMITED)   //Succubus
            call f.registerObjectLimit('nvdw', UNLIMITED)   //Voidwalker
            call f.registerObjectLimit('n04J', UNLIMITED)   //Felstalker
            call f.registerObjectLimit('o01G', 12)          //Orc Cavalry
            call f.registerObjectLimit('o01F', 12)          //Beserker
            call f.registerObjectLimit('ubot', UNLIMITED)   //Undead Transport SHip
            call f.registerObjectLimit('udes', UNLIMITED)   //Undead Frigate
            call f.registerObjectLimit('uubs', 12)          //Undead Battleship     
            call f.registerObjectLimit('u01A', 1)           //Mal'Ganis     

            //Upgrades
            call f.registerObjectLimit('R02C', UNLIMITED)   //Acute Sensors
            call f.registerObjectLimit('R02A', UNLIMITED)   //Chaos Infusion
            call f.registerObjectLimit('R003', UNLIMITED)   //Nether Strands
            call f.registerObjectLimit('R028', UNLIMITED)   //Shadow Priest Adept Training
            call f.registerObjectLimit('R04G', UNLIMITED)   //Sight of Sargeras
            call f.registerObjectLimit('R027', UNLIMITED)   //Warlock Adept Training

            //Masteries
            call f.registerObjectLimit('R020', UNLIMITED)   //Void Mastery
            call f.registerObjectLimit('R01N', UNLIMITED)   //Doom Mastery
            call f.registerObjectLimit('R01M', UNLIMITED)   //Inferno Mastery
            call f.registerObjectLimit('R01Y', UNLIMITED)   //Felsteel Mastery

            //Legion units
            call f.registerObjectLimit('n04O', 6)   //Doomguard
            call f.registerObjectLimit('u00K', 4)   //Dreadnought
            call f.registerObjectLimit('n04L', 6)   //Infernal Juggernaut
            call f.registerObjectLimit('ninf', 12)   //Infernal
            call f.registerObjectLimit('n04H', UNLIMITED)   //Fel Guard
            call f.registerObjectLimit('n04U', 4)   //Dragon
            call f.registerObjectLimit('n070', 6)   //Drake


    endfunction
    
endlibrary