library PathSoloSentinels initializer OnInit requires Persons, Faction, LegendSentinels

  private function ApplyPath takes nothing returns nothing
    local player triggerPlayer = GetTriggerPlayer()
    local Person triggerPerson = Persons[GetPlayerId(triggerPlayer)]
    call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Without the guidance of the Druids, the Sentinels decide to unleash the full extent of their fury against their enemies.")        

    call LEGEND_JALIN.Spawn(triggerPlayer, GetRectCenterX(gg_rct_AstanaarCap), GetRectCenterY(gg_rct_AstanaarCap), 270)
    call triggerPerson.setFaction(FACTION_SOLO_SENTINELS)
  endfunction

  private function Research takes nothing returns nothing
    if GetResearched() == 'R04O' then
      call ApplyPath()
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition( trig, Condition(function Research) )   
  endfunction

endlibrary