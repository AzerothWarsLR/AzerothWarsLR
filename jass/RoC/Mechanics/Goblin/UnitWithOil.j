library UnitWithOil requires AIDS

  globals
    private constant integer OIL_TYPE = 'o04R'
    private constant integer HARVESTER_TYPE = 'o04S'
    private constant integer CONTAINER_TYPE = 'o04V'
  endglobals

  struct UnitWithOil extends array
    private static UnitWithOil centralReservoir

    //! runtextmacro AIDS()
    private real oilCount
    private boolean exists
    private UnitWithOil lastHarvestedSource

    public static method operator CentralReservoir takes nothing returns UnitWithOil
      return thistype.centralReservoir
    endmethod

    public static method operator CentralReservoir= takes UnitWithOil value returns nothing
      set thistype.centralReservoir = value
    endmethod

    public method operator LastHarvestedSource takes nothing returns UnitWithOil
      return this.lastHarvestedSource
    endmethod

    public method operator LastHarvestedSource= takes UnitWithOil value returns nothing
      set this.lastHarvestedSource = value
    endmethod

    public method operator Exists takes nothing returns boolean
      return this.exists
    endmethod

    public method operator OilCount= takes real value returns nothing
      set this.oilCount = value
      call SetUnitState(this.unit, UNIT_STATE_MANA, R2I(value))
    endmethod

    public method operator OilCount takes nothing returns real
      return this.oilCount
    endmethod

    //Displays a cute little piece of text above the unit showing some number.
    private method DisplayOilAmount takes integer amount returns nothing
      local texttag oilTextTag = CreateTextTag()
      local string displayText = "+" + I2S(amount) + "|r"   //add the coloring later
      call SetTextTagText(oilTextTag, displayText, 0.024)
      call SetTextTagPosUnit(oilTextTag, this.unit, 0)
      call SetTextTagVelocity(oilTextTag, 64, 90)
      call SetTextTagPermanent(oilTextTag, false)
      call SetTextTagLifespan(oilTextTag, 5)
      call SetTextTagFadepoint(oilTextTag, 4)
    endmethod

    public method Transfer takes UnitWithOil receiver, integer amount returns nothing
      set this.OilCount = this.OilCount - amount
      set receiver.OilCount = receiver.OilCount + amount
      if GetLocalPlayer() == GetOwningPlayer(this.unit) then
        call this.DisplayOilAmount(amount)
      endif
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
      set this.lastHarvestedSource = 0
    endmethod

    private static method AIDS_filter takes unit u returns boolean
      if GetUnitTypeId(u) == OIL_TYPE or GetUnitTypeId(u) == HARVESTER_TYPE or GetUnitTypeId(u) == CONTAINER_TYPE then
        return true
      endif
      return false
    endmethod

  endstruct

endlibrary