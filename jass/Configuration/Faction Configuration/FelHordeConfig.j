
library FelHordeConfig initializer OnInit requires Faction

  globals
    constant integer FACTION_FEL_HORDE = 2
  endglobals

    private function OnInit takes nothing returns nothing
        local Faction f
        
        set f = Faction.create(FACTION_FEL_HORDE,"Fel Horde", PLAYER_COLOR_GREEN, "|c0020c000","ReplaceableTextures\\CommandButtons\\BTNPitLord.blp")
            call f.setExitTrigger(FelHordeExitTrigger)

            call f.registerObjectLimit('ogre', UNLIMITED)   //Great Hall
            call f.registerObjectLimit('ostr', UNLIMITED)   //Stronghold
            call f.registerObjectLimit('ofrt', UNLIMITED)   //Fortress
            call f.registerObjectLimit('oalt', UNLIMITED)   //Altar of Storms
            call f.registerObjectLimit('obar', UNLIMITED)   //Barracks
            call f.registerObjectLimit('ofor', UNLIMITED)   //War Mill
            call f.registerObjectLimit('osld', UNLIMITED)   //Spirit Lodge
            call f.registerObjectLimit('obea', UNLIMITED)   //Bestiary
            call f.registerObjectLimit('oshy', UNLIMITED)   //Shipyard
            call f.registerObjectLimit('owtw', UNLIMITED)   //Watch Tower
            call f.registerObjectLimit('o002', UNLIMITED)   //Improved Watch Tower
            call f.registerObjectLimit('u00Q', UNLIMITED)   //Hellforge
            call f.registerObjectLimit('nbt1', UNLIMITED)   //Boulder Tower
            call f.registerObjectLimit('nbt2', UNLIMITED)   //Advanced Boulder Tower
            call f.registerObjectLimit('ocbw', UNLIMITED)   //Fel Orc Burrow (Chaos)

            call f.registerObjectLimit('nbdk', 6)           //Black Drake
            call f.registerObjectLimit('odkt', 6)           //Eredar Warlock
            call f.registerObjectLimit('nchw', UNLIMITED)   //Fel Orc Warlock
            call f.registerObjectLimit('nchg', UNLIMITED)   //Fel Orc Grunt
            call f.registerObjectLimit('nchr', UNLIMITED)   //Fel Orc Raider
            call f.registerObjectLimit('ncpn', UNLIMITED)   //Fel Orc Peon
            call f.registerObjectLimit('owar', UNLIMITED)   //Horde Cavarly
            call f.registerObjectLimit('o00H', 6)           //Burning Blademaster
            call f.registerObjectLimit('o01O', 8)           //Demolisher
            call f.registerObjectLimit('u018', 10)          //Fel Wraith
            call f.registerObjectLimit('u00V', UNLIMITED)   //Necrolyte
            call f.registerObjectLimit('n057', 8)           //Nether Dragon Hatchling
            call f.registerObjectLimit('n058', UNLIMITED)   //Troll Axethrowers
            call f.registerObjectLimit('obot', UNLIMITED)   //Transport Ship
            call f.registerObjectLimit('odes', UNLIMITED)   //Orc Frigate
            call f.registerObjectLimit('ojgn', 24)          //Juggernaught

            call f.registerObjectLimit('Robf', UNLIMITED)   //Demonic Flux
            call f.registerObjectLimit('R00O', UNLIMITED)   //Ensnare
            call f.registerObjectLimit('Rorb', UNLIMITED)   //Reinforced Defenses
            call f.registerObjectLimit('Rosp', UNLIMITED)   //Spiked Barricades
            call f.registerObjectLimit('R023', UNLIMITED)   //Spiritual Infusion
            call f.registerObjectLimit('R000', UNLIMITED)   //Skeletal Perserverance
            call f.registerObjectLimit('R024', UNLIMITED)   //Necrolyte adept Training
            call f.registerObjectLimit('R00M', UNLIMITED)   //Warlock Adept Training
            call f.registerObjectLimit('R03I', UNLIMITED)   //Eredar Warlock Adept Training

            call f.registerObjectLimit('R010', UNLIMITED)   //Demonic Mastery
            call f.registerObjectLimit('R011', UNLIMITED)   //Fel Blood Mastery
            call f.registerObjectLimit('R00Y', UNLIMITED)   //Fel Strength Mastery

            call f.registerObjectLimit('R02L', UNLIMITED)   //Shattered Hand Clan
            call f.registerObjectLimit('R03L', UNLIMITED)   //Shadow Council Reformed
            call f.registerObjectLimit('R047', -1)          //Shadowmoon Clan Remnants
            call f.registerObjectLimit('R036', -1)          //Dragonmaw Clan            
            
            
    endfunction
    
endlibrary
