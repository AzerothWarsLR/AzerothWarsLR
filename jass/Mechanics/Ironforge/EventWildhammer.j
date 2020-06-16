library EventWildhammer requires IronforgeConfig, LegendIronforge

  //Ironforge gains Falstad Wildhammer, access to the Wildhammer FactionMod, and all units in Aerie Peak.

  globals
    private constant integer RESEARCH = 'R01T'
  endglobals

  private function Cast takes nothing returns nothing
    local group tempGroup
    local unit u

    if GetSpellAbilityId() == 'A0UC' then
      call LEGEND_FALSTAD.Spawn(FACTION_IRONFORGE.Person.p, 14081, 4580, 35)
      call SetHeroXP(LEGEND_FALSTAD.Unit, GetHeroXP(LEGEND_MAGNI.Unit), false)
      call FACTION_IRONFORGE.modObjectLimit('n04F', UNLIMITED)      //Wildhammer War Golem
      call FACTION_IRONFORGE.modObjectLimit('hgry', 3)              //Gryphon Rider
      call SetPlayerTechResearched(FACTION_IRONFORGE.Person.p, RESEARCH, 1)

      //Remove pathing blockers obstructing Aerie Peak
      call RemoveDestructable( gg_dest_YTpc_7559 )
      call RemoveDestructable( gg_dest_YTpc_2065 )
      call RemoveDestructable( gg_dest_YTpc_2067 )
      call RemoveDestructable( gg_dest_YTpc_12037 )

      //Transfer all Neutral Passive units in region to Ironforge
      set tempGroup = CreateGroup()
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Aerie_Peak, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, FACTION_IRONFORGE.Person.p)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null

      call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "King Magni Bronzebeard has traveled to Aerie Peak and enlisted the aid of his Dwarven brethern.")
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( trig, Condition(function Cast))
  endfunction 

endlibrary