library LegendScourge initializer OnInit requires Legend

  globals
    Legend LEGEND_KELTHUZAD

    Legend LEGEND_SCHOLOMANCE
    Legend LEGEND_LICHKING
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_KELTHUZAD = Legend.create()
    set LEGEND_KELTHUZAD.Unit = gg_unit_U001_1237
    set LEGEND_KELTHUZAD.PermaDies = true
    set LEGEND_KELTHUZAD.DeathMessage = "Kel'thuzad has been slain. He lives on in spectral form, and may yet return if he is brought to the Sunwell."

    set LEGEND_SCHOLOMANCE = Legend.create()
    set LEGEND_SCHOLOMANCE.Unit = gg_unit_u012_1149
    set LEGEND_SCHOLOMANCE.DeathMessage = "Scholomance, the center of the Scourge's operations in Lordaeron, has been destroyed."

    set LEGEND_LICHKING = Legend.create()
    set LEGEND_LICHKING.Unit = gg_unit_u000_0649
    set LEGEND_LICHKING.Hivemind = true
    set LEGEND_LICHKING.DeathMessage = "The great Lich King has been destroyed. With no central mind to command them, the forces of the Undead have gone rogue."
  endfunction

endlibrary