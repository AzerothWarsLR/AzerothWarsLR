//When Capital Palace, Stratholme and Tyr's Hand Citadel all die, Arthas is removed and EventArthasExpedition begins.

library EventArthasAbandons initializer OnInit requires LordaeronConfig, EventArthasExpedition

  private function Abandon takes nothing returns nothing
    local unit arthas = gg_unit_Hart_1342
    local Person tempPerson = PersonsByFaction[FACTION_LORDAERON]
    call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, tempPerson.faction.prefixCol + "Arthas|r has set sail to Northrend to find Frostmourne.")            
    call KillUnit(arthas)
    call RemoveUnit(arthas)

    //Cleanup
    set arthas = null
  endfunction

  private function Dies takes nothing returns nothing
    local Person lordaeron = PersonsByFaction[FACTION_LORDAERON]
    if not IsUnitAliveBJ(gg_unit_h000_0406) and not IsUnitAliveBJ(gg_unit_h01G_0885) and not IsUnitAliveBJ(gg_unit_h030_0839) then
      if lordaeron != 0 then
        call Abandon()
      endif
      call DoArthasExpedition()
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    call TriggerRegisterUnitEvent( trig, gg_unit_h000_0406, EVENT_UNIT_DEATH )  //Capital Palace
    call TriggerRegisterUnitEvent( trig, gg_unit_h01G_0885, EVENT_UNIT_DEATH )  //Stratholme
    call TriggerRegisterUnitEvent( trig, gg_unit_h030_0839, EVENT_UNIT_DEATH )  //Tyr's Hand Citadel
    call TriggerAddCondition( trig, Condition(function Dies) )
  endfunction

endlibrary