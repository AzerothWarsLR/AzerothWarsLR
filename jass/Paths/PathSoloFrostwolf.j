library PathSoloFrostwolf initializer OnInit requires FrostwolfConfig, LegendFrostwolf, Display

  globals
    private constant integer RESEARCH_ID = 'R02N'
  endglobals

  private function Research takes nothing returns nothing
    local player frostwolfPlayer
    if GetResearched() == RESEARCH_ID then
      set frostwolfPlayer = FACTION_FROSTWOLF.Person.p
      call DisplaySoloPath(FACTION_FROSTWOLF, "Thrall has reformed the Horde of Kalimdor, and has united the various races into a uniform force.")
      call LEGEND_GAZLOWE.Spawn(frostwolfPlayer, GetRectCenterX(gg_rct_Gazlowe), GetRectCenterY(gg_rct_Gazlowe), 235)
      call UnitDetermineLevel(LEGEND_GAZLOWE.Unit, 1.00)
      call FACTION_FROSTWOLF.modObjectLimit('o009', UNLIMITED)   //Horde Embassy
      call FACTION_FROSTWOLF.modObjectLimit('otto', -UNLIMITED)  //Tauren Totem
      call FACTION_FROSTWOLF.modObjectLimit('nzep', 2)           //Goblin Zeppelin
      call FACTION_FROSTWOLF.modObjectLimit('nogn', UNLIMITED)   //Stonemaul Ogre Magi
      call FACTION_FROSTWOLF.modObjectLimit('h04M', -UNLIMITED)  //Dynamite Team
      call FACTION_FROSTWOLF.modObjectLimit('R023', UNLIMITED)   //Spiritual Infusion
      call FACTION_FROSTWOLF.modObjectLimit('R02I', UNLIMITED)   //Ogre Magi Adept Training
      call FACTION_FROSTWOLF.modObjectLimit('Rosp', UNLIMITED)   //Spiked Barricades
      call FACTION_FROSTWOLF.modObjectLimit('Rhfs', UNLIMITED)   //Dragmentation Shards
      call FACTION_FROSTWOLF.modObjectLimit('R01T', UNLIMITED)   //Move your arse
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary