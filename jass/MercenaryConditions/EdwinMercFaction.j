library EdwinMercFaction requires MercFaction

struct EdwinMercFaction extends MercFaction

  method DetermineLiege takes nothing returns LiegeFaction
    if QUEST_UNDERCITY.Progress == QUEST_PROGRESS_COMPLETE then
       return FACTION_FORSAKEN
    endif
    
    if QUEST_MONASTERY.Progress == QUEST_PROGRESS_COMPLETE then
      return FACTION_SCARLET
    endif
    
    if FACTION_STORMWIND.ScoreStatus == SCORESTATUS_DEFEATED and FACTION_LORDAERON.ScoreStatus != SCORESTATUS_DEFEATED then
      return FACTION_LORDAERON
    endif

    if FACTION_LORDAERON.ScoreStatus == SCORESTATUS_DEFEATED and FACTION_DALARAN.ScoreStatus != SCORESTATUS_DEFEATED then
      return FACTION_DALARAN
    endif

    if FACTION_DALARAN.ScoreStatus == SCORESTATUS_DEFEATED and FACTION_STORMWIND.ScoreStatus != SCORESTATUS_DEFEATED then
      return FACTION_STORMWIND
    endif

    return 0
  endmethod



endstruct


endlibrary