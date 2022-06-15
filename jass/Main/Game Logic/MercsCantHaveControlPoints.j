library MercsCantHaveControlPoints initializer OnInit requires MercFaction, ControlPoint

  private function Capture takes nothing returns nothing
    local Faction triggerFaction = Person.ByHandle(GetTriggerControlPoint().owner).Faction
    local ControlPoint triggerControlPoint = GetTriggerControlPoint()
    if triggerFaction.getType() == MercFaction.typeid or triggerFaction.getType() == MmmrrrggglllMercFaction.typeid or triggerFaction.getType() == SnarlmaneMercFaction.typeid or triggerFaction.getType() == EdwinMercFaction.typeid then
      call SetUnitOwner(triggerControlPoint.u, MercFaction(triggerFaction).Liege.Player, true)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call OnControlPointOwnerChange.register(trig)
    call TriggerAddAction(trig, function Capture)
  endfunction

endlibrary 