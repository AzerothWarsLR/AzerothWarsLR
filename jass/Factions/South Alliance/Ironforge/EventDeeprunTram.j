library EventDeeprunTram initializer OnInit requires Persons, Faction

  private function Cast takes nothing returns nothing
    local unit ironforgeTram = null
    local unit stormwindTram = null
    local Person stormwindPerson = 0
    local Person ironforgePerson = 0
    if GetSpellAbilityId() == 'A0VH' then
      set stormwindPerson = PersonsByFaction[FACTION_STORMWIND]
      set ironforgePerson = PersonsByFaction[FACTION_IRONFORGE]
      set ironforgeTram = gg_unit_n03B_0010
      set stormwindTram = gg_unit_n03B_0037

      call DisplayTextToForce(GetPlayersAll(), "The Dwarves of Ironforge have completed the Deeprun Tram; the people of Stormwind and Ironforge can freely travel between their cities.")

      //Set Ironforge tram
      if ironforgePerson != 0 then
        call SetUnitOwner(ironforgeTram, ironforgePerson.getPlayer(), true)
        call WaygateActivateBJ(true, ironforgeTram)
        call WaygateSetDestination(ironforgeTram, GetRectCenterX(gg_rct_Stormwind), GetRectCenterY(gg_rct_Stormwind))
        call SetUnitInvulnerable(ironforgeTram, false)
      endif

      //Set Stormwnd tram
      if stormwindPerson != 0 or ironforgePerson != 0 then
        if stormwindPerson != 0 then
          call SetUnitOwner(stormwindTram, stormwindPerson.getPlayer(), true)
        else
          call SetUnitOwner(stormwindTram, ironforgePerson.getPlayer(), true)
        endif
        call WaygateActivateBJ(true, stormwindTram)
        call WaygateSetDestination(stormwindTram, GetRectCenterX(gg_rct_Ironforge), GetRectCenterY(gg_rct_Ironforge))
        call SetUnitInvulnerable(stormwindTram, false)
      endif            

      call UnitRemoveAbility(GetTriggerUnit(), GetSpellAbilityId())
      call DestroyTrigger(GetTriggeringTrigger())
    endif        
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( trig, Condition(function Cast))
  endfunction    

endlibrary