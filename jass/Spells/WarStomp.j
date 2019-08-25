library WarStompCairne initializer OnInit requires Damage, DummyCast, Filters

    globals
        private constant integer ABIL_ID        = 'A0WM'
        private constant integer STUN_ID        = 'A0WN'        //The Storm Bolt dummy spell that applies the stun itself
        private constant string  STUN_ORDER     = "thunderbolt"
        private constant real    DAMAGE_BASE    = 20
        private constant real    DAMAGE_LEVEL   = 30
        private constant real    RADIUS         = 300.00
        private constant integer DURATION_BASE  = 2.
        private constant integer DURATION_LEVEL = 1.
        private constant string  EFFECT         = "Abilities\\Spells\\Orc\\Warstomp\\WarStompCaster.mdl"
        private group     TempGroup = CreateGroup()
    endglobals
 
    private function Cast takes nothing returns nothing
        local unit u
        local unit caster
        local integer level        

        if GetSpellAbilityId() == ABIL_ID then
            set caster = GetTriggerUnit()
            set level = GetUnitAbilityLevel(caster, ABIL_ID)             
			set P = GetOwningPlayer(caster)
			call GroupEnumUnitsInRange(TempGroup,GetUnitX(caster),GetUnitY(caster),RADIUS,Condition(function EnemyAliveFilter))
			loop
				set u = FirstOfGroup(TempGroup)
				exitwhen u == null
				call Damage_Spell(caster, u, DAMAGE_BASE*DAMAGE_LEVEL*level)
				call DummyCastUnit(STUN_ID, STUN_ORDER, DURATION_BASE + DURATION_LEVEL*level, u)
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
