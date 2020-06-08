library LegendAhnqiraj initializer OnInit requires Legend

  globals
    Legend LEGEND_CTHUN
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_CTHUN = Legend.create()
    set LEGEND_CTHUN.UnitType = 'U00R'
    set LEGEND_CTHUN.Hivemind = true
    set LEGEND_CTHUN.PermaDies = true
    set LEGEND_CTHUN.DeathSfx = "Abilities\\Spells\\Undead\\DarkRitual\\DarkRitualTarget.mdl"
    set LEGEND_CTHUN.DeathMessage = "The unfathomable eldritch entity known as C'thun has finally been brought to an end. The Kingdom of Ahn'qiraj is no more. Without a hive mind to control them, C'thun's former minions have dispersed into the deserts of Silithus."
  endfunction

endlibrary