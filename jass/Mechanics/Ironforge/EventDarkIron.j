library EventDarkIron initializer OnInit requires IronforgeConfig, LegendIronforge

  //Ironforge gains Dagran, access to the Darl Iron FactionMod, and all units in Shadowforge City.

  globals
    private constant integer RESEARCH = 'R04R'
  endglobals

  private function Cast takes nothing returns nothing
    local group tempGroup
    local unit u

    if GetSpellAbilityId() == 'A0UZ' then
      call LEGEND_DAGRAN.Spawn(FACTION_IRONFORGE.Person.p, -24540, -30728, 45)
      call SetHeroXP(LEGEND_DAGRAN.Unit, GetHeroXP(LEGEND_MAGNI.Unit), false)
      call FACTION_IRONFORGE.modObjectLimit('n02D', UNLIMITED)      //Dark Iron War Golem
      call FACTION_IRONFORGE.modObjectLimit('h041', 12)             //Fire Tank
      call SetPlayerTechResearched(FACTION_IRONFORGE.Person.p, RESEARCH, 1)                     

      //Transfer all Neutral Passive units in region to Ironforge
      set tempGroup = CreateGroup()
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Shadowforge_City, null)
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

      call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "King Magni has approached the Dark Iron dwarves and offered an alliance. The Dark Iron clan has reluctantly agreed.")
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( trig, Condition(function Cast))
  endfunction 

endlibrary