library MmmrrrggglllMercFaction requires MercFaction

struct MmmrrrggglllMercFaction extends MercFaction

  method DetermineLiege takes nothing returns LiegeFaction

    if QUEST_UNDERCITY.Progress == QUEST_PROGRESS_COMPLETE then
       return FACTION_FORSAKEN
    endif

    if EXILE_PATH.Progress == QUEST_PROGRESS_COMPLETE then
       return FACTION_NAGA
    endif

    if QUEST_NEXUS.Progress == QUEST_PROGRESS_COMPLETE then
       return FACTION_DALARAN
    endif

     if QUEST_CIVILWAR.Progress == QUEST_PROGRESS_COMPLETE then
       return FACTION_SCOURGE
    endif

    if FACTION_NZOTH.ScoreStatus != SCORESTATUS_DEFEATED then
      return FACTION_NZOTH
    endif
    
    if FACTION_TWILIGHT.ScoreStatus != SCORESTATUS_DEFEATED then
      return FACTION_TWILIGHT
    endif

    if FACTION_BLACKEMPIRE.ScoreStatus != SCORESTATUS_DEFEATED then
      return FACTION_BLACKEMPIRE
    endif

    if FACTION_CTHUN.ScoreStatus != SCORESTATUS_DEFEATED then
      return FACTION_CTHUN
    endif

    return 0
  endmethod



endstruct


endlibrary