library EventDarkIron initializer OnInit requires IronforgeConfig, LegendIronforge

  //Ironforge gains Dagran, new units enabled, and control of all units in Shadowforge City.

  globals
    private constant integer RESEARCH = 'R04R'
  endglobals

  private function Cast takes nothing returns nothing
    local group tempGroup
    local unit u

    if GetSpellAbilityId() == 'A0UZ' then
      call LEGEND_DAGRAN.Spawn(FACTION_IRONFORGE.Player, GetRectCenterX(gg_rct_DagranSpawn), GetRectCenterY(gg_rct_DagranSpawn), 44)
      call SetHeroXP(LEGEND_DAGRAN.Unit, GetHeroXP(LEGEND_MAGNI.Unit), false)
      call SetPlayerTechResearched(FACTION_IRONFORGE.Player, RESEARCH, 1)     
      call SetPlayerAbilityAvailable(FACTION_IRONFORGE.Player, 'A0UZ', false)                

      //Transfer all Neutral Passive units in region to Ironforge
      set tempGroup = CreateGroup()
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Shadowforge_City, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, FACTION_IRONFORGE.Player)
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