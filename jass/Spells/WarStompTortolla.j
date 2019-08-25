library WarStompTortolla initializer OnInit requires DummyCast, Filters

    globals
        private constant integer ABIL_ID        = 'A0WX'
        private constant integer STUN_ID        = 'A0WN'        //The Storm Bolt dummy spell that applies the stun itself
        private constant string  STUN_ORDER     = "thunderbolt"
        private constant real    DAMAGE         = 25
        private constant real    RADIUS         = 300.00
        private constant integer DURATION       = 3
        private constant string  EFFECT         = "Abilities\\Spells\\Orc\\Warstomp\\WarStompCaster.mdl"
        private group     TempGroup = CreateGroup()
    endglobals
 
    private function Cast takes nothing returns nothing
        local unit u
        local unit caster    

        if GetSpellAbilityId() == ABIL_ID then
            set caster = GetTriggerUnit()   
			set P = GetOwningPlayer(caster)
			call GroupEnumUnitsInRange(TempGroup,GetUnitX(caster),GetUnitY(caster),RADIUS,Condition(function EnemyAliveFilter))
			loop
				set u = FirstOfGroup(TempGroup)
				exitwhen u == null
				call UnitDamageTarget(caster, u, DAMAGE, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
				call DummyCastUnit(STUN_ID, STUN_ORDER, DURATION, u)
				call GroupRemoveUnit(TempGroup,u)
			endloop
			call DestroyEffect(AddSpecialEffect(EFFECT,GetUnitX(caster),GetUnitY(caster)))
		endif
    endfunction

    private function OnInit takes nothing returns nothing
        local trigger trig = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerAddCondition( trig, Condition(function Cast))
    endfunction 
    
endlibrary