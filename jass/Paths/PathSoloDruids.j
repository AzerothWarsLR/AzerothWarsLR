library PathSoloDruids initializer OnInit requires DruidsConfig, LegendDruids, Display

  globals
    private constant integer RESEARCH_ID = 'R04H'
  endglobals

  private function Research takes nothing returns nothing
    local player druidsPlayer
    if GetResearched() == RESEARCH_ID then
      call FACTION_DRUIDS.modWeight(3)
      set druidsPlayer = FACTION_DRUIDS.Person.p
      call DisplaySoloPath(FACTION_DRUIDS, "The Night Elves have united under one banner!")
      if not UnitAlive(LEGEND_CENARIUS.Unit) then
        call LEGEND_CENARIUS.Spawn(FACTION_DRUIDS.Person.p, -11679, 6904, 255)
      endif
      set LEGEND_CENARIUS.PermaDies = false
      call LEGEND_CENARIUS.AddUnitDependency(gg_unit_n002_0130)
      //Mod object limits
      call FACTION_DRUIDS.modObjectLimit('edry', -UNLIMITED+24) //Dryad
      call FACTION_DRUIDS.modObjectLimit('earc', UNLIMITED)     //Archer
      call FACTION_DRUIDS.modObjectLimit('esen', UNLIMITED)     //Huntress
      call FACTION_DRUIDS.modObjectLimit('ebal', 8)             //Glaive Thrower
      call FACTION_DRUIDS.modObjectLimit('ehpr', 6)             //Hippogryph Rider 
      call FACTION_DRUIDS.modObjectLimit('Reib', UNLIMITED)     //Improved Bows
      call FACTION_DRUIDS.modObjectLimit('Remg', UNLIMITED)     //Upgraded Moon Glaive
      call FACTION_DRUIDS.modObjectLimit('Roen', UNLIMITED)     //Ensnare
      call FACTION_DRUIDS.modObjectLimit('eaom', UNLIMITED)     //Ancient of War
      //Apply free technologies
      call SetPlayerTechResearched(druidsPlayer, 'R00V', 1)  //Balance Mastery
      call SetPlayerTechResearched(druidsPlayer, 'R04O', 1)  //Sentinel Buff
      call SetPlayerTechResearched(druidsPlayer, 'R04P', 1)  //Nature Buff
      call SetPlayerTechResearched(druidsPlayer, 'R02G', 2)  //Druid of the Growth Adept Training
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary