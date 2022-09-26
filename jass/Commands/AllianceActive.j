library AllianceActive initializer OnInit requires Team, ControlPointVictory

 private function Actions takes nothing returns nothing
   local integer victoryCpCount 
   
   if AreAllianceActive == true then
      call SetCpsVictory(120)
   endif
 endfunction

	private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( trig, 80.00 )
    call TriggerAddAction( trig, function Actions )
 endfunction

endlibrary