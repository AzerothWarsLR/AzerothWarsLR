library PathSoloFrostwolf initializer OnInit requires FrostwolfConfig

  globals
    private constant integer RESEARCH_ID = 'R02N'
  endglobals

  private function Research takes nothing returns nothing
    local player frostwolfPlayer
    if GetResearched() == RESEARCH_ID then
      set frostwolfPlayer = FACTION_FROSTWOLF.Person.p
      call DisplayTextToPlayer(frostwolfPlayer, 0, 0, "Thrall has reformed the Horde of Kalimdor, and has united the various races into a uniform force.")
      call LEGEND_GAZLOWE.Spawn(frostwolfPlayer, GetRectCenterX(gg_rct_Orgrimmar), GetRectCenterY(gg_rct_Orgrimmar), 0)
      call LEGEND_REXXAR.Spawn(frostwolfPlayer, GetRectCenterX(gg_rct_Orgrimmar), GetRectCenterY(gg_rct_Orgrimmar), 0)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary