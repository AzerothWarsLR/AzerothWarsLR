library DummyCast requires DummyCaster

  function DummyCastUnit takes player whichPlayer, integer abilId, string orderId, integer level, unit u returns nothing
    call SetUnitOwner(DUMMY, whichPlayer, false)
    call SetUnitX(DUMMY, GetUnitX(u))
    call SetUnitY(DUMMY, GetUnitY(u))
    call UnitAddAbility(DUMMY, abilId)
    call SetUnitAbilityLevel(DUMMY, abilId, level)
    call IssueTargetOrder(DUMMY, orderId, u)
    call UnitRemoveAbility(DUMMY,abilId)        
  endfunction
  
  function DummyCastPoint takes player whichPlayer, integer abilId, string orderId, integer level, real x, real y returns nothing
    call SetUnitOwner(DUMMY, whichPlayer, false)
    call SetUnitX(DUMMY, x)
    call SetUnitY(DUMMY, y)
    call UnitAddAbility(DUMMY, abilId)
    call SetUnitAbilityLevel(DUMMY, abilId, level)
    call IssuePointOrder(DUMMY, orderId, x, y)
    call UnitRemoveAbility(DUMMY,abilId)            
  endfunction
  
  function DummyCastInstant takes player whichPlayer, integer abilId, string orderId, integer level, real x, real y returns nothing
    call SetUnitOwner(DUMMY, whichPlayer, false)
    call SetUnitX(DUMMY, x)
    call SetUnitY(DUMMY, y)
    call UnitAddAbility(DUMMY, abilId)
    call SetUnitAbilityLevel(DUMMY, abilId, level)
    call IssueImmediateOrder(DUMMY, orderId)
    call UnitRemoveAbility(DUMMY,abilId)            
  endfunction

endlibrary
