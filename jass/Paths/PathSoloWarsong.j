library PathSoloWarsong initializer OnInit requires WarsongConfig, LegendWarsong, Display

  globals
    private constant integer RESEARCH_ID = 'R02M'
  endglobals

  private function Research takes nothing returns nothing
    local player warsongPlayer
    if GetResearched() == RESEARCH_ID then
      set warsongPlayer = FACTION_WARSONG.Person.p
      call DisplaySoloPath(FACTION_WARSONG, "Without the guidance of the shamans and Thrall, the remaining forces of the Horde have succumbed to the Blood Pact of Mannoroth once more.")
      set LEGEND_GROM.UnitType = 'Opgh'
      call LEGEND_JERGOSH.Spawn(warsongPlayer, GetRectCenterX(gg_rct_Jergosh), GetRectCenterY(gg_rct_Jergosh), 0)
      call UnitDetermineLevel(LEGEND_JERGOSH.Unit, 1.00)
      call LEGEND_MANNOROTH.Spawn(warsongPlayer, GetRectCenterX(gg_rct_Mannoroth), GetRectCenterY(gg_rct_Mannoroth), 237)
      call UnitDetermineLevel(LEGEND_MANNOROTH.Unit, 1.00)
      set LEGEND_REXXAR.Unit = null
      //Techtree subtractions
      call FACTION_WARSONG.modObjectLimit('opeo', -UNLIMITED)   //Peon
      call FACTION_WARSONG.modObjectLimit('ogru', -UNLIMITED)   //Grunt
      call FACTION_WARSONG.modObjectLimit('orai', -UNLIMITED)   //Raider
      call FACTION_WARSONG.modObjectLimit('o00G', -UNLIMITED)   //Blademaster
      //Techtree additions
      call FACTION_WARSONG.modObjectLimit('o00E', UNLIMITED)   //Peon
      call FACTION_WARSONG.modObjectLimit('o00P', UNLIMITED)   //Warsong Grunt
      call FACTION_WARSONG.modObjectLimit('o00S', UNLIMITED)   //Raider
      call FACTION_WARSONG.modObjectLimit('o005', 6)           //Blademaster
      //Free researches
      call SetPlayerTechMaxAllowed(warsongPlayer, 'R02O', 1)
      call SetPlayerTechMaxAllowed(warsongPlayer, 'R02Q', 1)
      call SetPlayerTechResearched(warsongPlayer, 'R02O', 1)
      call SetPlayerTechResearched(warsongPlayer, 'R02Q', 1)
      call SetPlayerTechResearched(warsongPlayer, 'R004', 1)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary