
library UnitType initializer OnInit

  globals
    Table UnitTypes
  endglobals

  struct UnitType
    readonly integer unitId = 0
    readonly boolean refund = false      //When the player leaves this unit gets deleted, cost refunded, and given to allies
    readonly boolean meta = false        //When the player leaves this unit is exempted from being affected
    readonly integer goldCost = 0
    readonly integer lumberCost = 0
    readonly string iconPath = null

    method setIconPath takes string s returns nothing
      set this.iconPath = s
    endmethod

    method setGoldCost takes integer val returns nothing
      set this.goldCost = val
    endmethod
    
    method setLumberCost takes integer val returns nothing
      set this.lumberCost = val        
    endmethod
    
    method setMeta takes boolean b returns nothing
      set this.meta = b
    endmethod
    
    method setRefund takes boolean b returns nothing
      set this.refund = b        
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