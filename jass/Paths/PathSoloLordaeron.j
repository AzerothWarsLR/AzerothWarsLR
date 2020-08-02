library PathSoloLordaeron initializer OnInit requires LordaeronConfig, Display

  globals
    private constant integer RESEARCH_ID = 'R040'
    private constant integer CHAOS_SCARLET = 'R01F'
  endglobals

  private function Research takes nothing returns nothing
    local player tempPlayer
    if GetResearched() == RESEARCH_ID then
      set tempPlayer = FACTION_LORDAERON.Person.p
      call DisplaySoloPath(FACTION_LORDAERON, "The Scarlet Crusade was granted the power of the Lordaeron military.")
      call FACTION_LORDAERON.modObjectLimit('h06C', UNLIMITED)       //Halls of Glory 
      call FACTION_LORDAERON.modObjectLimit('h066', UNLIMITED)       //Scarlet Zealot
      call FACTION_LORDAERON.modObjectLimit('h065', UNLIMITED)       //Scarlet Crusader Knight
      call FACTION_LORDAERON.modObjectLimit('h06A', 12)      	       //Inquisitor
      call FACTION_LORDAERON.modObjectLimit('h02Q', 6)      	       //Pegasus
      call FACTION_LORDAERON.modObjectLimit('h06B', UNLIMITED+6)     //Grand Crusader
      call FACTION_LORDAERON.modObjectLimit('R04F', UNLIMITED)       //Scarlet Mage Initiate Training
      call FACTION_LORDAERON.modObjectLimit('hkni', -UNLIMITED)      //Knight
      call FACTION_LORDAERON.modObjectLimit('h063', -UNLIMITED)      //Knight of the Silver Hand
      call FACTION_LORDAERON.modObjectLimit('h00F', -UNLIMITED)      //Lordaeron Paladin
      call FACTION_LORDAERON.modObjectLimit('h06D', -UNLIMITED)      //Silver Hand Veteran Paladin
      call FACTION_LORDAERON.modObjectLimit('hcth', -UNLIMITED)      //Silver Hand Squire
      call SetPlayerTechResearched(tempPlayer, CHAOS_SCARLET, 1)
      call FACTION_LORDAERON.modWeight(3)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
    call FACTION_LORDAERON.modObjectLimit(RESEARCH_ID, UNLIMITED)
    call FACTION_LORDAERON.modObjectLimit(CHAOS_SCARLET, UNLIMITED)
  endfunction

endlibrary