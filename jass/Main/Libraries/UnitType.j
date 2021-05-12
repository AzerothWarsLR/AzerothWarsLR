library UnitType requires Environment

  globals
    //Unit and structure categories that a unit type can be
    integer UNITCATEGORY_TOWNHALL = 1
    integer UNITCATEGORY_KEEP = 2
    integer UNITCATEGORY_CASTLE = 3
    integer UNITCATEGORY_UNITPRODUCTION_A = 4
    integer UNITCATEGORY_UNITPRODUCTION_B = 5
    integer UNITCATEGORY_UNITPRODUCTION_C = 6
    integer UNITCATEGORY_UNITPRODUCTION_D = 7
    integer UNITCATEGORY_SHIPYARD = 8
    integer UNITCATEGORY_FARM = 9
    integer UNITCATEGORY_ALTAR = 10
    integer UNITCATEGORY_SHOP = 11
    integer UNITCATEGORY_BASICTOWER = 12
    integer UNITCATEGORY_UPGRADEDTOWER_A = 13
    integer UNITCATEGORY_UPGRADEDTOWER_B = 14
    integer UNITCATEGORY_BLACKSMITH = 15
    integer UNITCATEGORY_SPECIAL = 16 //Lumber Mill, for instance
    integer UNITCATEGORY_UPGRADEDTOWER2_A = 13 //Tower that's been upgraded twice
    integer UNITCATEGORY_UPGRADEDTOWER2_B = 14 //Tower that's been upgraded twice
  endglobals

  struct UnitType
    private static Table byId
    readonly integer unitId = 0
    readonly boolean refund = false      //When the player leaves this unit gets deleted, cost refunded, and given to allies
    readonly boolean meta = false        //When the player leaves this unit is exempted from being affected
    readonly string iconPath = null
    private integer unitCategory = 0

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

    method operator UnitCategory takes nothing returns integer
      return unitCategory
    endmethod

    method operator UnitCategory= takes integer unitCategory returns nothing
      set this.unitCategory = unitCategory
    endmethod     

    static method ByHandle takes unit whichUnit returns thistype
      return thistype.byId[GetUnitTypeId(whichUnit)]
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