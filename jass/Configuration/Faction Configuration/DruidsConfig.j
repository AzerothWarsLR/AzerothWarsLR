
library DruidsConfig initializer OnInit requires Faction

  globals
    Faction FACTION_DRUIDS
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_DRUIDS = Faction.create("Druids", PLAYER_COLOR_NAVY, "|CFF000080","ReplaceableTextures\\CommandButtons\\BTNFurion.blp", 3)
    set f = FACTION_DRUIDS
  
    call f.setAbsenceResearch('R05T')      
    call f.registerObjectLimit('etol', UNLIMITED)   //Tree of Life  
    call f.registerObjectLimit('etoa', UNLIMITED)   //Tree of Ages
    call f.registerObjectLimit('etoe', UNLIMITED)   //Tree of Eternity  
    call f.registerObjectLimit('emow', UNLIMITED)   //Moon Well
    call f.registerObjectLimit('eate', UNLIMITED)   //Altar of Elders
    call f.registerObjectLimit('eaoe', UNLIMITED)   //Ancient of Lore
    call f.registerObjectLimit('eaow', UNLIMITED)   //Ancient of Wind
    call f.registerObjectLimit('etrp', UNLIMITED)   //Ancient Protector
    call f.registerObjectLimit('edob', UNLIMITED)   //Hunter's Hall
    call f.registerObjectLimit('e019', UNLIMITED)   //Ancient of Wonders  
    call f.registerObjectLimit('eshy', UNLIMITED)   //Night Elf Shipyard 
    call f.registerObjectLimit('e000', UNLIMITED)   //Improved Ancient Protector 

    call f.registerObjectLimit('ewsp', UNLIMITED)   //Wisp 
    call f.registerObjectLimit('edry', UNLIMITED)   //Dryad
    call f.registerObjectLimit('echm', 4)           //Chimaera
    call f.registerObjectLimit('edot', UNLIMITED)   //Druid of the Talon 
    call f.registerObjectLimit('emtg', 12)          //Mountain Giant
    call f.registerObjectLimit('efdr', 6)           //Faerie Dragon 
    call f.registerObjectLimit('e016', UNLIMITED)   //Druid of the Growth 
    call f.registerObjectLimit('edcm', UNLIMITED)   //Druid of the Claw
    call f.registerObjectLimit('e00N', 6)           //Keeper of the Grove
    call f.registerObjectLimit('n05H', UNLIMITED)   //Furbolg
    call f.registerObjectLimit('etrs', UNLIMITED)   //Night Elf Transport Ship
    call f.registerObjectLimit('edes', UNLIMITED)   //Night Elf Frigate
    call f.registerObjectLimit('ebsh', 12)          //Night Elf Battleship
    call f.registerObjectLimit('e00X', 3)  	      //Elemental Guardian
    call f.registerObjectLimit('e012', 6)           //Siege Ancient

    call f.registerObjectLimit('e015', 1)           //Broll

    call f.registerObjectLimit('Redt', UNLIMITED)   //Druid of the Talon Adept Training
    call f.registerObjectLimit('Renb', UNLIMITED)   //Nature's Blessing
    call f.registerObjectLimit('Rers', UNLIMITED)   //Resistant Skin
    call f.registerObjectLimit('Reuv', UNLIMITED)   //Ultravision
    call f.registerObjectLimit('Rews', UNLIMITED)   //Well Spring
    call f.registerObjectLimit('R026', UNLIMITED)   //Elune's Power Infusion
    call f.registerObjectLimit('R02G', UNLIMITED)   //Druid of the Growth Adept Training
    call f.registerObjectLimit('R00A', UNLIMITED)   //Wild Instincts
    call f.registerObjectLimit('R04E', UNLIMITED)   //Ysera's Gift
    call f.registerObjectLimit('R05X', UNLIMITED)   //Blessing of Ursoc

    call f.registerObjectLimit('R019', UNLIMITED)   //Feral Mastery 
    call f.registerObjectLimit('R018', UNLIMITED)   //Bonding Mastery
    call f.registerObjectLimit('R00V', UNLIMITED)   //Balance Mastery 
    
    call f.registerObjectLimit('R04H', UNLIMITED)   //Night Elves United
  endfunction
    
endlibrary