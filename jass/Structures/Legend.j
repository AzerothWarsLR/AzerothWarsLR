//A Legend is a wrapper for unique heroes. A Legend can continue to exist even if the unit it describes does not. 
//A Legend might have other units it relies on to survive. If so, when it dies, it gets removed if those units are not under control.
//There is a dummy ability to represent this.

library Legend requires GeneralHelpers

  globals
    private constant integer DUMMY_DIESWITHOUT = 'LEgn'
    private constant integer DUMMY_PERMADIES = 'LEgo'
  endglobals

  struct Legend
    private static Table ByHandle

    private unit unit
    private integer unitType
    private string deathMessage
    private string deathSfx
    private boolean permaDies = false
    private boolean hivemind = false  //This hero causes the death of its own faction if it dies
    private group diesWithout //This hero permanently dies if it dies without these under control]
    private trigger deathTrig

    public method operator PermaDies= takes boolean b returns nothing
      set permaDies = b
      call refreshDummy()
    endmethod

    public method operator DeathSfx= takes string s returns nothing
      set deathSfx = s
    endmethod

    public method operator DeathMessage= takes string s returns nothing
      set deathMessage = s
    endmethod

    public method operator Unit= takes unit u returns nothing
      if Unit != null then
        set thistype.ByHandle[GetHandleId(unit)] = 0
        call UnitDropAllItems(unit)
        call RemoveUnit(unit)
      endif
      set unit = u
      if Unit != null then
        set unitType = GetUnitTypeId(unit)
        call DestroyTrigger(deathTrig)
        set deathTrig = CreateTrigger()
        call TriggerRegisterUnitEvent(deathTrig, unit, EVENT_UNIT_DEATH)
        call TriggerAddAction(deathTrig, function thistype.onUnitDeath)
        set thistype.ByHandle[GetHandleId(unit)] = this
      endif
    endmethod

    public method operator Unit takes nothing returns unit
      if GetOwningPlayer(unit) == null then
        return null
      endif
      return unit
    endmethod

    public method AddUnitDependency takes unit u returns nothing
      if diesWithout == null then
        set diesWithout = CreateGroup()
      endif
      call GroupAddUnit(diesWithout, u)
      call refreshDummy()
    endmethod

    public method operator Hivemind= takes boolean b returns nothing
      set hivemind = true
    endmethod

    public method operator UnitType takes nothing returns integer
      return unitType
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
        set Unit = newUnit
      endif
      set unitType = i
    endmethod

    public method operator OwningFaction takes nothing returns Faction
      return Persons[GetPlayerId(GetOwningPlayer(unit))].faction
    endmethod

    public method operator OwningPerson takes nothing returns Person
      return Persons[GetPlayerId(GetOwningPlayer(unit))]
    endmethod

    public method operator OwningPlayer takes nothing returns player
      return GetOwningPlayer(unit)
    endmethod

    public method Spawn takes player owner, real x, real y, real face returns nothing
      if Unit == null then
        set Unit = CreateUnit(owner, unitType, x, y, face)
        call UnitDetermineLevel(unit, 1.)
      elseif not UnitAlive(Unit) then
        call ReviveHero(Unit, x, y, false)
      else
        call SetUnitX(Unit, x)
        call SetUnitY(Unit, y)
        call SetUnitFacing(Unit, face)
      endif
      call SetUnitOwner(Unit, owner, true)
      call refreshDummy()
    endmethod

    private method refreshDummy takes nothing returns nothing
      local group tempGroup
      local unit u
      local string tooltip
      if permaDies then
        call UnitAddAbility(unit, DUMMY_PERMADIES)
      else 
        call UnitRemoveAbility(unit, DUMMY_PERMADIES)
        if diesWithout != null then
          set tempGroup = CreateGroup()
          set tooltip = "When this unit dies, it will be unrevivable unless any of the following capitals are under your control:\n"
          call BlzGroupAddGroupFast(diesWithout, tempGroup)   
          loop
            set u = FirstOfGroup(tempGroup)
            exitwhen u == null
            set tooltip = tooltip + " - " + GetUnitName(u) + "|n"
            call GroupRemoveUnit(tempGroup, u)
          endloop
          set tooltip = tooltip + "\nUsing this ability pings each of these capitals on the minimap."
          call UnitAddAbility(unit, DUMMY_DIESWITHOUT)
          call BlzSetAbilityStringLevelField(BlzGetUnitAbility(unit, DUMMY_DIESWITHOUT), ABILITY_SLF_TOOLTIP_NORMAL_EXTENDED, 0, tooltip)
          call DestroyGroup(tempGroup)
        else
          call UnitRemoveAbility(unit, DUMMY_DIESWITHOUT)
        endif
      endif
    endmethod

    private method permaDeath takes nothing returns nothing
      local effect tempEffect = AddSpecialEffect(deathSfx, GetUnitX(unit), GetUnitY(unit))
      call BlzSetSpecialEffectScale(tempEffect, 2.0)
      call DestroyEffect(tempEffect)
      call UnitDropAllItems(unit)
      call RemoveUnit(unit)
      call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, "|cffffcc00PERMANENT DEATH|r\n" + deathMessage)
      if hivemind then
        call OwningPerson.obliterate()
      endif
    endmethod

    private method onDeath takes nothing returns nothing
      local group tempGroup
      local boolean anyOwned = false
      local unit u
      
      if permaDies then
        call permaDeath()
        return
      endif

      if diesWithout != null then
        set tempGroup = CreateGroup()
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
      endif
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
      set unit = null
      set this.deathSfx = "Abilities\\Spells\\Demon\\DarkPortal\\DarkPortalTarget.mdl"
      return this
    endmethod
  endstruct

endlibrary