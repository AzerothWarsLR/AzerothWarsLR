library LegendLegion initializer OnInit requires Legend

  globals
    Legend LEGEND_ARCHIMONDE
    Legend LEGEND_ANETHERON

    Legend LEGEND_LEGIONNEXUS
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_ARCHIMONDE = Legend.create()
    set LEGEND_ARCHIMONDE.Unit = gg_unit_Uwar_2344
    set LEGEND_ARCHIMONDE.PermaDies = true
    set LEGEND_ARCHIMONDE.DeathMessage = "Archimonde the Defiler has been banished from Azeroth, marking the end of his second failed invasion."
    
    set LEGEND_ANETHERON = Legend.create()

    set LEGEND_LEGIONNEXUS = Legend.create()
    set LEGEND_LEGIONNEXUS.Unit = gg_unit_u01Q_3871
    set LEGEND_LEGIONNEXUS.DeathMessage = "The Legion Nexus was destroyed. The Burning Legion is now cut off from Azeroth."
  endfunction

endlibrary