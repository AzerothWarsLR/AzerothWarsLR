library DemonGate requires T32, Set, Math

  globals
    private constant integer MANA_MAXIMUM = 360
    private constant real MANA_REGEN = 1.
    private constant real TICK_RATE = 1.
    private constant real FACING_OFFSET = -45. //Demon gate model is spun around weirdly so this reverses that for code
    private constant real SPAWN_DISTANCE = 300. //How far away from the gate to spawn units
  endglobals

  struct DemonGate
    private static Set greaterDemons
    private static Set lesserDemons
    private unit u
    private boolean enabled
    private integer tick

    private method destroy takes nothing returns nothing
      set u = null
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

    private method spawnUnit takes integer whichUnitId returns nothing
      local unit newUnit = CreateUnit(Owner, whichUnitId, SpawnX, SpawnY, Facing)
      local location rally = GetUnitRallyPoint(u)
      call IssuePointOrder(newUnit, "attackground", GetLocationX(rally), GetLocationY(rally))
      call RemoveLocation(rally)
    endmethod

    private method spawnRandomUnitFromSet takes Set whichSet returns nothing
      call spawnUnit(whichSet[GetRandomInt(0, whichSet.size-1)])
    endmethod

    private method periodic takes nothing returns nothing
      set tick = tick + 1
      if tick == TICK_RATE * T32_FPS then
        set Mana = Mana + MANA_REGEN*TICK_RATE
        if Mana >= 360 then
          set Mana = 0
          call spawnRandomUnitFromSet(greaterDemons)
          call spawnRandomUnitFromSet(lesserDemons)
          call spawnRandomUnitFromSet(lesserDemons)
          call spawnRandomUnitFromSet(lesserDemons)
          call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Demon\\DarkPortal\\DarkPortalTarget.mdl", SpawnX, SpawnY))
        endif
        if not IsUnitAliveBJ(u) then
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
      set this.MaxMana = MANA_MAXIMUM
      set this.enabled = true
      call IssuePointOrder(u, "setrally", this.SpawnX, this.SpawnY)
      call startPeriodic()
      return this
    endmethod

    static method onInit takes nothing returns nothing
      set greaterDemons = Set.create()
      call greaterDemons.add('nbal') //Overlord
      call greaterDemons.add('ninf') //Infernal
      call greaterDemons.add('ndqs') //Queen of Suffering

      set lesserDemons = Set.create()
      call lesserDemons.add('n05B') //Felguard
      call lesserDemons.add('nfgb') //Bloodfiend
    endmethod    

  endstruct

endlibrary