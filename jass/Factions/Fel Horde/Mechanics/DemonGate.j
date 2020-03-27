library DemonGate requires T32, Math, Environment

  globals
    private constant real TICK_RATE = 1.
    private constant real FACING_OFFSET = -45. //Demon gate model is spun around weirdly so this reverses that for code
    private constant real SPAWN_DISTANCE = 300. //How far away from the gate to spawn units
  endglobals

  struct DemonGateType
    readonly static Table byUnitType

    private integer spawnUnitType
    private integer interval
    private integer unitType

    public method operator Interval takes nothing returns integer
      return interval
    endmethod

    public method operator SpawnUnitType takes nothing returns integer
      return spawnUnitType
    endmethod

    static method create takes integer gateUnitType, integer spawnUnitType, integer interval returns thistype
      local thistype this = thistype.allocate()
      set this.unitType = gateUnitType
      set this.interval = interval
      set this.spawnUnitType = spawnUnitType
      set byUnitType[unitType] = this
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      set byUnitType = Table.create()
    endmethod
  endstruct

  struct DemonGate
    private static Table byHandle

    private unit u
    private boolean enabled
    private integer tick
    private group spawnedDemons
    private DemonGateType gateType

    private method destroy takes nothing returns nothing
      set byHandle[GetHandleId(u)] = 0
      set u = null
      call DestroyGroup(spawnedDemons)
      call stopPeriodic()
    endmethod

    private method operator MaxMana= takes integer i returns nothing
      call BlzSetUnitMaxMana(u, i)
    endmethod

    private method operator MaxMana takes nothing returns integer
      return BlzGetUnitMaxMana(u)
    endmethod

    private method operator Mana takes nothing returns real
      return GetUnitState(u, UNIT_STATE_MANA)
    endmethod

    private method operator Mana= takes real r returns nothing
      call SetUnitState(u, UNIT_STATE_MANA, r)
    endmethod

    private method operator Owner takes nothing returns player
      return GetOwningPlayer(u)
    endmethod

    private method operator SpawnX takes nothing returns real
      return GetPolarOffsetX(X, SPAWN_DISTANCE, Facing)
    endmethod

    private method operator SpawnY takes nothing returns real
      return GetPolarOffsetY(Y, SPAWN_DISTANCE, Facing)
    endmethod

    private method operator X takes nothing returns real
      return GetUnitX(u)
    endmethod

    private method operator Y takes nothing returns real
      return GetUnitY(u)
    endmethod

    private method operator Facing takes nothing returns real
      return GetUnitFacing(u) + FACING_OFFSET
    endmethod

    private method operator GateType= takes DemonGateType gateType returns nothing
      if gateType == 0 then
        call BJDebugMsg("ERROR: invalid DemonGateType supplied to DemonGate " + I2S(this))
        return
      endif
      set MaxMana = gateType.Interval
      set this.gateType = gateType
    endmethod

    private method spawnUnit takes nothing returns nothing
      local unit newUnit = CreateUnit(Owner, gateType.SpawnUnitType, SpawnX, SpawnY, Facing)
      local location rally = GetUnitRallyPoint(u)
      call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Demon\\DarkPortal\\DarkPortalTarget.mdl", SpawnX, SpawnY))
      call IssuePointOrder(newUnit, "attackground", GetLocationX(rally), GetLocationY(rally))
      call RemoveLocation(rally)
      call GroupAddUnit(spawnedDemons, newUnit)
    endmethod

    private method onUpgrade takes nothing returns nothing
      set GateType = DemonGateType.byUnitType[GetUnitTypeId(GetTriggerUnit())]
    endmethod

    private method periodic takes nothing returns nothing
      set tick = tick + 1
      if tick == TICK_RATE * T32_FPS then
        set Mana = Mana + 1*TICK_RATE
        if Mana == MaxMana then
          set Mana = 0
          if GetPlayerState(Owner, PLAYER_STATE_RESOURCE_FOOD_USED) < GetPlayerState(Owner, PLAYER_STATE_RESOURCE_FOOD_CAP) then
            call spawnUnit()
          endif
        endif
        if not UnitAlive(u) or GetOwningPlayer(u) == Player(bj_PLAYER_NEUTRAL_VICTIM) then
          call destroy()
        endif 
        set tick = 0
      endif
    endmethod

    implement T32x

    static method create takes unit u returns thistype
      local thistype this = thistype.allocate()
      set this.u = u
      set this.tick = 0
      set this.enabled = true
      set spawnedDemons = CreateGroup()
      set byHandle[GetHandleId(u)] = this
      set this.GateType = DemonGateType.byUnitType[GetUnitTypeId(u)]
      call IssuePointOrder(u, "setrally", this.SpawnX, this.SpawnY)
      call startPeriodic()
      return this
    endmethod

    private static method onUnitUpgraded takes nothing returns nothing
      if byHandle[GetHandleId(GetTriggerUnit())] != 0 then
        call thistype(byHandle[GetHandleId(GetTriggerUnit())]).onUpgrade()
      endif
    endmethod

    private static method onInit takes nothing returns nothing
      local trigger trig = CreateTrigger()
      call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
      call TriggerAddAction(trig, function thistype.onUnitUpgraded)

      set byHandle = Table.create()
    endmethod

  endstruct

endlibrary