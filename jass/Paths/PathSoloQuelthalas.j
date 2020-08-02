library PathSoloQuelthalas initializer OnInit requires QuelthalasConfig, Display, LegendQuelthalas

  globals
    private constant integer RESEARCH_ID = 'R04U'
  endglobals

  private function Research takes nothing returns nothing
    local player tempPlayer
    if GetResearched() == RESEARCH_ID then
      set tempPlayer = FACTION_QUELTHALAS.Person.p
      call DisplaySoloPath(FACTION_QUELTHALAS, "As the enemies close in, the use of Fel Magic grows within the kingdom and the use of shadier talents come forth. The Elven Mage Krasus reveals himself as Korialstrasz of the Red Dragonflight. To repay the shame of their involvement in the first invasion, he and his brethren have come to Quel’thalas’ aid.")
      call LEGEND_KORIALSTRASZ.Spawn(tempPlayer, GetRectCenterX(gg_rct_Sunwell), GetRectCenterY(gg_rct_Sunwell), 0)
      call UnitDetermineLevel(LEGEND_KORIALSTRASZ.Unit, 1.2)
      call FACTION_QUELTHALAS.modWeight(3)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary