library LegendFrostwolf initializer OnInit requires Legend

  globals
    Legend LEGEND_CAIRNE
    Legend LEGEND_GAZLOWE
    Legend LEGEND_THRALL
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_CAIRNE = Legend.create()
    set LEGEND_CAIRNE.Unit = gg_unit_Ocbh_1163
    call LEGEND_CAIRNE.AddUnitDependency(gg_unit_o00J_1495)
    set LEGEND_CAIRNE.DeathMessage = "Cairne's spirit has passed on from this world. The Tauren have already begun to revere their fallen ancestor."
  
    set LEGEND_GAZLOWE = Legend.create()

    set LEGEND_THRALL = Legend.create()
  endfunction

endlibrary