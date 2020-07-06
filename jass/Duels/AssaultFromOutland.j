library AssaultFromOutland initializer OnInit requires Duel, FelHordeConfig, StormwindConfig, IronforgeConfig, LegendFelHorde, LegendStormwind, LegendIronforge

  globals
    Duel DUEL_SOUTHALLIANCE
  endglobals

  private function OnInit takes nothing returns nothing
    local Belligerent felHorde = Belligerent.create()
    local Belligerent southAlliance = Belligerent.create()

    call felHorde.addFaction(FACTION_FEL_HORDE)
    call felHorde.addCapital(LEGEND_BLACKTEMPLE.Unit)
    call felHorde.addCapital(LEGEND_HELLFIRECITADEL.Unit)

    call southAlliance.addFaction(FACTION_LORDAERON)
    call southAlliance.addFaction(FACTION_DALARAN)
    call southAlliance.addFaction(FACTION_QUELTHALAS)
    call southAlliance.addCapital(LEGEND_STORMWINDKEEP.Unit)
    call southAlliance.addCapital(LEGEND_GREATFORGE.Unit)

    set DUEL_SOUTHALLIANCE = Duel.create("Assault From Outland", "The Dark Portal has opened once again. From it pours a renewed Fel Horde, this time led by the Pit Lord Magtheridon. The great kingdoms of Stormwind and Ironforge are the first vanguard against this threat.", "ReplaceableTextures\\CommandButtons\\BTNHeroPitLord.blp")
    call DUEL_SOUTHALLIANCE.addBelligerent(felHorde)
    call DUEL_SOUTHALLIANCE.addBelligerent(southAlliance)
  endfunction

endlibrary