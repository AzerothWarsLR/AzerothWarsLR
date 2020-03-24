//A Legend is a wrapper for unique heroes. A Legend can continue to exist even if the unit it describes does not. 
//A Legend might have other units it relies on to survive. If so, when it dies, it gets removed if those units are not under control.
//There is a dummy ability to represent this.

library Legend requires GeneralHelpers

  globals
    private constant integer DUMMY_PASSIVE = 'LEgn'
  endglobals

  struct Legend
    private static Table ByHandle

    private unit unit
    private integer unitType
    private string deathMessage
    private string deathSfx
    private group diesWithout //This hero permanently dies if it dies without these under control]
    private trigger deathTrig

    public method operator DeathSfx= takes string s returns nothing
      set deathSfx = s
    endmethod

    public method operator DeathMessage= takes string s returns nothing
      set deathMessage = s
    endmethod

    public method operator Unit= takes unit u returns nothing
      set thistype.ByHandle[GetHandleId(unit)] = 0
      set unit = u
      set unitType = GetUnitTypeId(unit)
      call DestroyTrigger(deathTrig)
      set deathTrig = CreateTrigger()
      call TriggerRegisterUnitEvent(deathTrig, unit, EVENT_UNIT_DEATH)
      call TriggerAddAction(deathTrig, function thistype.onUnitDeath)
      set thistype.ByHandle[GetHandleId(unit)] = this
    endmethod

    public method operator Unit takes nothing returns unit
      return unit
    endmethod

    public method AddUnitDependency takes unit u returns nothing
      call GroupAddUnit(diesWithout, u)
      call refreshDummy()
    endmethod

    public method operator UnitType= takes integer i returns nothing
      local unit newUnit
      if unit != null then
        set newUnit = CreateUnit(OwningPlayer, i, GetUnitX(unit), GetUnitY(unit), GetUnitFacing(unit))
        call SetUnitState(newUnit, UNIT_STATE_LIFE, GetUnitState(unit, UNIT_STATE_LIFE))
        call SetUnitState(newUnit, UNIT_STATE_MANA, GetUnitState(unit, UNIT_STATE_MANA))
        call SetHeroXP(newUnit, GetHeroXP(unit), false)
        call UnitTransferItems(unit, newUnit)
        call refreshDummy()
        call RemoveUnit(unit)
      endif
      set Unit = newUnit
    endmethod

    public method operator OwningPlayer takes nothing returns player
      return GetOwningPlayer(unit)
    endmethod

    public method Spawn takes player owner, real x, real y, real face returns nothing
      if unit == null then
        set Unit = CreateUnit(owner, unitType, x, y, face)
      endif
    endmethod

    private method refreshDummy takes nothing returns nothing
      local group tempGroup = CreateGroup()
      local unit u
      local string tooltip = "When this unit dies, it will be unrevivable unless any of the following capitals are under your control:\n"
      call BlzGroupAddGroupFast(diesWithout, tempGroup)   
      loop
        set u = FirstOfGroup(tempGroup)
        exitwhen u == null
        set tooltip = tooltip + " - " + GetUnitName(u) + "|n"
        call GroupRemoveUnit(tempGroup, u)
      endloop
      set tooltip = tooltip + "\nUsing this ability pings each of these capitals on the minimap."
      call UnitAddAbility(unit, DUMMY_PASSIVE)
      call BlzSetAbilityStringLevelField(BlzGetUnitAbility(unit, DUMMY_PASSIVE), ABILITY_SLF_TOOLTIP_NORMAL_EXTENDED, 0, tooltip)
      call DestroyGroup(tempGroup)
    endmethod

    private method permaDeath takes nothing returns nothing
      local effect tempEffect = AddSpecialEffect(deathSfx, GetUnitX(unit), GetUnitY(unit))
      call BlzSetSpecialEffectScale(tempEffect, 2.0)
      call DestroyEffect(tempEffect)
      call UnitDropAllItems(unit)
      call RemoveUnit(unit)
      call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, "|cffffcc00PERMANENT DEATH|r\n" + deathMessage)
    endmethod

    private method onDeath takes nothing returns nothing
      local group tempGroup = CreateGroup()
      local boolean anyOwned = false
      local unit u
      call BlzGroupAddGroupFast(diesWithout, tempGroup)

      loop
        set u = FirstOfGroup(tempGroup)
        exitwhen u == null
        if GetOwningPlayer(u) == GetOwningPlayer(unit) and UnitAlive(u) == true then
          set anyOwned = true
        endif
        call GroupRemoveUnit(tempGroup, u)
      endloop

      if anyOwned == false then
        call permaDeath()
      endif

      call DestroyGroup(tempGroup)
      set tempGroup = null
    endmethod

    private static method onUnitDeath takes nothing returns nothing
      call thistype(thistype.ByHandle[GetHandleId(GetTriggerUnit())]).onDeath()
    endmethod

    private method destroy takes nothing returns nothing
      call this.deallocate()
      call UnitDropAllItems(unit)
      call DestroyGroup(diesWithout)
      call RemoveUnit(unit)
      call DestroyGroup(diesWithout)
    endmethod

    private static method onInit takes nothing returns nothing
      set thistype.ByHandle = Table.create()
    endmethod

    static method create takes nothing returns thistype
      local thistype this = thistype.allocate()
      set diesWithout = CreateGroup()
      return this
    endmethod
  endstruct

endlibrary