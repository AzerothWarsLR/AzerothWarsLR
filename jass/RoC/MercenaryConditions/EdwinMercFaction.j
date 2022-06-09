library EdwinMercFaction requires MercFaction

struct EdwinMercFaction extends MercFaction

  method DetermineLiege takes nothing returns LiegeFaction
    if FACTION_FORSKAEN.GetQuestProgress(QUEST_UNDERCITY) == QUEST_PROGRESS_COMPLETE then
       return FACTION_FORSAKEN
    else
    
    if FACTION_SCARLET.GetQuestProgress(QUEST_MONASTERY) == QUEST_PROGRESS_COMPLETE then
      return FACTION_SCARLET
    else
    
    if FACTION_STORMWIND.ScoreStatus == SCORESTATUS_DEFEATED then
      return FACTION_LORDAERON
    else

    return 0
  endmethod



endstruct


endlibrary