//A Legend is a wrapper for unique heroes. A Legend can continue to exist even if the unit it describes does not. 
//A Legend might have other units it relies on to survive. If so, when it dies, it gets removed if those units are not under control.
//There is a dummy ability to represent this.

library Legend initializer OnInit requires GeneralHelpers, Event

  globals
    private constant integer DUMMY_DIESWITHOUT = 'LEgn'
    private constant integer DUMMY_PERMADIES = 'LEgo'

    private Legend TriggerLegend = 0
    Event OnLegendChangeOwner
    Event OnLegendPrePermaDeath //Fired before the unit is removed
    Event OnLegendPermaDeath
  endglobals

  struct Legend
    private static Table byHandle

    private unit unit
    private integer unitType = 0
    private string deathMessage
    private string deathSfx
    private boolean permaDies = false
    private boolean hivemind = false  //This hero causes the death of its own faction if it dies
    private group diesWithout //This hero permanently dies if it dies without these under control]
    private trigger ownerTrig
    private trigger deathTrig
    private trigger castTrig
    private trigger damageTrig
    private boolean capturable
    private integer startingXP //How much experience this Legend had when it was first registered
    private boolean hasCustomColor = false
    private playercolor playerColor

    public method operator Name takes nothing returns string
      if this.unit == null and this.unitType != 0 then
        return GetObjectName(this.unitType)
      endif
      if IsUnitType(this.unit, UNIT_TYPE_HERO) == true then
        return GetHeroProperName(this.unit)
      else
        return GetUnitName(this.unit)
      endif
      return "NONAME"
    endmethod

    public method operator HasCustomColor takes nothing returns boolean
      return this.hasCustomColor
    endmethod

    public method operator PlayerColor takes nothing returns playercolor
      return this.playerColor
    endmethod

    public method operator PlayerColor= takes playercolor playerColor returns nothing
      set this.playerColor = playerColor
      set this.hasCustomColor = true
      if this.unit != null then
        call SetUnitColor(this.unit, playerColor)
      endif
    endmethod

    public method operator StartingXP takes nothing returns integer
      return this.startingXP
    endmethod

    public method operator StartingXP= takes integer value returns nothing
      set this.startingXP = value
    endmethod

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

    public method operator Capturable= takes boolean capturable returns nothing
      set this.capturable = capturable
    endmethod

    public method operator Unit= takes unit u returns nothing
      if Unit != null then
        set thistype.byHandle[GetHandleId(unit)] = 0
        call UnitDropAllItems(unit)
        call RemoveUnit(unit)
      endif
      set unit = u
      if Unit != null then
        set unitType = GetUnitTypeId(unit)
        //Death trig
        call DestroyTrigger(deathTrig)
        set deathTrig = CreateTrigger()
        call TriggerRegisterUnitEvent(deathTrig, unit, EVENT_UNIT_DEATH)
        call TriggerAddAction(deathTrig, function thistype.onUnitDeath)
        //Cast trig
        call DestroyTrigger(castTrig)
        set castTrig = CreateTrigger()
        call TriggerRegisterUnitEvent(castTrig, unit, EVENT_UNIT_SPELL_FINISH)
        call TriggerAddAction(castTrig, function thistype.onUnitCast)
        //Damage trig
        call DestroyTrigger(damageTrig)
        set damageTrig = CreateTrigger()
        call TriggerRegisterUnitEvent(damageTrig, unit, EVENT_UNIT_DAMAGED)
        call TriggerAddAction(damageTrig, function thistype.onUnitDamaged)
        //Ownership change trig
        call DestroyTrigger(ownerTrig)
        set ownerTrig = CreateTrigger()
        call TriggerRegisterUnitEvent(ownerTrig, unit, EVENT_UNIT_CHANGE_OWNER)
        call TriggerAddAction(ownerTrig, function thistype.onUnitChangeOwner)
        //Set starting experience
        if IsUnitType(unit, UNIT_TYPE_HERO) and startingXP == 0 then
          set startingXP = GetHeroXP(unit)
        endif
        //
        if this.playerColor == null then
          call SetUnitColor(unit, GetPlayerColor(GetOwningPlayer(unit)))
        else
          call SetUnitColor(unit, this.playerColor)
        endif
        set thistype.byHandle[GetHandleId(unit)] = this
        call refreshDummy()
      endif
    endmethod

    public method operator Unit takes nothing returns unit
      if GetOwningPlayer(unit) == null then
        return null
      endif
      return unit
    endmethod

    public method ClearUnitDependencies takes nothing returns nothing
      call DestroyGroup(diesWithout)
      set diesWithout = null
      call refreshDummy()
    endmethod

    public method AddUnitDependency takes unit u returns nothing
      if diesWithout == null then
        set diesWithout = CreateGroup()
      endif
      call GroupAddUnit(diesWithout, u)
      call refreshDummy()
    endmethod

    public method operator Hivemind= takes boolean b returns nothing
      set hivemind = b
    endmethod

    public method operator UnitType takes nothing returns integer
      return unitType
    endmethod

    public method operator UnitType= takes integer i returns nothing
      local unit newUnit
      local real oldX
      local real oldY
      if unit != null then
        set newUnit = CreateUnit(OwningPlayer, i, GetUnitX(unit), GetUnitY(unit), GetUnitFacing(unit))
        call SetUnitState(newUnit, UNIT_STATE_LIFE, GetUnitState(unit, UNIT_STATE_LIFE))
        call SetUnitState(newUnit, UNIT_STATE_MANA, GetUnitState(unit, UNIT_STATE_MANA))
        call SetHeroXP(newUnit, GetHeroXP(unit), false)
        call UnitTransferItems(unit, newUnit)
        set oldX = GetUnitX(this.unit)
        set oldY = GetUnitY(this.unit)
        call RemoveUnit(unit)
        set Unit = newUnit
        call SetUnitPosition(this.unit, oldX, oldY)
      endif
      set unitType = i
    endmethod

    public method operator OwningFaction takes nothing returns Faction
      return this.OwningPerson.Faction
    endmethod

    public method operator OwningPerson takes nothing returns Person
      return Person.ByHandle(GetOwningPlayer(this.unit))
    endmethod

    public method operator OwningPlayer takes nothing returns player
      return GetOwningPlayer(unit)
    endmethod

    public method Spawn takes player owner, real x, real y, real face returns nothing
      if Unit == null then
        set Unit = CreateUnit(owner, unitType, x, y, face)
      elseif not UnitAlive(Unit) then
        call ReviveHero(Unit, x, y, false)
      else
        call SetUnitX(Unit, x)
        call SetUnitY(Unit, y)
        call SetUnitFacing(Unit, face)
      endif
      if GetOwningPlayer(this.unit) != owner then
        call SetUnitOwner(Unit, owner, true)
      endif
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
      local effect tempEffect
      local string displayString
      set TriggerLegend = this
      call OnLegendPrePermaDeath.fire()
      if IsUnitType(unit, UNIT_TYPE_HERO) then
        set tempEffect = AddSpecialEffect(deathSfx, GetUnitX(unit), GetUnitY(unit))
        call BlzSetSpecialEffectScale(tempEffect, 2.0)
        call DestroyEffect(tempEffect)
        call UnitDropAllItems(unit)
        call RemoveUnit(unit)
      endif
      if this.deathMessage != null and this.deathMessage != "" then
        if IsUnitType(unit, UNIT_TYPE_STRUCTURE) then
          set displayString = "\n|cffffcc00CAPITAL DESTROYED|r\n"
        else
          set displayString = "\n|cffffcc00HERO SLAIN|r\n"
        endif
        call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, displayString + deathMessage)
      endif
      if hivemind and OwningPerson != 0 then
        call OwningPerson.Faction.obliterate()
      endif
      set TriggerLegend = this
      call OnLegendPermaDeath.fire()
    endmethod

    private method onChangeOwner takes nothing returns nothing
      set TriggerLegend = this
      call OnLegendChangeOwner.fire()
    endmethod

    private method onDamaging takes nothing returns nothing
      if capturable and GetEventDamage() >= GetUnitState(unit, UNIT_STATE_LIFE) then
        call UnitAddAbility(unit, 'A0EA')
        call SetUnitOwner(unit, GetOwningPlayer(GetEventDamageSource()), true)
        call BlzSetEventDamage(0)
        call SetUnitState(unit, UNIT_STATE_LIFE, GetUnitState(unit, UNIT_STATE_MAX_LIFE))
        call UnitRemoveAbility(unit, 'A0EA')
      endif
    endmethod

    private method onCast takes nothing returns nothing
      local group tempGroup
      local unit u
      if GetSpellAbilityId() == DUMMY_DIESWITHOUT then
        set tempGroup = CreateGroup()
        call BlzGroupAddGroupFast(diesWithout, tempGroup)
        loop
          set u = FirstOfGroup(tempGroup)
          exitwhen u == null
          if GetLocalPlayer() == GetTriggerPlayer() then
            call PingMinimap(GetUnitX(u), GetUnitY(u), 5)
          endif
          call GroupRemoveUnit(tempGroup, u)
        endloop
        call DestroyGroup(tempGroup)
        set tempGroup = null
      endif
    endmethod

    private method onDeath takes nothing returns nothing
      local group tempGroup
      local boolean anyOwned = false
      local unit u
      
      if GetOwningPlayer(unit) == Player(PLAYER_NEUTRAL_PASSIVE) or GetOwningPlayer(unit) == Player(PLAYER_NEUTRAL_AGGRESSIVE) and deathMessage != "" then
        call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, "\n|cffffcc00LEGENDARY CREEP DEATH|r\n" + deathMessage)
      endif

      if permaDies or not IsUnitType(this.unit, UNIT_TYPE_HERO) then
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

    static method ByHandle takes unit whichUnit returns thistype
      return thistype.byHandle[GetHandleId(whichUnit)]
    endmethod

    private static method onUnitChangeOwner takes nothing returns nothing
      call thistype(thistype.byHandle[GetHandleId(GetTriggerUnit())]).onChangeOwner()
    endmethod

    private static method onUnitDamaged takes nothing returns nothing
      call thistype(thistype.byHandle[GetHandleId(GetTriggerUnit())]).onDamaging()
    endmethod

    private static method onUnitDeath takes nothing returns nothing
      call thistype(thistype.byHandle[GetHandleId(GetTriggerUnit())]).onDeath()
    endmethod

    private static method onUnitCast takes nothing returns nothing
      call thistype(thistype.byHandle[GetHandleId(GetTriggerUnit())]).onCast()
    endmethod

    private method destroy takes nothing returns nothing
      call this.deallocate()
      call UnitDropAllItems(unit)
      call DestroyGroup(diesWithout)
      call RemoveUnit(unit)
      call DestroyGroup(diesWithout)
    endmethod

    private static method onInit takes nothing returns nothing
      set thistype.byHandle = Table.create()
      set OnLegendChangeOwner = Event.create()
      set OnLegendPermaDeath = Event.create()
      set OnLegendPrePermaDeath = Event.create()
    endmethod

    static method create takes nothing returns thistype
      local thistype this = thistype.allocate()
      set unit = null
      set this.deathSfx = "Abilities\\Spells\\Demon\\DarkPortal\\DarkPortalTarget.mdl"
      return this
    endmethod
  endstruct

  function GetTriggerLegend takes nothing returns Legend
    return TriggerLegend
  endfunction

  private function OnInit takes nothing returns nothing
    
  endfunction

endlibrary