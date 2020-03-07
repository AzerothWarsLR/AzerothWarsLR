//When Cenarius dies, he dies permanently if:
//The owning player does not control the World Tree
//OR the player's faction is not Night Elves (would be either Druids or Sentinels)

library EventCenariusDies initializer OnInit requires Persons, Faction

  private function Dies takes nothing returns nothing
    local Person tempPerson = 0
    local effect tempEffect = null
    local group tempGroup = null
    if GetUnitTypeId(GetTriggerUnit()) == 'Ecen' then
      set tempPerson = Persons[GetPlayerId(GetOwningPlayer(GetTriggerUnit()))]
      if tempPerson.faction != FACTION_NIGHT_ELVES or GetOwningPlayer(gg_unit_n002_0130) != GetTriggerPlayer() then
        set tempEffect = AddSpecialEffect("Objects\\Spawnmodels\\NightElf\\EntBirthTarget\\EntBirthTarget.mdl", GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
        call BlzSetSpecialEffectScale(tempEffect, 3)
        call DestroyEffect(tempEffect)
        call DisplayTextToForce(GetPlayersAll(), "Cenarius, Lord of the Forest and patron of the Night Elves, has fallen.")
        call RemoveUnit(GetTriggerUnit())

        //Play extra sound for Warsong kill
        set tempPerson = Persons[GetPlayerId(GetOwningPlayer(GetKillingUnit()))]
        if tempPerson.faction == FACTION_WARSONG or tempPerson.faction == FACTION_MANNOROTH then
          call PlaySoundBJ(gg_snd_O05Grom38)
          call DisplayTextToForce(GetPlayersAll(), "The Demigod has fallen! The Warsong is supreme!")
        endif

        //Cleanup
        set tempEffect = null
        set tempGroup = null
        call DestroyTrigger(GetTriggeringTrigger())
      endif
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition(trig, Condition(function Dies))      
  endfunction    

endlibrary