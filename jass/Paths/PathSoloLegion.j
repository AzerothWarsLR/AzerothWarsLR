library PathSoloLegion initializer OnInit requires LegionConfig, LegendLegion, Display

  globals
    private constant integer RESEARCH_ID = 'R05F'
  endglobals

  private function Research takes nothing returns nothing
    local player tempPlayer
    if GetResearched() == RESEARCH_ID then
      set tempPlayer = FACTION_LEGION.Person.p
      call FACTION_LEGION.modObjectLimit('R01X', UNLIMITED) //Plague Engineering Mastery
      call FACTION_LEGION.modWeight(2)
      call DisplaySoloPath(FACTION_LEGION, "With Ner'zhul's failure, the Legion has brought forth Anetheron to instead reign in control of the remnants of the Undead.")
      call LEGEND_ANETHERON.Spawn(tempPlayer, GetRectCenterX(gg_rct_FTSummon), GetRectCenterY(gg_rct_FTSummon), 270)
      call SetPlayerTechResearched(tempPlayer, 'R01X', 1) //Plague Manipulation
      call SetPlayerTechResearched(tempPlayer, 'Ruac', 1) //Cannibalize
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary