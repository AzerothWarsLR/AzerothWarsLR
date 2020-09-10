library PathDuoQuelthalas initializer OnInit requires QuelthalasConfig, LegendQuelthalas, Display

  globals
    private constant integer RESEARCH_ID = 'R046'
  endglobals

  private function Research takes nothing returns nothing
    if GetResearched() == RESEARCH_ID then
      call DisplaySoloPath(FACTION_QUELTHALAS, "With Quel'Thalas' back to the wall, they emplore all means of the Kingdom to defend against invasion.")
      call LEGEND_ROMMATH.Spawn(FACTION_QUELTHALAS.Player, GetRectCenterX(gg_rct_Sunwell), GetRectCenterY(gg_rct_Sunwell), 270)
      call UnitDetermineLevel(LEGEND_ROMMATH.Unit, 1.00)
      call FACTION_QUELTHALAS.modObjectLimit('hhes', -UNLIMITED)      //Elven Warrior
      call FACTION_QUELTHALAS.modObjectLimit('nbel', UNLIMITED)       //Blood Elf Warrior     
      call FACTION_QUELTHALAS.modWeight(1)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary