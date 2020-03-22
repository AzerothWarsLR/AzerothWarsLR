library GeneralHelpers

  globals
    private constant real HERO_DROP_DIST = 50.     //The radius in which heroes spread out items when they drop them
    private force DestForce = null
  endglobals
  
  function GetRectRandomY takes rect whichRect returns real
    return GetRandomReal(GetRectMinY(whichRect), GetRectMaxY(whichRect))
  endfunction

  function GetRectRandomX takes rect whichRect returns real
    return GetRandomReal(GetRectMinX(whichRect), GetRectMaxX(whichRect))
  endfunction

  private function ForceAddForceEnum takes nothing returns nothing
    call ForceAddPlayer(DestForce, GetEnumPlayer())
  endfunction

  function ForceAddForce takes force sourceForce, force destForce returns nothing
    set DestForce = destForce
    call ForForce(sourceForce, function ForceAddForceEnum)
  endfunction

  function UnitRescue takes unit whichUnit, player whichPlayer returns nothing
    if GetLocalPlayer() == whichPlayer then
      call StartSound(bj_rescueSound)
    endif
    call ShowUnit(whichUnit, true)
    call SetUnitInvulnerable(whichUnit, false)
    call SetUnitOwner(whichUnit, whichPlayer, true)
    call UnitAddIndicator(whichUnit, 0, 255, 0, 255)
    call PingMinimapForPlayer(whichPlayer, GetUnitX(whichUnit), GetUnitY(whichUnit), bj_RESCUE_PING_TIME)
  endfunction

  function UnitDropAllItems takes unit u returns nothing
    local integer i = 0
    local item dropItem = null
    local real unitX = GetUnitX(u)
    local real unitY = GetUnitY(u)
    local real x = 0
    local real y = 0
    local real ang = 0  //Radians
    loop
    exitwhen i > 6
      set x = unitX + HERO_DROP_DIST * Cos(ang)
      set y = unitY + HERO_DROP_DIST * Sin(ang)
      set ang = ang + (360*bj_DEGTORAD)/6
      set dropItem = UnitItemInSlot(u, i)
      if BlzGetItemBooleanField(dropItem, ITEM_BF_DROPPED_WHEN_CARRIER_DIES) or BlzGetItemBooleanField(dropItem, ITEM_BF_CAN_BE_DROPPED) then                
        call UnitRemoveItem(u, dropItem)
        call SetItemPosition(dropItem, x, y)
      endif
      set i = i + 1
    endloop
  endfunction

  function UnitTransferItems takes unit sender, unit receiver returns nothing
    local integer i = 0
    loop
    exitwhen i > 6
      call UnitAddItem(receiver, UnitItemInSlot(sender, i))
      set i = i + 1
    endloop
  endfunction
    
endlibrary