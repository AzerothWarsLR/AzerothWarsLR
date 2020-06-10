library LegionConfig initializer OnInit requires Faction

  globals
    Faction FACTION_LEGION
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_LEGION = Faction.create("Legion", PLAYER_COLOR_PEANUT, "|CFFBF8F4F","ReplaceableTextures\\CommandButtons\\BTNKiljaedin.blp", 3)
    set f = FACTION_LEGION

    call f.setPresenceResearch('R04T')
    set f.AbsenceResearch = 'R00U'
    //Structures
    call f.registerObjectLimit('u00H', UNLIMITED)   //Legion Defensive Pylon
    call f.registerObjectLimit('u00I', UNLIMITED)   //Improved Defensive Pylon
    call f.registerObjectLimit('u00F', UNLIMITED)   //Burning Shrine
    call f.registerObjectLimit('n040', UNLIMITED)   //Armory
    call f.registerObjectLimit('u009', UNLIMITED)   //Undead Shipyard
    call f.registerObjectLimit('u00E', UNLIMITED)   //Generator
    call f.registerObjectLimit('u01N', UNLIMITED)   //Burning Altar
    call f.registerObjectLimit('u015', UNLIMITED)   //Unholy Reliquary
    call f.registerObjectLimit('demo', UNLIMITED)   //Hell Forge
    call f.registerObjectLimit('u006', UNLIMITED)   //Void Summoning Spire
    call f.registerObjectLimit('ndmg', UNLIMITED)   //Demon Gate

    //Units
    call f.registerObjectLimit('u00D', UNLIMITED)   //Legion Herald
    call f.registerObjectLimit('u007', 6)           //Dreadlord
    call f.registerObjectLimit('n04P', UNLIMITED)   //Warlock
    call f.registerObjectLimit('ninc', 12)          //Infernal Contraption
    call f.registerObjectLimit('n04K', UNLIMITED)   //Succubus
    call f.registerObjectLimit('n04J', UNLIMITED)   //Felstalker
    call f.registerObjectLimit('o01G', 12)          //Orc Cavalry
    call f.registerObjectLimit('o01F', 12)          //Beserker
    call f.registerObjectLimit('ubot', UNLIMITED)   //Undead Transport SHip
    call f.registerObjectLimit('udes', UNLIMITED)   //Undead Frigate
    call f.registerObjectLimit('uubs', 12)          //Undead Battleship       
    call f.registerObjectLimit('o00B', 1)           //Jubei'thos    
    call f.registerObjectLimit('n070', 6)           //Drake
    call f.registerObjectLimit('n04O', 6)           //Doomguard
    call f.registerObjectLimit('n04L', 6)           //Infernal Juggernaut
    call f.registerObjectLimit('ninf', 12)          //Infernal
    call f.registerObjectLimit('n04H', UNLIMITED)   //Fel Guard
    call f.registerObjectLimit('n04U', 4)           //Dragon
   
    call f.registerObjectLimit('umtw', 6)           //Meat Wagon
    call f.registerObjectLimit('uobs', 2)           //Obsidian Statue
    call f.registerObjectLimit('nfgl', 2)           //Plague Titan
    call f.registerObjectLimit('n04T', 4)           //Sky Barge
    call f.registerObjectLimit('u00K', UNLIMITED)   //Ghouls

    //Upgrades
    call f.registerObjectLimit('R02C', UNLIMITED)   //Acute Sensors
    call f.registerObjectLimit('R02A', UNLIMITED)   //Chaos Infusion
    call f.registerObjectLimit('R028', UNLIMITED)   //Shadow Priest Adept Training
    call f.registerObjectLimit('R027', UNLIMITED)   //Warlock Adept Training

    //Masteries
    call f.registerObjectLimit('R04G', UNLIMITED)   //Nathrezim Elitism Mastery
    call f.registerObjectLimit('R061', UNLIMITED)   //Demonic Power Mastery
    call f.registerObjectLimit('R01Y', UNLIMITED)   //Felsteel Mastery

    call f.registerObjectLimit('R05F', UNLIMITED)   //Legion Solo Path
    call f.registerObjectLimit('R04B', UNLIMITED)   //Summoned legion

  endfunction
    
endlibrary