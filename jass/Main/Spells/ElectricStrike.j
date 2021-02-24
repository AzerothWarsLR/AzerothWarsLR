library ElectricStrike initializer OnInit requires DummyCast, Environment

  globals
    private constant integer ABIL_ID        = 'A0RC'
    private constant integer STUN_ID        = 'A0RD'        //The ability that gets cast on each unit in the radius
    private constant integer PURGE_ID       = 'Aprg'        //The ability that gets cast on each unit in the radius
    private constant string  PURGE_ORDER    = "purge"
    private constant string  STUN_ORDER     = "firebolt"
    private constant real    RADIUS         = 500.00
    private constant string  EFFECT         = "Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl"

    private group TempGroup = CreateGroup()
  endglobals
 
  private function Cast takes nothing returns nothing
    local unit u
    local unit caster 

    if GetSpellAbilityId() == ABIL_ID then
      set caster = GetTriggerUnit()         
			set P = GetOwningPlayer(caster)
			call GroupEnumUnitsInRange(TempGroup, GetSpellTargetX(), GetSpellTargetY(), RADIUS, null)
			loop
				set u = FirstOfGroup(TempGroup)
				exitwhen u == null
        if IsUnitType(u, UNIT_TYPE_STRUCTURE) == false and UnitAlive(u) == true then
          call DummyCastUnit(GetOwningPlayer(caster), STUN_ID, STUN_ORDER, 1, u)
          call DummyCastUnit(GetOwningPlayer(caster), PURGE_ID, PURGE_ORDER, 1, u)
        endif
				call GroupRemoveUnit(TempGroup,u)
			endloop
		endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( trig, Condition(function Cast))
  endfunction 
    
endlibrary
