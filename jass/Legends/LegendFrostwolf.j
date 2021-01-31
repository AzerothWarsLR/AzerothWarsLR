library LegendFrostwolf initializer OnInit requires Legend

  globals
    Legend LEGEND_CAIRNE
    Legend LEGEND_GAZLOWE
    Legend LEGEND_THRALL

    Legend LEGEND_THUNDERBLUFF
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_CAIRNE = Legend.create()
    set LEGEND_CAIRNE.Unit = gg_unit_Ocbh_1163
    call LEGEND_CAIRNE.AddUnitDependency(gg_unit_o00J_1495)
    set LEGEND_CAIRNE.DeathMessage = "Cairne's spirit has passed on from this world. The Tauren have already begun to revere their fallen ancestor."
  
    set LEGEND_GAZLOWE = Legend.create()
    set LEGEND_GAZLOWE.UnitType = 'Ntin'

    set LEGEND_THRALL = Legend.create()
    set LEGEND_THRALL.Unit = gg_unit_Othr_1598
  
    set LEGEND_THUNDERBLUFF = Legend.create()
    set LEGEND_THUNDERBLUFF.Unit = gg_unit_o00J_1495
    set LEGEND_THUNDERBLUFF.DeathMessage = "The mesas of Thunderbluff have been swept clean of the Tauren. The Bloodhoof are without a home."
  endfunction

endlibrary