
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
    call f.registerObjectLimit('h03L', UNLIMITED)   //Myrmidon
    call f.registerObjectLimit('nnsw', UNLIMITED)   //Naga Siren
    call f.registerObjectLimit('nsnp', UNLIMITED)   //Snap Dragon
    call f.registerObjectLimit('nnsu', UNLIMITED)   //Summoner
    call f.registerObjectLimit('nwgs', 6)           //Couatl
    call f.registerObjectLimit('nnrg', 6)           //Naga Royal Guard
    call f.registerObjectLimit('nhyc', 8)           //Dragon Turtle
    call f.registerObjectLimit('nhea', UNLIMITED)   //Archer            
    call f.registerObjectLimit('hbot', UNLIMITED)   //Alliance Transport Ship
    call f.registerObjectLimit('hdes', UNLIMITED)   //Alliance Frigate
    call f.registerObjectLimit('hbsh', 12)          //Alliance Battle Ship 
    call f.registerObjectLimit('hmpr', UNLIMITED)   //Priest
    call f.registerObjectLimit('hspt', 12)          //Spell Breaker 
    call f.registerObjectLimit('ndrs', 6)           //Draenei Seer
    call f.registerObjectLimit('ndrn', UNLIMITED)   //Draenei Vindicator
    call f.registerObjectLimit('ndsa', 2)           //Salamander                                 

    //Structures
    call f.registerObjectLimit('hshy', UNLIMITED)   //Alliance Shipyard
    call f.registerObjectLimit('h01D', UNLIMITED)   //Forge
    call f.registerObjectLimit('h027', UNLIMITED)   //Arcane Sanctum
    call f.registerObjectLimit('h03O', UNLIMITED)   //Ancient Vault
    call f.registerObjectLimit('n05Q', UNLIMITED)   //Altar of the Betrayers
    call f.registerObjectLimit('n07S', UNLIMITED)   //Arcane Well
    call f.registerObjectLimit('n07R', UNLIMITED)   //Temple of the Drowned
    call f.registerObjectLimit('n07V', UNLIMITED)   //Draenei Barracks
    call f.registerObjectLimit('n055', UNLIMITED)   //Illidari Spawning Grounds
    call f.registerObjectLimit('no7W', UNLIMITED)   //Tidal Watcher
    call f.registerObjectLimit('no7X', UNLIMITED)   //Improved Tidal Watcher


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
  endfunction
    
endlibrary
