library ScourgeExit initializer OnInit

  globals
    trigger ScourgeExitTrigger = null
  endglobals

  private function Actions takes nothing returns nothing
    local Person scourgePerson = PersonsByFaction[FACTION_SCOURGE]
    local player scourgePlayer = null
    local integer i = 0
    loop
    exitwhen ScourgeFogModifiers[i] == null
      call DestroyFogModifier(ScourgeFogModifiers[i])
      set ScourgeFogModifiers[i] = null
      set i = i + 1
    endloop
  endfunction

  private function OnInit takes nothing returns nothing
    set ScourgeExitTrigger = CreateTrigger()
    call TriggerAddCondition(ScourgeExitTrigger, Condition(function Actions))
  endfunction

endlibrary
