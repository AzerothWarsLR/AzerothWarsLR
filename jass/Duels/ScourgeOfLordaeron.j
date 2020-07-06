library ScourgeOfLordaeron initializer OnInit requires Duel, ScourgeConfig, LegionConfig, LordaeronConfig, DalaranConfig, QuelthalasConfig, LegendScourge, LegendLegion, LegendLordaeron, LegendDalaran, LegendQuelthalas

  globals
    Duel DUEL_NORTHALLIANCE
  endglobals

  private function OnInit takes nothing returns nothing
    local Belligerent scourge = Belligerent.create()
    local Belligerent northAlliance = Belligerent.create()

    call scourge.addFaction(FACTION_SCOURGE)
    call scourge.addFaction(FACTION_LEGION)
    call scourge.addCapital(LEGEND_LICHKING.Unit)
    call scourge.addCapital(LEGEND_LEGIONNEXUS.Unit)

    call northAlliance.addFaction(FACTION_LORDAERON)
    call northAlliance.addFaction(FACTION_DALARAN)
    call northAlliance.addFaction(FACTION_QUELTHALAS)
    call northAlliance.addCapital(LEGEND_CAPITALPALACE.Unit)
    call northAlliance.addCapital(LEGEND_STRATHOLME.Unit)
    call northAlliance.addCapital(LEGEND_TYRSHAND.Unit)
    call northAlliance.addCapital(LEGEND_DALARAN.Unit)
    call northAlliance.addCapital(LEGEND_SUNWELL.Unit)

    set DUEL_NORTHALLIANCE = Duel.create("Scourge of Lordaeron", "The Dreadlords conspired with the Cult of the Damned to unleash a devastating plague across Lordaeron. The Scourge is primed to wipe away what remains in the ashes, and only the North Alliance can stand against it.", "ReplaceableTextures\\CommandButtons\\BTNGhoul.blp")
    call DUEL_NORTHALLIANCE.addBelligerent(scourge)
    call DUEL_NORTHALLIANCE.addBelligerent(northAlliance)
  endfunction

endlibrary