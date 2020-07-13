library PathSoloLegion initializer OnInit requires LegionConfig, LegendLegion, Display

  globals
    private constant integer RESEARCH_ID = 'R05F'
    private fogmodifier array NorthrendFogModifiers
  endglobals

  private function EnableNorthrendVision takes nothing returns nothing
    local player whichPlayer = FACTION_LEGION.Person.p
    local integer i = 0
    set NorthrendFogModifiers[0] = CreateFogModifierRect(whichPlayer, FOG_OF_WAR_VISIBLE, gg_rct_Storm_Peaks, true, true)
    set NorthrendFogModifiers[1] = CreateFogModifierRect(whichPlayer, FOG_OF_WAR_VISIBLE, gg_rct_Central_Northrend, true, true)
    set NorthrendFogModifiers[2] = CreateFogModifierRect(whichPlayer, FOG_OF_WAR_VISIBLE, gg_rct_The_Basin, true, true)
    set NorthrendFogModifiers[3] = CreateFogModifierRect(whichPlayer, FOG_OF_WAR_VISIBLE, gg_rct_Ice_Crown, true, true)
    set NorthrendFogModifiers[4] = CreateFogModifierRect(whichPlayer, FOG_OF_WAR_VISIBLE, gg_rct_Fjord, true, true)
    set NorthrendFogModifiers[5] = CreateFogModifierRect(whichPlayer, FOG_OF_WAR_VISIBLE, gg_rct_Eastern_Northrend, true, true)
    set NorthrendFogModifiers[6] = CreateFogModifierRect(whichPlayer, FOG_OF_WAR_VISIBLE, gg_rct_Far_Eastern_Northrend, true, true)
    set NorthrendFogModifiers[7] = CreateFogModifierRect(whichPlayer, FOG_OF_WAR_VISIBLE, gg_rct_Coldarra, true, true)
    set NorthrendFogModifiers[8] = CreateFogModifierRect(whichPlayer, FOG_OF_WAR_VISIBLE, gg_rct_Borean_Tundra, true, true)
    loop
    exitwhen NorthrendFogModifiers[i] == null
      call FogModifierStart(NorthrendFogModifiers[i])
      set i = i + 1
    endloop
  endfunction

  private function DisableNorthrendVision takes nothing returns nothing
    local integer i = 0
    loop
      exitwhen NorthrendFogModifiers[i] == null
      call DestroyFogModifier(NorthrendFogModifiers[i])
      set NorthrendFogModifiers[i] = null
      set i = i + 1
    endloop
  endfunction  

  private function PersonChangesFaction takes nothing returns nothing
    if GetChangingPersonPrevFaction() == FACTION_LEGION then
      call DisableNorthrendVision()
    endif
  endfunction

  private function Research takes nothing returns nothing
    local player tempPlayer
    if GetResearched() == RESEARCH_ID then
      set tempPlayer = FACTION_LEGION.Person.p
      call FACTION_LEGION.modObjectLimit('R01X', UNLIMITED) //Plague Engineering Mastery
      call FACTION_LEGION.modWeight(3)
      call DisplaySoloPath(FACTION_LEGION, "With Ner'zhul's failure, the Legion has brought forth Anetheron to instead reign in control of the remnants of the Undead.")
      call LEGEND_ANETHERON.Spawn(tempPlayer, GetRectCenterX(gg_rct_Anetheron), GetRectCenterY(gg_rct_Anetheron), 270)
      call UnitDetermineLevel(LEGEND_ANETHERON.Unit, 1.00)
      call SetPlayerTechResearched(tempPlayer, 'R01X', 1) //Plague Manipulation
      call SetPlayerTechResearched(tempPlayer, 'Ruac', 1) //Cannibalize
      call EnableNorthrendVision()
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    

    set trig = CreateTrigger()
    call OnPersonFactionChange.register(trig)
    call TriggerAddCondition(trig, Condition(function PersonChangesFaction))
  endfunction

endlibrary