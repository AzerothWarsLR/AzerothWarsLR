library EventCthunDies initializer OnInit requires Persons

    globals
      private constant integer UNIT_ID = 'U00R'
    endglobals

    private function Dies takes nothing returns nothing
      local effect tempEffect = null
      local Person triggerPerson = 0
      if GetUnitTypeId(GetTriggerUnit()) == UNIT_ID then
        set triggerPerson = Persons[GetPlayerId(GetOwningPlayer(GetTriggerUnit()))]
        call DisplayTextToForce(GetPlayersAll(), "The unfathomable eldritch entity known as C'thun has finally been brought to an end. The " + triggerPerson.faction.prefixCol + "Kingdom of Ahn'qiraj|r is no more. Without a hive mind to control them, C'thun's former minions have dispersed into the deserts of Silithus.")
        set tempEffect = AddSpecialEffect("Abilities\\Spells\\Undead\\DarkRitual\\DarkRitualTarget.mdl", GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
        call BlzSetSpecialEffectScale(tempEffect, 3)
        call DestroyEffect(tempEffect)
        set tempEffect = null
        call triggerPerson.obliterate()
        call RemoveUnit(GetTriggerUnit())
        call DestroyTrigger(GetTriggeringTrigger())
      endif
    endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition(trig, Condition(function Dies))      
  endfunction    


endlibrary