library LegendNaga initializer OnInit requires Legend

  globals
    Legend LEGEND_ILLIDAN
    Legend LEGEND_VASHJ
    Legend LEGEND_NAJENTUS
    
    Legend LEGEND_OBELISK
    Legend LEGEND_NAZJATAR
    Legend LEGEND_VAULT
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_ILLIDAN = Legend.create()
    set LEGEND_ILLIDAN.Unit = gg_unit_Eill_0748

    set LEGEND_VASHJ = Legend.create()
    set LEGEND_VASHJ.Unit = gg_unit_Hvsh_2740

    set LEGEND_NAJENTUS = Legend.create()
    set LEGEND_NAJENTUS.Unit = gg_unit_U00S_2743

    set LEGEND_OBELISK = Legend.create()
    set LEGEND_OBELISK.Unit = gg_unit_nico_3620
    set LEGEND_OBELISK.IsCapital = true

    set LEGEND_NAZJATAR = Legend.create()
    set LEGEND_NAZJATAR.Unit = gg_unit_n045_3377
    set LEGEND_NAZJATAR.DeathMessage = "The Temple of Azshara has fallen."
    set LEGEND_NAZJATAR.IsCapital = true
    set LEGEND_NAZJATAR.Hivemind = true

    set LEGEND_VAULT = Legend.create()
    set LEGEND_VAULT.Unit = gg_unit_n05A_2845
    set LEGEND_VAULT.DeathMessage = "The vault under the Aetheneum has been lost forever"
    set LEGEND_VAULT.IsCapital = true
  endfunction

endlibrary