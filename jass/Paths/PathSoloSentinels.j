library PathSoloSentinels initializer OnInit requires SentinelsConfig, LegendSentinels, Display

  globals
    private constant integer RESEARCH_ID = 'R04O'
  endglobals

  private function Research takes nothing returns nothing
    local player sentinelsPlayer
    if GetResearched() == RESEARCH_ID then
      set sentinelsPlayer = FACTION_SENTINELS.Person.p
      call DisplaySoloPath(FACTION_SENTINELS, "Without the guidance of the Druids, the Sentinels decide to unleash the full extent of their fury against their enemies.")
      call LEGEND_JALIN.Spawn(sentinelsPlayer, GetRectCenterX(gg_rct_AstanaarCap), GetRectCenterY(gg_rct_AstanaarCap), 270)
      call FACTION_SENTINELS.modObjectLimit('e00T', UNLIMITED)   //Sentinel Rise
      call FACTION_SENTINELS.modObjectLimit('n06E', 6)           //Shadowleaf Sentinel
      call FACTION_SENTINELS.modObjectLimit('n08H', UNLIMITED)   //Panther
      call FACTION_SENTINELS.modObjectLimit('h045', 6)           //Wardens
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary