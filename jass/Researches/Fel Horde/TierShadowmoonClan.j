library TierShadowmoonClan initializer OnInit requires FelHordeConfig, GeneralHelpers

  globals
    private constant integer RESEARCH_ID = 'R047'
  endglobals

  private function Research takes nothing returns nothing
    if GetResearched() == RESEARCH_ID then
      call SetPlayerAbilityAvailableBJ(true, 'A0MZ', FACTION_FEL_HORDE.Person.p)  //Demonic Construction
      call UnitRescue(gg_unit_n081_4074, FACTION_FEL_HORDE.Person.p)
      call UnitRescue(gg_unit_n081_1585, FACTION_FEL_HORDE.Person.p)
      call FACTION_FEL_HORDE.modObjectLimit('nina', 2)      //Infernal Juggernaut
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary