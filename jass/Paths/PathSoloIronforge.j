library PathSoloIronforge initializer OnInit requires IronforgeConfig, Display

  globals
    private constant integer RESEARCH_ID = 'R014'
  endglobals

  private function Research takes nothing returns nothing
    local player ironforgePlayer
    if GetResearched() == RESEARCH_ID then
      set ironforgePlayer = FACTION_IRONFORGE.Player
      call FACTION_IRONFORGE.modWeight(3)
      call DisplaySoloPath(FACTION_IRONFORGE, "Now alone in their fight, the Dwarves of Ironforge reaffirm their old Empire and reforge the various clans together.")
      call SetUnitManaBJ( gg_unit_h03Q_0191, ( GetUnitStateSwap(UNIT_STATE_MANA, gg_unit_h03Q_0191) + 1000.00 ) ) //Hall of Explorers
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary