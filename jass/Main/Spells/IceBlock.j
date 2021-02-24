library IceBlock initializer OnInit requires DummyCast, Filters, Table

  globals
    private constant integer ABIL_ID = 'A001'
    private constant integer SUMMON_ID = 'h000'
    private constant real DURATION = 2.
    private constant real RADIUS = 150.
    private constant string EFFECT = "Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl"
  endglobals

  private struct Frozen
    private static Table byHandle
    private unit victim

    static method ByHandle takes integer whichHandle returns thistype
      return thistype.byHandle[whichHandle]
    endmethod

    method destroy takes nothing returns nothing
      call BlzPauseUnitEx(this.victim, false)
      call SetUnitTimeScale(this.victim, 1.)
      set thistype.byHandle[GetHandleId(this.victim)] = 0
      call this.deallocate()
    endmethod

    static method create takes unit victim returns thistype
      local thistype this = thistype.allocate()
      set this.victim = victim
      call BlzPauseUnitEx(this.victim, true)
      call SetUnitTimeScale(this.victim, 0.)
      set thistype.byHandle[GetHandleId(this.victim)] = this
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      set thistype.byHandle = Table.create()
    endmethod
  endstruct

  private struct IceBlock
    private static Table byHandle

    private unit unit = null
    private unit caster = null
    private group victims = null
    private real x = 0
    private real y = 0

    private method unfreezeVictims takes nothing returns nothing
      local unit u = null
      loop
        set u = FirstOfGroup(this.victims)
        exitwhen u == null
        call Frozen.ByHandle(GetHandleId(u)).destroy()
      endloop
    endmethod

    method destroy takes nothing returns nothing
      set thistype.byHandle[GetHandleId(this.unit)] = 0
      call DestroyEffect(AddSpecialEffect(EFFECT, x, y))
      call RemoveUnit(this.unit)
      set this.unit = null
      set this.caster = null
      call this.unfreezeVictims()
      call DestroyGroup(this.victims)
      set this.victims = null
      call this.deallocate()
    endmethod

    private method freezeVictims takes nothing returns nothing
      local group tempGroup = CreateGroup()
      local unit u = null
      set this.victims = CreateGroup()

      call GroupEnumUnitsInRange(tempGroup, x, y, RADIUS, null)
      loop
        set u = FirstOfGroup(tempGroup)
        exitwhen u == null
        if not IsUnitAlly(u, GetOwningPlayer(this.caster)) and IsUnitAlive(u) and not BlzIsUnitInvulnerable(u) and not IsUnitType(u, UNIT_TYPE_STRUCTURE) and not IsUnitType(u, UNIT_TYPE_ANCIENT) and not IsUnitType(u, UNIT_TYPE_RESISTANT) then
          call Frozen.create(u)
          call GroupAddUnit(this.victims, u)
        endif
        call GroupRemoveUnit(tempGroup, u)
      endloop
      call GroupClear(tempGroup)
    endmethod

    static method create takes unit caster, real x, real y returns thistype
      local thistype this = thistype.allocate()
      set this.unit = CreateUnit(GetOwningPlayer(caster), SUMMON_ID, x, y, 0)
      set this.caster = caster
      set this.x = x
      set this.y = y
      call UnitApplyTimedLife(this.unit, 0, DURATION)
      call UnitAddType(this.unit, UNIT_TYPE_SUMMONED)
      call SetUnitAnimation(this.unit, "birth")
      call QueueUnitAnimation(this.unit, "stand")
      call DestroyEffect(AddSpecialEffect(EFFECT, x, y))
      set thistype.byHandle[GetHandleId(this.unit)] = this
      call this.freezeVictims()
      return this
    endmethod

    private static method OnAnyUnitDies takes nothing returns nothing
      if thistype.byHandle[GetHandleId(GetTriggerUnit())] != 0 then
        call thistype(thistype.byHandle[GetHandleId(GetTriggerUnit())]).destroy()
      endif
    endmethod

    private static method onInit takes nothing returns nothing
      local trigger trig = CreateTrigger()
      set thistype.byHandle = Table.create()
      call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_DEATH )
      call TriggerAddCondition(trig, Condition(function thistype.OnAnyUnitDies))
    endmethod

  endstruct

  private function Cast takes nothing returns nothing
    local unit summonedUnit
    if GetSpellAbilityId() == ABIL_ID then
      call IceBlock.create(GetTriggerUnit(), GetSpellTargetX(), GetSpellTargetY())
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( trig, Condition(function Cast))
  endfunction 
    
endlibrary
