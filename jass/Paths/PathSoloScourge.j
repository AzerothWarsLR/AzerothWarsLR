
library PathSoloScourge initializer OnInit requires ScourgeConfig, LegendScourge, Display

  globals
    private constant integer RESEARCH_ID = 'R01D'
  endglobals

  private function Research takes nothing returns nothing
    if GetResearched() == RESEARCH_ID then
      call LEGEND_NERZHUL.Spawn(FACTION_SCOURGE.Person.p, -3328, 20390, 370)
      call UnitDetermineLevel(LEGEND_NERZHUL.Unit, 1.00)
      call FACTION_SCOURGE.modWeight(3)
      call DisplaySoloPath(FACTION_SCOURGE, "Ner'zhul has stepped forth from his prison.")
      //Mod object limits
      call FACTION_SCOURGE.modObjectLimit('ubsp', 2) //Destroyer
  endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary