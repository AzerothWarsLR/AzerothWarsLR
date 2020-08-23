//When Archimonde permadies, the Legion player gets Kil'jaeden instead.
library ArchimondeKiljaeden initializer OnInit requires LegionConfig, LegendLegion

  private function Dies takes nothing returns nothing
    if LEGEND_ARCHIMONDE == GetTriggerLegend() then
      call LEGEND_KILJAEDEN.Spawn(FACTION_LEGION.Person.Player, GetRectCenterX(gg_rct_Kiljaeden), GetRectCenterY(gg_rct_Kiljaeden), 244)
      call SetHeroXP(LEGEND_KILJAEDEN.Unit, GetHeroXP(LEGEND_ARCHIMONDE.Unit), true)
      set LEGEND_ARCHIMONDE.DeathMessage = "Archimonde the Defiler has been banished from Azeroth, marking the end of his second failed invasion. Kil'jaeden the Deceiver has descended from the Twisting Nether to succeed where his brother could not."
      call DestroyTrigger(GetTriggeringTrigger())         
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call OnLegendPrePermaDeath.register(trig)
    call TriggerAddCondition(trig, Condition(function Dies))            
  endfunction  

endlibrary