library UnitConsumesOilType requires Table

  struct UnitConsumesOilType
    private static Table byUnitTypeId
    private static Table byIndex
    private static integer count = 0
    private real oilConsumptionRate = 0
    private integer unitTypeId

    //Represents the rate at which units using this type should consume oil.
    public method operator OilConsumptionRate takes nothing returns real
      return this.oilConsumptionRate
    endmethod

    public method operator UnitTypeId takes nothing returns integer
      return this.unitTypeId
    endmethod

    static method create takes integer unitTypeId, real oilConsumptionRate returns thistype
      local thistype this = thistype.allocate()
      set this.oilConsumptionRate = oilConsumptionRate
      set this.unitTypeId = unitTypeId
      set thistype.byUnitTypeId[unitTypeId] = this

      set thistype.byIndex[thistype.count] = this
      set thistype.count = thistype.count + 1

      return this
    endmethod 

    static method Count takes nothing returns integer
      return thistype.count
    endmethod

    static method ByIndex takes integer index returns thistype
      return thistype.byIndex[index]
    endmethod

    //Pass in a unit type to return the UnitConsumesOilType associated with it.
    static method ByUnitTypeId takes integer unitTypeId returns thistype
      return thistype.byUnitTypeId[unitTypeId]
    endmethod

    private static method onInit takes nothing returns nothing
      set thistype.byUnitTypeId = Table.create()
      set thistype.byIndex = Table.create()
    endmethod
  endstruct

endlibrary  