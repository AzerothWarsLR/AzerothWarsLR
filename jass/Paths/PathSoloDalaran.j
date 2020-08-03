library PathSoloDalaran initializer OnInit requires DalaranConfig, Display, LegendDalaran

  globals
    private constant integer RESEARCH_ID = 'R01J'
  endglobals

  private function Research takes nothing returns nothing
    local player tempPlayer
    if GetResearched() == RESEARCH_ID then
      set tempPlayer = FACTION_DALARAN.Person.p
      call DisplaySoloPath(FACTION_DALARAN, "The nation of Dalaran, now alone, resorts to militarising the Kul'tirans into a proper standing army.")
      call LEGEND_MEDIVH.Spawn(tempPlayer, GetRectCenterX(gg_rct_Dalaran_Dungeons_Entrance), GetRectCenterY(gg_rct_Dalaran_Dungeons_Entrance), 331.92)
      call UnitDetermineLevel(LEGEND_MEDIVH.Unit, 1.2)
      call FACTION_DALARAN.modWeight(3)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary