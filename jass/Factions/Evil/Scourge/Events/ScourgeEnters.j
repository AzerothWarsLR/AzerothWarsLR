//Triggered any time the Scourge faction begins to exist.
//Currently just provides vision across Northrend.
//This vision gets deleted by ScourgeLeaves. 

library ScourgeEnter initializer OnInit

  globals
    trigger ScourgeEnterTrigger
    fogmodifier array ScourgeFogModifiers
  endglobals

  private function Actions takes nothing returns nothing
    local Person scourgePerson = PersonsByFaction[FACTION_SCOURGE]
    local player scourgePlayer = null
    local integer i = 0
    if scourgePerson != 0 then
      set scourgePlayer = scourgePerson.getPlayer()
      set ScourgeFogModifiers[0] = CreateFogModifierRect(scourgePlayer, FOG_OF_WAR_VISIBLE, gg_rct_Storm_Peaks, true, true)
      set ScourgeFogModifiers[1] = CreateFogModifierRect(scourgePlayer, FOG_OF_WAR_VISIBLE, gg_rct_Central_Northrend, true, true)
      set ScourgeFogModifiers[2] = CreateFogModifierRect(scourgePlayer, FOG_OF_WAR_VISIBLE, gg_rct_The_Basin, true, true)
      set ScourgeFogModifiers[3] = CreateFogModifierRect(scourgePlayer, FOG_OF_WAR_VISIBLE, gg_rct_Ice_Crown, true, true)
      set ScourgeFogModifiers[4] = CreateFogModifierRect(scourgePlayer, FOG_OF_WAR_VISIBLE, gg_rct_Fjord, true, true)
      set ScourgeFogModifiers[5] = CreateFogModifierRect(scourgePlayer, FOG_OF_WAR_VISIBLE, gg_rct_Eastern_Northrend, true, true)
      set ScourgeFogModifiers[6] = CreateFogModifierRect(scourgePlayer, FOG_OF_WAR_VISIBLE, gg_rct_Far_Eastern_Northrend, true, true)
      set ScourgeFogModifiers[7] = CreateFogModifierRect(scourgePlayer, FOG_OF_WAR_VISIBLE, gg_rct_Coldarra, true, true)
      set ScourgeFogModifiers[8] = CreateFogModifierRect(scourgePlayer, FOG_OF_WAR_VISIBLE, gg_rct_Borean_Tundra, true, true)
    loop
    exitwhen ScourgeFogModifiers[i] == null
      call FogModifierStart(ScourgeFogModifiers[i])
      set i = i + 1
    endloop
      set scourgePlayer = null
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    set ScourgeEnterTrigger = CreateTrigger()
    call TriggerAddCondition(ScourgeEnterTrigger, Condition(function Actions))
  endfunction

endlibrary