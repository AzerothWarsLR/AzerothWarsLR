
library UnitType requires Environment

  struct UnitType
    private static Table byId
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

    static method ByHandle takes unit whichUnit returns thistype
      return thistype.byId[GetHandleId(whichUnit)]
    endmethod

    static method ById takes integer id returns thistype
      return thistype.byId[id]
    endmethod

    static method create takes integer unitId returns UnitType
      local UnitType this = UnitType.allocate()
      set this.unitId = unitId
      set thistype.byId[unitId] = this
      return this                
    endmethod     

    private static method onInit takes nothing returns nothing
      set thistype.byId = Table.create()
    endmethod
  endstruct 

endlibrary