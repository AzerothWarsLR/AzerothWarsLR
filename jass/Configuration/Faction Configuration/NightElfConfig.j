
library NightElfConfig initializer OnInit requires Faction

  globals
    Faction FACTION_NIGHT_ELVES
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_NIGHT_ELVES = Faction.create("Night Elves", PLAYER_COLOR_BLUE, "|c000000FF","ReplaceableTextures\\CommandButtons\\BTNKeeperOfTheGrove.blp", 4)
    set f = FACTION_NIGHT_ELVES

    call f.registerObjectLimit('etol', UNLIMITED)   //Tree of Life  
    call f.registerObjectLimit('etoa', UNLIMITED)   //Tree of Ages
    call f.registerObjectLimit('etoe', UNLIMITED)   //Tree of Eternity  
    call f.registerObjectLimit('emow', UNLIMITED)   //Moon Well
    call f.registerObjectLimit('eate', UNLIMITED)   //Altar of Elders
    call f.registerObjectLimit('eaoe', UNLIMITED)   //Ancient of Lore
    call f.registerObjectLimit('eaom', UNLIMITED)   //Ancient of War
    call f.registerObjectLimit('eaow', UNLIMITED)   //Ancient of Wind
    call f.registerObjectLimit('etrp', UNLIMITED)   //Ancient Protector
    call f.registerObjectLimit('edob', UNLIMITED)   //Hunter's Hall
    call f.registerObjectLimit('e019', UNLIMITED)   //Ancient of Wonders  
    call f.registerObjectLimit('eshy', UNLIMITED)   //Night Elf Shipyard 
    call f.registerObjectLimit('e000', UNLIMITED)   //Improved Ancient Protector 

    call f.registerObjectLimit('ewsp', UNLIMITED)   //Wisp 
    call f.registerObjectLimit('edry', 24)  	      //Dryad
    call f.registerObjectLimit('echm', 4)           //Chimaera
    call f.registerObjectLimit('edot', UNLIMITED)   //Druid of the Talon 
    call f.registerObjectLimit('emtg', 12)          //Mountain Giant
    call f.registerObjectLimit('efdr', 6)           //Faerie Dragon 
    call f.registerObjectLimit('e016', UNLIMITED)   //Druid of the Growth 
    call f.registerObjectLimit('edcm', UNLIMITED)   //Druid of the Claw
    call f.registerObjectLimit('earc', UNLIMITED)   //Archer
    call f.registerObjectLimit('esen', UNLIMITED)   //Huntress
    call f.registerObjectLimit('ebal', 8)           //Glaive Thrower
    call f.registerObjectLimit('ehpr', 6)           //Hippogryph Rider 
    call f.registerObjectLimit('e00N', 6)           //Keeper of the Grove
    call f.registerObjectLimit('etrs', UNLIMITED)   //Night Elf Transport Ship
    call f.registerObjectLimit('edes', UNLIMITED)   //Night Elf Frigate
    call f.registerObjectLimit('ebsh', 24)          //Night Elf Battleship
    call f.registerObjectLimit('e00X', 3)  	        //Elemental Guardian
    call f.registerObjectLimit('e012', 6)           //Siege Ancient

    call f.registerObjectLimit('e015', 1)           //Broll

    call f.registerObjectLimit('Redt', UNLIMITED)   //Druid of the Talon Adept Training
    call f.registerObjectLimit('Renb', UNLIMITED)   //Nature's Blessing
    call f.registerObjectLimit('Rers', UNLIMITED)   //Resistant Skin
    call f.registerObjectLimit('Reuv', UNLIMITED)   //Ultravision
    call f.registerObjectLimit('R026', UNLIMITED)   //Elune's Power Infusion
    call f.registerObjectLimit('R02G', UNLIMITED)   //Druid of the Growth Adept Training
    call f.registerObjectLimit('R04E', UNLIMITED)   //Ysera's Gift
    call f.registerObjectLimit('Reib', UNLIMITED)   //Improved Bows
    call f.registerObjectLimit('Resc', UNLIMITED)   //Sentinel
    call f.registerObjectLimit('Remg', UNLIMITED)   //Upgraded Moon Glaive
    call f.registerObjectLimit('Roen', UNLIMITED)   //Ensnare

    call f.registerObjectLimit('R00V', UNLIMITED)   //Balance Mastery 
    call f.registerObjectLimit('R04H', UNLIMITED)   //Night Elves United
    call f.registerObjectLimit('R04P', UNLIMITED)   //Sentinel Buff
    call f.registerObjectLimit('R04O', UNLIMITED)   //Nature Buff
  endfunction
endlibrary
