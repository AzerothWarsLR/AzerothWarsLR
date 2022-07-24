library LegendScourge initializer OnInit requires Legend

  globals
    Legend LEGEND_KELTHUZAD
    Legend LEGEND_ANUBARAK
    Legend LEGEND_RIVENDARE
    Legend LEGEND_LICHKING
    Legend LEGEND_UTGARDE
    Legend LEGEND_SAPPHIRON

    constant integer UNITTYPE_KELTHUZAD_NECROMANCER = 'U001'
    constant integer UNITTYPE_KELTHUZAD_GHOST = 'U00M'
    constant integer UNITTYPE_KELTHUZAD_LICH = 'Uktl'
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_KELTHUZAD = Legend.create()
    set LEGEND_KELTHUZAD.UnitType = 'U001'
    set LEGEND_KELTHUZAD.PermaDies = true
    set LEGEND_KELTHUZAD.DeathMessage = "克尔苏加德被杀了。他将以灵魂形态继续存在，如果将他带到太阳井的话也许能将他复生。"
    set LEGEND_KELTHUZAD.DeathSfx = "Abilities\\Spells\\Undead\\DeathCoil\\DeathCoilSpecialArt.mdl"
    set LEGEND_KELTHUZAD.Essential = true
    set LEGEND_KELTHUZAD.StartingXP = 1000
    set LEGEND_KELTHUZAD.Name = "克尔苏加德"

    set LEGEND_ANUBARAK = Legend.create()
    set LEGEND_ANUBARAK.UnitType = 'Uanb'

    set LEGEND_RIVENDARE = Legend.create()
    set LEGEND_RIVENDARE.UnitType = 'U00A'
    set LEGEND_RIVENDARE.StartingXP = 1000

    set LEGEND_UTGARDE = Legend.create()
    set LEGEND_UTGARDE.Unit = gg_unit_h00O_2516
    set LEGEND_UTGARDE.Capturable = true

    set LEGEND_SAPPHIRON = Legend.create()
    set LEGEND_SAPPHIRON.Unit = gg_unit_ubdr_0668

    set LEGEND_LICHKING = Legend.create()
    set LEGEND_LICHKING.Unit = gg_unit_u000_0649
    set LEGEND_LICHKING.Hivemind = true
    set LEGEND_LICHKING.DeathMessage = "伟大的巫妖王已经被消灭。亡灵们因为失去了主人而再次变成无脑的怪物。"
endfunction

endlibrary