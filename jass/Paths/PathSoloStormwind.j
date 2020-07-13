library PathSoloStormwind initializer OnInit requires StormwindConfig, Display

  globals
    private constant integer RESEARCH_ID = 'R05O'
  endglobals

  private function Research takes nothing returns nothing
    local player tempPlayer
    if GetResearched() == RESEARCH_ID then
      set tempPlayer = FACTION_STORMWIND.Person.p
      call FACTION_STORMWIND.modWeight(3)
      call LEGEND_MEDIVH.Spawn(tempPlayer, GetRectCenterX(gg_rct_Cathedral_of_Light), GetRectCenterY(gg_rct_Cathedral_of_Light), 0)
      call UnitDetermineLevel(LEGEND_MEDIVH.Unit, 1.00)
      call DisplaySoloPath(FACTION_STORMWIND, "Now isolated, the men of the South find a new inner courage and fight their enemies with all their might. Medivh returns and joins mankind in their struggles.")
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary