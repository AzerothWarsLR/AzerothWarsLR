library EventKelthuzadDeath initializer OnInit requires LegendScourge

  //When Kel'thuzad (Necromancer) is permanently killed
  //Record his experience, and create Kel'thuzad (Ghost) as a replacement
  //This experience is given to Kel'thuzad (Lich) in QuestKelthuzadLich

  globals
    integer KelthuzadExp = 0
    private constant integer NECROMANCER_ID = 'U001'
    private constant integer GHOST_ID = 'uktg'
  endglobals

  private function Dies takes nothing returns nothing
    if LEGEND_KELTHUZAD == GetTriggerLegend() and GetUnitTypeId(GetTriggerLegend().Unit) == NECROMANCER_ID then
      call SetUnitState(LEGEND_KELTHUZAD.Unit, UNIT_STATE_LIFE, GetUnitState(LEGEND_KELTHUZAD.Unit, UNIT_STATE_MAX_LIFE))
      set LEGEND_KELTHUZAD.UnitType = GHOST_ID
      call DestroyTrigger(GetTriggeringTrigger())         
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call OnLegendPermaDeath.register(trig)
    call TriggerAddCondition(trig, Condition(function Dies))            
  endfunction

endlibrary