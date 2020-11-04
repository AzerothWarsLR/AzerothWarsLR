library PathDuoLordaeron initializer OnInit requires LordaeronConfig, LegendLordaeron, Display

  globals
    private constant integer RESEARCH_ID = 'R03Z'
    private constant integer CHAOS_SILVER = 'R01G'
  endglobals

  private function Research takes nothing returns nothing
    local player tempPlayer
    if GetResearched() == RESEARCH_ID then
      set tempPlayer = FACTION_LORDAERON.Player
      call LEGEND_MOGRAINE.Spawn(tempPlayer, 12186, 10967, 322)
      call UnitDetermineLevel(LEGEND_MOGRAINE.Unit, 1.00)
      call FACTION_LORDAERON.modWeight(1)
      call LEGEND_UTHER.ClearUnitDependencies()
      call DisplaySoloPath(FACTION_LORDAERON, "The Silver Hand was granted the power of the Lordaeron military.") 
      call FACTION_LORDAERON.modObjectLimit('h063', UNLIMITED)       //Knight of the Silver Hand
      call FACTION_LORDAERON.modObjectLimit('R04C', UNLIMITED)       //Silver Hand Initiate Training
      call FACTION_LORDAERON.modObjectLimit('h06E', 12)      	       //Silver Hand Cleric
      call FACTION_LORDAERON.modObjectLimit('h06D', UNLIMITED+6)     //Silver Hand Veteran Paladin
      call FACTION_LORDAERON.modObjectLimit('hkni', -UNLIMITED)      //Knight
      call FACTION_LORDAERON.modObjectLimit('h00F', -UNLIMITED)      //Lordaeron Paladin 
      call FACTION_LORDAERON.SetObjectLevel(CHAOS_SILVER, 1)
      call DisableTrigger( gg_trg_Lordaeron_East )
      call DisableTrigger( gg_trg_Lordaeron_West )
      call EnableTrigger( gg_trg_Lordaeron_West_post_tier)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
    call FACTION_LORDAERON.modObjectLimit(RESEARCH_ID, UNLIMITED)
    call FACTION_LORDAERON.modObjectLimit(CHAOS_SILVER, UNLIMITED)
  endfunction

endlibrary