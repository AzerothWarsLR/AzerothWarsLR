library LegendFrostwolf initializer OnInit requires Legend

  globals
    Legend LEGEND_CAIRNE
    Legend LEGEND_THRALL
    Legend LEGEND_REXXAR

    Legend LEGEND_THUNDERBLUFF
    Legend LEGEND_DARKSPEARHOLD
    Legend LEGEND_ORGRIMMAR
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_CAIRNE = Legend.create()
    set LEGEND_CAIRNE.UnitType = 'Ocbh'
    set LEGEND_CAIRNE.DeathMessage = "凯恩的精神在这个世界上流传了下来。牛头人已经开始崇敬他们逝去的先祖。"
    set LEGEND_CAIRNE.StartingXP = 1000

    set LEGEND_THRALL = Legend.create()
    set LEGEND_THRALL.UnitType = 'Othr'
    set LEGEND_THRALL.Essential = true
  
    set LEGEND_THUNDERBLUFF = Legend.create()
    set LEGEND_THUNDERBLUFF.Unit = gg_unit_o00J_1495
    set LEGEND_THUNDERBLUFF.DeathMessage = "雷霆崖上的牛头人们已经被赶走。血蹄部族失去了家园。"
    set LEGEND_THUNDERBLUFF.IsCapital = true

    set LEGEND_DARKSPEARHOLD = Legend.create()
    set LEGEND_DARKSPEARHOLD.Unit = gg_unit_o02D_0254
    set LEGEND_DARKSPEARHOLD.IsCapital = true

    set LEGEND_REXXAR = Legend.create()
    set LEGEND_REXXAR.UnitType = 'Orex'
    set LEGEND_REXXAR.StartingXP = 1800

    set LEGEND_ORGRIMMAR = Legend.create()
    set LEGEND_ORGRIMMAR.Unit = gg_unit_o01B_0190
    set LEGEND_ORGRIMMAR.DeathMessage = "奥格瑞玛已经被拆除。随着它的毁灭，兽人们在新世界寻找庇护之地的希望和梦想也随之毁灭。"
  endfunction

endlibrary