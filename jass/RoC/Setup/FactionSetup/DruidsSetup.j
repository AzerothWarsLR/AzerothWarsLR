
library DruidsSetup requires Faction, TeamSetup

  globals
    Faction FACTION_DRUIDS
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_DRUIDS = Faction.create("Druids", PLAYER_COLOR_BROWN, "|c004e2a04","ReplaceableTextures\\CommandButtons\\BTNFurion.blp", 3)
    set f = FACTION_DRUIDS
    set f.VictoryMusic = "NightElfVictory"
    set f.Team = TEAM_NIGHT_ELVES
    set f.PresenceResearch = 'R06E'
    set f.StartingGold = 150
    set f.StartingLumber = 500

    call f.registerObjectLimit('etol', UNLIMITED)   //Tree of Life  
    call f.registerObjectLimit('etoa', UNLIMITED)   //Tree of Ages
    call f.registerObjectLimit('etoe', UNLIMITED)   //Tree of Eternity  
    call f.registerObjectLimit('emow', UNLIMITED)   //Moon Well
    call f.registerObjectLimit('eate', UNLIMITED)   //Altar of Elders
    call f.registerObjectLimit('eaoe', UNLIMITED)   //Ancient of Lore
    call f.registerObjectLimit('eaow', UNLIMITED)   //Ancient of Wind
    call f.registerObjectLimit('eaom', UNLIMITED)   //Ancient of war
    call f.registerObjectLimit('etrp', UNLIMITED)   //Ancient Protector
    call f.registerObjectLimit('e010', UNLIMITED)   //Hunter's Hall
    call f.registerObjectLimit('e019', UNLIMITED)   //Ancient of Wonders  
    call f.registerObjectLimit('eshy', UNLIMITED)   //Night Elf Shipyard 
    call f.registerObjectLimit('e000', UNLIMITED)   //Improved Ancient Protector 

    call f.registerObjectLimit('ewsp', UNLIMITED)   //Wisp 
    call f.registerObjectLimit('edry', UNLIMITED)   //Dryad
    call f.registerObjectLimit('edot', UNLIMITED)   //Druid of the Talon 
    call f.registerObjectLimit('emtg', 12)          //Mountain Giant
    call f.registerObjectLimit('efdr', 6)           //Faerie Dragon 
    call f.registerObjectLimit('edoc', UNLIMITED)   //Druid of the Claw
    call f.registerObjectLimit('edcm', UNLIMITED)   //Druid of the Claw bear form
    call f.registerObjectLimit('e00N', 6)           //Keeper of the Grove
    call f.registerObjectLimit('n05H', UNLIMITED)   //Furbolg
    call f.registerObjectLimit('n065', 6)           //Green Dragon
    call f.registerObjectLimit('etrs', 24)   	    //Night Elf Transport Ship
    call f.registerObjectLimit('edes', 24) 	    //Night Elf Frigate
    call f.registerObjectLimit('ebsh', 12)          //Night Elf Battleship

    call f.registerObjectLimit('e015', 1)           //Broll

    call f.registerObjectLimit('Redt', UNLIMITED)   //Druid of the Talon Adept Training
    call f.registerObjectLimit('Renb', UNLIMITED)   //Nature's Blessing
    call f.registerObjectLimit('Rers', UNLIMITED)   //Resistant Skin
    call f.registerObjectLimit('Reuv', UNLIMITED)   //Ultravision
    call f.registerObjectLimit('Rews', UNLIMITED)   //Well Spring
    call f.registerObjectLimit('R01H', UNLIMITED)   //Malorne's Power Infusion
    call f.registerObjectLimit('Redc', UNLIMITED)   //Druid of the Claw Adept Training
    call f.registerObjectLimit('R04E', UNLIMITED)   //Ysera's Gift
    call f.registerObjectLimit('R02G', UNLIMITED)   //Emerald Flames
    call f.registerObjectLimit('R05X', UNLIMITED)   //Blessing of Ursoc
    call f.registerObjectLimit('R002', UNLIMITED)   //Blackwald Enhancement
    call f.registerObjectLimit('R00A', UNLIMITED)   //Improved Thorns
    call f.registerObjectLimit('R02T', UNLIMITED)   //Improved Moonwells
    call f.registerObjectLimit('R033', UNLIMITED)   //Limber Timber
    call f.registerObjectLimit('R046', UNLIMITED)   //Grasping Vines
    call f.registerObjectLimit('R047', UNLIMITED)   //Crippling Poison
    call f.registerObjectLimit('R048', UNLIMITED)   //Deadly Poison

  endfunction
    
endlibrary