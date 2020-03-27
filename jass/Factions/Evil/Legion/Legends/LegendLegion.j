library LegendLegion initializer OnInit requires Legend

  globals
    Legend LEGEND_ARCHIMONDE
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_ARCHIMONDE = Legend.create()
    set LEGEND_ARCHIMONDE.UnitType = 'Uwar'
    set LEGEND_ARCHIMONDE.DeathMessage = "Archimonde the Defiler has been banished from Azeroth, marking the end of his second failed invasion."
  endfunction

endlibrary