library InvasionOfKalimdor initializer OnInit requires Duel, FrostwolfConfig, WarsongConfig, SentinelsConfig, DruidsConfig, LegendFrostwolf, LegendWarsong, LegendSentinels, LegendDruids

  globals
    Duel DUEL_KALIMDOR
  endglobals

  private function OnInit takes nothing returns nothing
    local Belligerent nightElves = Belligerent.create()
    local Belligerent horde = Belligerent.create()

    call nightElves.addFaction(FACTION_SENTINELS)
    call nightElves.addFaction(FACTION_DRUIDS)
    call nightElves.addCapital(LEGEND_NORDRASSIL.Unit)
    call nightElves.addCapital(LEGEND_FEATHERMOON.Unit)
    call nightElves.addCapital(LEGEND_AUBERDINE.Unit)

    call horde.addFaction(FACTION_FROSTWOLF)
    call horde.addFaction(FACTION_WARSONG)
    call horde.addCapital(LEGEND_ORGRIMMAR.Unit)
    call horde.addCapital(LEGEND_THUNDERBLUFF.Unit)
    call horde.addCapital(LEGEND_STONEMAUL.Unit)
    call horde.addCapital(LEGEND_ENCAMPMENT.Unit)

    set DUEL_KALIMDOR = Duel.create("Invasion of Kalimdor", "The Last Guardian urged Warchief Thrall to take his people west to the lands of Kalimdor. Upon arrival, the Orcs found that they were not alone. Now they face the savage fury of the Night Elves.", "ReplaceableTextures\\CommandButtons\\BTNRazorback.blp")
    call DUEL_KALIMDOR.addBelligerent(nightElves)
    call DUEL_KALIMDOR.addBelligerent(horde)
  endfunction

endlibrary