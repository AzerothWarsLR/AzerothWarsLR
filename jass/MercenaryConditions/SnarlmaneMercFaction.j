library SnarlmaneMercFaction requires MercFaction

struct SnarlmaneMercFaction extends MercFaction

  method DetermineLiege takes nothing returns LiegeFaction
    if QUEST_UNDERCITY.Progress == QUEST_PROGRESS_COMPLETE then
       return FACTION_FORSAKEN
    endif
    
    if FACTION_TROLL.ScoreStatus != SCORESTATUS_DEFEATED then
      return FACTION_TROLL
    endif

    if FACTION_TWILIGHT.ScoreStatus != SCORESTATUS_DEFEATED then
      return FACTION_TWILIGHT
    endif

    if FACTION_GOBLIN.ScoreStatus != SCORESTATUS_DEFEATED then
      return FACTION_GOBLIN
    endif

    if FACTION_WARSONG.ScoreStatus != SCORESTATUS_DEFEATED then
      return FACTION_WARSONG
    endif

    if FACTION_FROSTWOLF.ScoreStatus != SCORESTATUS_DEFEATED then
      return FACTION_FROSTWOLF
    endif

    if FACTION_DRAGONMAW.ScoreStatus != SCORESTATUS_DEFEATED then
      return FACTION_DRAGONMAW
    endif

    return 0
  endmethod



endstruct


endlibrary