library Plagueling initializer OnInit

  globals
    private constant integer PLAGUELING_ID = 'n08G'
    private constant real DURATION = 15.
  endglobals

  private function OnSell takes nothing returns nothing
    if GetUnitTypeId(GetSoldUnit()) == PLAGUELING_ID then
      call UnitApplyTimedLife(GetSoldUnit(), 0, DURATION)
      call SetUnitExploded(GetSoldUnit(), true)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_SELL )
    call TriggerAddAction( trig, function OnSell)
  endfunction

endlibrary