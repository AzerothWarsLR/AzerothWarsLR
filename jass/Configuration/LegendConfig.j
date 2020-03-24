library LegendConfig initializer OnInit requires Legend

  globals
    Legend LEGEND_KELTHUZAD
    Legend LEGEND_ANUBARAK
    Legend LEGEND_RIVENDARE

    Legend LEGEND_TICHONDRIOUS
    Legend LEGEND_WINTERCHILL
    Legend LEGEND_ARCHIMONDE
    Legend LEGEND_AZGALOR

    Legend LEGEND_MAGTHERIDON
    Legend LEGEND_KARGATH
    Legend LEGEND_ZULUHED
    Legend LEGEND_REND

    Legend LEGEND_ARTHAS
    Legend LEGEND_UTHER
    Legend LEGEND_GARITHOS

    Legend LEGEND_MAGNI
    Legend LEGEND_MURADIN
    Legend LEGEND_DAGRAN
    Legend LEGEND_FALSTAD

    Legend LEGEND_ANTONIDAS
    Legend LEGEND_JAINA
    Legend LEGEND_DAELIN

    Legend LEGEND_SYLVANAS
    Legend LEGEND_ANASTERIAN
    Legend LEGEND_JENALLA
    Legend LEGEND_LORTHEMAR

    Legend LEGEND_THRALL
    Legend LEGEND_VOLJIN
    Legend LEGEND_CAIRNE

    Legend LEGEND_GROM
    Legend LEGEND_ROKHAN
    Legend LEGEND_REXXAR

    Legend LEGEND_TYRANDE
    Legend LEGEND_SHANDRIS
    Legend LEGEND_MAIEV
    Legend LEGEND_ILLIDAN

    Legend LEGEND_VARIAN
    Legend LEGEND_BOLVAR
    Legend LEGEND_GALEN

    Legend LEGEND_CENARIUS
    Legend LEGEND_MALFURION
    Legend LEGEND_FANDRAL
  endglobals

  private function OnInit takes nothing returns nothing
    local unit testUnit = CreateUnit(Player(0), 'hfoo', 0, 0, 0)
    set LEGEND_ILLIDAN = Legend.create()
    set LEGEND_ILLIDAN.Unit = CreateUnit(Player(0), 'Eill', 0, 0, 0)
    call LEGEND_ILLIDAN.AddUnitDependency(testUnit)
    set LEGEND_ILLIDAN.DeathMessage = "Edgy Illidan has died forever."
    set LEGEND_ILLIDAN.DeathSfx = "Objects\\Spawnmodels\\Undead\\UCancelDeath\\UCancelDeath.mdl"
    //set LEGEND_ILLIDAN.UnitType = 'Eevi'
  endfunction

endlibrary