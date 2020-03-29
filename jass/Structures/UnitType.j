
library UnitType initializer OnInit requires Environment

  globals
    Table UnitTypes
  endglobals

  struct UnitType
    readonly integer unitId = 0
    readonly boolean refund = false      //When the player leaves this unit gets deleted, cost refunded, and given to allies
    readonly boolean meta = false        //When the player leaves this unit is exempted from being affected
    readonly string iconPath = null

    method operator GoldCost takes nothing returns integer
      return GetUnitGoldCost(unitId)
    endmethod

    method operator LumberCost takes nothing returns integer
      return GetUnitWoodCost(unitId)
    endmethod
    
    method operator Meta takes nothing returns boolean
      return meta
    endmethod

    method operator Meta= takes boolean b returns nothing
      set meta = b
    endmethod
    
    method operator Refund= takes boolean b returns nothing
      set refund = b        
    endmethod

    method operator Refund takes nothing returns boolean
      return refund
    endmethod        

    static method create takes integer unitId returns UnitType
      local UnitType this = UnitType.allocate()
      set this.unitId = unitId
      set UnitTypes[unitId] = this
      return this                
    endmethod     
  endstruct

  function GetUnitTypeIconPath takes integer unitType returns string
    local UnitType tempUnitType = UnitTypes[unitType]
    if tempUnitType != 0 then
      return tempUnitType.iconPath
    else
      return null
    endif
  endfunction   

  function GetUnitIconPath takes unit whichUnit returns string
    return GetUnitTypeIconPath(GetUnitTypeId(whichUnit))
  endfunction

  private function OnInit takes nothing returns nothing
    set UnitTypes = Table.create()
  endfunction

endlibrary