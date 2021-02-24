library SacrificeAcolyte initializer OnInit

  globals
    private constant integer ACOLYTE_ID = 'uaco'
  endglobals

  private function OnSell takes nothing returns nothing
    if GetUnitTypeId(GetTriggerUnit()) == ACOLYTE_ID then
      call KillUnit(GetTriggerUnit())
      call BlzSetUnitFacingEx(GetSoldUnit(), GetUnitFacing(GetTriggerUnit()))
      if GetLocalPlayer() == GetOwningPlayer(GetSoldUnit()) then
        call SelectUnit(GetSoldUnit(), true)
      endif
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_SELL )
    call TriggerAddAction( trig, function OnSell)
  endfunction

endlibrary