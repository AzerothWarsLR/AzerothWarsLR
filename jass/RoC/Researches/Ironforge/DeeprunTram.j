library DeeprunTram initializer OnInit requires Persons, Faction, IronforgeConfig, StormwindConfig

  globals
    private constant integer RESEARCH_ID = 'R014'
  endglobals

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
  endfunction

  private function ResearchFinish takes nothing returns nothing
    if GetResearched() == RESEARCH_ID then
      call Transfer()
    endif        
  endfunction

  private function ResearchStart takes nothing returns nothing
    local integer i = 0
    if GetResearched() == RESEARCH_ID then
      loop
      exitwhen i > MAX_PLAYERS
        call Person.ById(i).SetObjectLimit(RESEARCH_ID, 0)
        set i = i + 1
      endloop
    endif
  endfunction

  private function ResearchCancel takes nothing returns nothing
    local integer i = 0
    loop
    exitwhen i > MAX_PLAYERS
      call Person.ById(i).SetObjectLimit(RESEARCH_ID, 1)
      set i = i + 1
    endloop
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition( trig, Condition(function ResearchFinish))

    set trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_START )
    call TriggerAddCondition(trig,Condition(function ResearchStart))
    
    set trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_CANCEL )
    call TriggerAddCondition(trig,Condition(function ResearchCancel))
  endfunction
  
endlibrary