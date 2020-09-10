library VassalsCantHaveControlPoints initializer OnInit requires VassalFaction, ControlPoint

  private function Capture takes nothing returns nothing
    local Faction triggerFaction = Person.ByHandle(GetTriggerControlPoint().owner).Faction
    local ControlPoint triggerControlPoint = GetTriggerControlPoint()
    if triggerFaction.getType() == VassalFaction.typeid then
      call SetUnitOwner(triggerControlPoint.u, VassalFaction(triggerFaction).Liege.Player, true)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call OnControlPointOwnerChange.register(trig)
    call TriggerAddAction(trig, function Capture)
  endfunction

endlibrary