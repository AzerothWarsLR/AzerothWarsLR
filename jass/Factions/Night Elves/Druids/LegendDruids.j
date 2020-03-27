library LegendDruids initializer OnInit requires Legend

  globals
    Legend LEGEND_CENARIUS
    Legend LEGEND_MALFURION
    Legend LEGEND_FANDRAL
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_CENARIUS = Legend.create()
    set LEGEND_CENARIUS.Unit = gg_unit_Ecen_1213
    set LEGEND_CENARIUS.PermaDies = true
    set LEGEND_CENARIUS.DeathMessage = "The Lord of the Forest, Cenarius, has fallen. The druids of the Kaldorei have lost their greatest mentor."
    set LEGEND_CENARIUS.DeathSfx = "Objects\\Spawnmodels\\NightElf\\EntBirthTarget\\EntBirthTarget.mdl"

    set LEGEND_MALFURION = Legend.create()
    set LEGEND_MALFURION.UnitType = 'Efur'

    set LEGEND_FANDRAL = Legend.create()
    set LEGEND_FANDRAL.Unit = gg_unit_E00K_2993
  endfunction

endlibrary