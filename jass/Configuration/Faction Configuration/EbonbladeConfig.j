library EbonbladeConfig initializer OnInit requires Faction

  globals
    Faction FACTION_EBONBLADE
  endglobals

    private function OnInit takes nothing returns nothing
        local Faction f
        
        set FACTION_EBONBLADE = Faction.create("Ebon Blade", PLAYER_COLOR_BROWN, "|c004E2A04","ReplaceableTextures\\CommandButtons\\BTNHeroDeathKnight.blp")
        set f = FACTION_EBONBLADE

            call f.registerObjectLimit('unpl', UNLIMITED)   //Necropolis   
            call f.registerObjectLimit('unp1', UNLIMITED)   //Halls of the Dead 
            call f.registerObjectLimit('unp2', UNLIMITED)   //Black Citadel 
            call f.registerObjectLimit('uzig', UNLIMITED)   //Ziggurat 
            call f.registerObjectLimit('uzg1', UNLIMITED)   //Spirit Tower 
            call f.registerObjectLimit('uzg2', UNLIMITED)   //Nerubian Tower 
            call f.registerObjectLimit('uaod', UNLIMITED)   //Altar of Darkness 
            call f.registerObjectLimit('usep', UNLIMITED)   //Crypt 
            call f.registerObjectLimit('ugrv', UNLIMITED)   //Graveyard 
            call f.registerObjectLimit('utod', UNLIMITED)   //Temple of the Damned      
            call f.registerObjectLimit('utom', UNLIMITED)   //Tomb of Relics   
            call f.registerObjectLimit('ushp', UNLIMITED)   //Undead Shipyard
            call f.registerObjectLimit('u002', UNLIMITED)   //Improved Spirit Tower
            call f.registerObjectLimit('u003', UNLIMITED)   //Improved Nerubian Tower
            call f.registerObjectLimit('n099', UNLIMITED)   //Ebon Blade Chapter Building
            
            call f.registerObjectLimit('uaco', UNLIMITED)   //Acolyte
            call f.registerObjectLimit('ushd', UNLIMITED)   //Shade
            call f.registerObjectLimit('ugho', UNLIMITED)   //Ghoul
            call f.registerObjectLimit('ugar', 8)           //Gargoyle
            call f.registerObjectLimit('uban', UNLIMITED)   //Banshee
            call f.registerObjectLimit('unec', -UNLIMITED)   //Necromancer
            call f.registerObjectLimit('nska', UNLIMITED)   //Skeleton Archer
            call f.registerObjectLimit('h00H', 9)           //Death Knight
            call f.registerObjectLimit('ubot', UNLIMITED)   //Undead Transport Ship
            call f.registerObjectLimit('udes', UNLIMITED)   //Undead Frigate
            call f.registerObjectLimit('uubs', 12)   //Undead Battleship
            call f.registerObjectLimit('h044', UNLIMITED)   //Knight of the Ebon Blade
            call f.registerObjectLimit('h036', 4)   //Gryphon Death Knight
            call f.registerObjectLimit('h04A', UNLIMITED)   //Ebon Priest
            call f.registerObjectLimit('h02Q', 6)   //Sky Knight
            call f.registerObjectLimit('n07O', UNLIMITED)   //Ebon Blade Raider
            
            call f.registerObjectLimit('Ruba', UNLIMITED)   //Banshee Adept Training
            call f.registerObjectLimit('Rugf', UNLIMITED)   //Ghoul Frenzy
            call f.registerObjectLimit('R008', UNLIMITED)   //Death Infusion
            call f.registerObjectLimit('R00O', UNLIMITED)   //Ensnare
            
    endfunction
    
endlibrary