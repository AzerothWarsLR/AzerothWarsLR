library LegendLegion initializer OnInit requires Legend

  globals
    Legend LEGEND_ARCHIMONDE
    Legend LEGEND_ANETHERON
    Legend LEGEND_TICHONDRIUS
    Legend LEGEND_MALGANIS
    Legend LEGEND_KILJAEDEN

    Legend LEGEND_LEGIONNEXUS
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_ARCHIMONDE = Legend.create()
    set LEGEND_ARCHIMONDE.Unit = gg_unit_Uwar_2344
    set LEGEND_ARCHIMONDE.PermaDies = true
    set LEGEND_ARCHIMONDE.DeathMessage = "Archimonde the Defiler has been banished from Azeroth, marking the end of his second failed invasion."
    
    set LEGEND_ANETHERON = Legend.create()
    set LEGEND_ANETHERON.UnitType = 'U00L'

    set LEGEND_TICHONDRIUS = Legend.create()
    set LEGEND_TICHONDRIUS.Unit = gg_unit_Utic_1234
    set LEGEND_TICHONDRIUS.PlayerColor = PLAYER_COLOR_RED

    set LEGEND_MALGANIS = Legend.create()
    set LEGEND_MALGANIS.Unit = gg_unit_Umal_0675
    set LEGEND_MALGANIS.PlayerColor = PLAYER_COLOR_GREEN

    set LEGEND_KILJAEDEN = Legend.create()
    set LEGEND_KILJAEDEN.UnitType = 'U004'
    set LEGEND_KILJAEDEN.PermaDies = true
    set LEGEND_KILJAEDEN.DeathMessage = "Kil'jaeden the Deceiver has been annihilated. The Burning Legion is now without its most formidable lieutenants."

    set LEGEND_LEGIONNEXUS = Legend.create()
    set LEGEND_LEGIONNEXUS.Unit = gg_unit_u01Q_3871
    set LEGEND_LEGIONNEXUS.DeathMessage = "The Legion Nexus was destroyed. The Burning Legion is now cut off from Azeroth."
  endfunction

endlibrary