library EventDeeprunTram initializer OnInit requires Persons, Faction

  private function Transfer takes nothing returns nothing
    local unit ironforgeTram = gg_unit_n03B_0010
    local unit stormwindTram = gg_unit_n03B_0037
    local Person recipient

    set recipient = FACTION_IRONFORGE.Person
    if recipient == 0 then
      set recipient = FACTION_STORMWIND.Person
    endif
    if recipient == 0 then
      call KillUnit(gg_unit_n03B_0010)
      call KillUnit(gg_unit_n03B_0037)
      return
    endif

    call SetUnitOwner(ironforgeTram, recipient.Player, true)
    call WaygateActivateBJ(true, ironforgeTram)
    call WaygateSetDestination(ironforgeTram, GetRectCenterX(gg_rct_Stormwind), GetRectCenterY(gg_rct_Stormwind))
    call SetUnitInvulnerable(ironforgeTram, false)

    call SetUnitOwner(stormwindTram, recipient.Player, true)
    call WaygateActivateBJ(true, stormwindTram)
    call WaygateSetDestination(stormwindTram, GetRectCenterX(gg_rct_Ironforge), GetRectCenterY(gg_rct_Ironforge))
    call SetUnitInvulnerable(stormwindTram, false)         

    call UnitRemoveAbility(GetTriggerUnit(), GetSpellAbilityId())
  endfunction

  private function Cast takes nothing returns nothing
    if GetSpellAbilityId() == 'A0VH' then
      call Transfer()
    endif        
  endfunction

  private function OnPersonFactionChanged takes nothing returns nothing
    if GetChangingPersonPrevFaction() == FACTION_IRONFORGE then
      call Transfer()
    endif 
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( trig, Condition(function Cast))

    set trig = CreateTrigger()
    call OnPersonFactionChange.register(trig)
    call TriggerAddAction(trig, function OnPersonFactionChanged)
  endfunction
  
endlibrary