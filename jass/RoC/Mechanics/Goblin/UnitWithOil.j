library UnitWithOil requires AIDS

  globals
    private constant integer OIL_TYPE = 'o04R'
    private constant integer HARVESTER_TYPE = 'o04S'
    private constant integer CONTAINER_TYPE = 'o03V'
  endglobals

  struct UnitWithOil extends array
    //! runtextmacro AIDS()
    private integer oilCount
    private boolean exists

    public method operator Exists takes nothing returns boolean
      return this.exists
    endmethod

    public method operator OilCount= takes integer value returns nothing
      set this.oilCount = value
    endmethod

    public method operator OilCount takes nothing returns integer
      return this.oilCount
    endmethod

    public method Transfer takes UnitWithOil receiver, integer amount returns nothing
      set this.OilCount = this.OilCount - amount
      set receiver.OilCount = receiver.OilCount + amount
    endmethod

    private method AIDS_onDestroy takes nothing returns nothing
      set this.exists = false
    endmethod

    private method AIDS_onCreate takes nothing returns nothing
      set this.exists = true
      //Initialize oil count for oil deposits.
      //This should be seperated out into a setup library.
      if GetUnitTypeId(this.unit) == OIL_TYPE then
        set this.oilCount = 20000
      else
        set this.oilCount = 0
      endif
    endmethod

    private static method AIDS_filter takes unit u returns boolean
      if GetUnitTypeId(u) == OIL_TYPE or GetUnitTypeId(u) == HARVESTER_TYPE or GetUnitTypeId(u) == CONTAINER_TYPE then
        return true
      endif
      return false
    endmethod

  endstruct

endlibrary