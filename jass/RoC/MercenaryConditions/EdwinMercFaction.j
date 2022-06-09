library EdwinMercFaction requires MercFaction

struct EdwinMercFaction extends MercFaction

  method DetermineLiege takes nothing returns LiegeFaction
    return FACTION_SCOURGE
  endmethod



endstruct


endlibrary