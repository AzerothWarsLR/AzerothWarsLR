//Units spawned at Demon Gates spawn at the Focal Demon Gate instead, if one exists.
library FocalDemonGate requires AIDS

  globals
    private constant integer GATE_UNITTYPE = 'n0AP'
    private constant real FACING_OFFSET = -45. //Demon gate model is spun around weirdly so this reverses that for code
    private constant real SPAWN_DISTANCE = 300. //How far away from the gate to spawn units
  endglobals

  struct FocalDemonGate extends array
    //! runtextmacro AIDS()
    private static thistype instance = 0
    private boolean constructed

    method operator RallyX takes nothing returns real
      local location rally = GetUnitRallyPoint(this.unit)
      local real x = GetLocationX(rally)
      call RemoveLocation(rally)
      set rally = null
      return x
    endmethod

    method operator RallyY takes nothing returns real
      local location rally = GetUnitRallyPoint(this.unit)
      local real y = GetLocationY(rally)
      call RemoveLocation(rally)
      set rally = null
      return y
    endmethod

    method operator SpawnX takes nothing returns real
      return GetPolarOffsetX(GetUnitX(this.unit), SPAWN_DISTANCE, GetUnitFacing(this.unit) + FACING_OFFSET)
    endmethod

    method operator SpawnY takes nothing returns real
      return GetPolarOffsetY(GetUnitY(this.unit), SPAWN_DISTANCE, GetUnitFacing(this.unit) + FACING_OFFSET)
    endmethod

    method operator Alive takes nothing returns boolean
      return UnitAlive(this.unit)
    endmethod

    static method operator Instance takes nothing returns thistype
      return thistype.instance
    endmethod

    private method operator Constructed= takes boolean value returns nothing
      set this.constructed = value
      call KillUnit(thistype.instance.unit)
      set thistype.instance = this
    endmethod

    private static method AIDS_filter takes unit u returns boolean
      if GetUnitTypeId(u) == GATE_UNITTYPE then
        return true
      endif
      return false
    endmethod

    private method AIDS_onCreate takes nothing returns nothing
      set this.constructed = false
      call IssuePointOrder(this.unit, "setrally", this.SpawnX, this.SpawnY)
    endmethod

    private method AIDS_onDestroy takes nothing returns nothing
      if thistype.instance == this then
        set thistype.instance = 0
      endif
    endmethod

    private static method OnAnyUnitConstruct takes nothing returns nothing
      if GetUnitTypeId(GetTriggerUnit()) == GATE_UNITTYPE then
        set FocalDemonGate(GetUnitId(GetTriggerUnit())).Constructed = true
      endif
    endmethod

    private static method AIDS_onInit takes nothing returns nothing
      local trigger trig = CreateTrigger()
      call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
      call TriggerAddAction(trig, function thistype.OnAnyUnitConstruct)
    endmethod
  endstruct

endlibrary