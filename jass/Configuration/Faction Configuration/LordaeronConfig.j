

library LordaeronConfig initializer OnInit requires Faction

  globals
    Faction FACTION_LORDAERON
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_LORDAERON = Faction.create("Lordaeron", PLAYER_COLOR_LIGHT_BLUE, "|c007ebff1","ReplaceableTextures\\CommandButtons\\BTNArthas.blp")
    set f = FACTION_LORDAERON

      //Structures
      call f.registerObjectLimit('htow', UNLIMITED)   //Town Hall
      call f.registerObjectLimit('hkee', UNLIMITED)   //Keep
      call f.registerObjectLimit('hcas', UNLIMITED)   //Castle
      call f.registerObjectLimit('hhou', UNLIMITED)   //Farm
      call f.registerObjectLimit('halt', UNLIMITED)   //Altar of Kings
      call f.registerObjectLimit('hbar', UNLIMITED)   //Barracks
      call f.registerObjectLimit('hlum', UNLIMITED)   //Lumber Mill
      call f.registerObjectLimit('hbla', UNLIMITED)   //Blacksmith
      call f.registerObjectLimit('h035', UNLIMITED)   //Chapel
      call f.registerObjectLimit('hwtw', UNLIMITED)   //Scout Tower
      call f.registerObjectLimit('hgtw', UNLIMITED)   //Guard Tower
      call f.registerObjectLimit('h006', UNLIMITED)   //Guard Tower (Improved)
      call f.registerObjectLimit('hctw', UNLIMITED)   //Cannon Tower
      call f.registerObjectLimit('h007', UNLIMITED)   //Cannon Tower (Improved)
      call f.registerObjectLimit('hshy', UNLIMITED)   //Alliance Shipyard
      call f.registerObjectLimit('nmrk', UNLIMITED)   //Marketplace
      
      call f.registerObjectLimit('h06B', -UNLIMITED)  //Grand Crusader
      call f.registerObjectLimit('h06D', -UNLIMITED)  //Silver Hand Veteran Paladin                

      //Units
      call f.registerObjectLimit('hpea', UNLIMITED)   //Peasant
      call f.registerObjectLimit('hbot', UNLIMITED)   //Alliance Transport Ship
      call f.registerObjectLimit('hdes', UNLIMITED)   //Alliance Frigate
      call f.registerObjectLimit('hbsh', 12)          //Alliance Battle Ship
      call f.registerObjectLimit('hfoo', UNLIMITED)   //Footman
      call f.registerObjectLimit('hkni', UNLIMITED)   //Knight
      call f.registerObjectLimit('nchp', UNLIMITED)   //Cleric
      call f.registerObjectLimit('h00F', 6)           //Lordaeron Paladin 
      call f.registerObjectLimit('h01C', UNLIMITED)   //Longbowman
      call f.registerObjectLimit('n03K', UNLIMITED)   //Chaplain
      call f.registerObjectLimit('hcth', UNLIMITED)   //Silver Hand Squire

      //Upgrades
      call f.registerObjectLimit('R02E', UNLIMITED)   //Chaplain Adept Training
      call f.registerObjectLimit('R00I', UNLIMITED)   //Light's Praise Initiate Training
      call f.registerObjectLimit('R00K', UNLIMITED)   //Power Infusion
      call f.registerObjectLimit('R01P', UNLIMITED)   //Second Chance
      call f.registerObjectLimit('Rhan', UNLIMITED)   //Animal War Training
      call f.registerObjectLimit('Rhlh', UNLIMITED)   //Improved Lumber Harvesting
      call f.registerObjectLimit('Rhac', UNLIMITED)   //Improved Masonry
      call f.registerObjectLimit('R04D', UNLIMITED)   //Exorcism
      call f.registerObjectLimit('Roen', UNLIMITED)   //Ensnare

      //Masteries
      call f.registerObjectLimit('R01B', UNLIMITED)   //Dwarven Refugees
      call f.registerObjectLimit('R01Q', UNLIMITED)   //Empowerment Mastery
      call f.registerObjectLimit('R00B', UNLIMITED)   //Soldier Mastery
      
      //Paths
      call f.registerObjectLimit('R040', UNLIMITED)   //Order of the Scarlet Crusade
      call f.registerObjectLimit('R03Z', UNLIMITED)   //Order of the Silver Hand

      //ChaosUpgrades
      call f.registerObjectLimit('R01F', UNLIMITED)   //Scarlet Crusade
      call f.registerObjectLimit('R01G', UNLIMITED)   //Silver Hand
  endfunction
    
endlibrary

