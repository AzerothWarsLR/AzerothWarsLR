library UnitConsumesOil requires AIDS, T32, Environment, UnitWithOil, UnitConsumesOilType, OilSetup

  globals
    private constant integer UNIT_TYPE = 'n062'
    private constant integer TICK_RATE = 1
  endglobals

  private struct UnitWithFuel extends array
    //! runtextmacro AIDS()
    private real tick
    private UnitConsumesOilType type

    private method OilCount takes nothing returns real
      return UnitWithOil.CentralReservoir.OilCount
    endmethod

    private static method AIDS_filter takes unit u returns boolean
      local integer i = 0
      local integer unitTypeId = GetUnitTypeId(u)
      
      loop
        exitwhen i == UnitConsumesOilType.Count
        //call BJDebugMsg(I2S(UnitConsumesOilType.ByIndex(i).UnitTypeId))
        if unitTypeId == UnitConsumesOilType.ByIndex(i).UnitTypeId then
          return true
        endif
        set i = i + 1
      endloop
      return false
    endmethod

    private method AIDS_onCreate takes nothing returns nothing
      set tick = 0
      set this.type = UnitConsumesOilType.ByUnitTypeId(GetUnitTypeId(this.unit))
      call this.startPeriodic()
    endmethod

    private method AIDS_onDestroy takes nothing returns nothing
      set this.tick = 0
      set this.type = 0
      call this.stopPeriodic()
    endmethod

    private method unfreeze takes nothing returns nothing
      call PauseUnit(this.unit, false)
      call SetUnitTimeScalePercent( this.unit, 100.00 )
    endmethod

    private method freeze takes nothing returns nothing
      call PauseUnit(this.unit, true)
      call SetUnitTimeScalePercent( this.unit, 0.00 )
    endmethod

    private method periodic takes nothing returns nothing
      set tick = tick + 1
      if tick == TICK_RATE * T32_FPS then
        set UnitWithOil.CentralReservoir.OilCount = UnitWithOil.CentralReservoir.OilCount - this.type.OilConsumptionRate
        if not IsUnitPaused(this.unit) and UnitWithOil.CentralReservoir.OilCount < 1 then   
          call this.freeze()
        elseif IsUnitPaused(this.unit) and UnitWithOil.CentralReservoir.OilCount > 1 or not UnitAlive(this.unit) then  
          call this.unfreeze()
        endif
        set tick = 0
      endif
    endmethod

    implement T32x
  endstruct

endlibrary