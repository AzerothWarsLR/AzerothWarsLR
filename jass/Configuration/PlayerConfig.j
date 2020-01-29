library PlayerConfig initializer OnInit requires Persons, Team, TeamConfig, ScourgeConfig, LegionConfig, FelHordeConfig, LordaeronConfig, IronforgeConfig, DalaranConfig, QuelthalasConfig, FrostwolfConfig, WarsongConfig, SentinelsConfig, StormwindConfig, DruidsConfig

  function OnInit takes nothing returns nothing
    local Person p

    set p = Person.create(Player(0))
    call p.setFaction(FACTION_SCOURGE)           
    call p.setTeam(TEAM_SCOURGE)

    set p = Person.create(Player(1))
    call p.setFaction(FACTION_LEGION)    
    call p.setTeam(TEAM_SCOURGE)

    set p = Person.create(Player(2))
    call p.setFaction(FACTION_FEL_HORDE)          
    call p.setTeam(TEAM_FEL_HORDE)

    set p = Person.create(Player(3))
    call p.setFaction(FACTION_LORDAERON)            
    call p.setTeam(TEAM_NORTH_ALLIANCE)

    set p = Person.create(Player(4)) 
    call p.setFaction(FACTION_IRONFORGE)         
    call p.setTeam(TEAM_SOUTH_ALLIANCE)

    set p = Person.create(Player(5))
    call p.setFaction(FACTION_DALARAN)          
    call p.setTeam(TEAM_NORTH_ALLIANCE)

    set p = Person.create(Player(6))
    call p.setFaction(FACTION_QUELTHALAS)          
    call p.setTeam(TEAM_NORTH_ALLIANCE)

    set p = Person.create(Player(7))
    call p.setFaction(FACTION_FROSTWOLF)         
    call p.setTeam(TEAM_HORDE)

    set p = Person.create(Player(8))
    call p.setFaction(FACTION_WARSONG)          
    call p.setTeam(TEAM_HORDE)

    set p = Person.create(Player(9))
    call p.setFaction(FACTION_SENTINELS)          
    call p.setTeam(TEAM_NIGHT_ELVES)

    set p = Person.create(Player(10))
    call p.setFaction(FACTION_STORMWIND)        
    call p.setTeam(TEAM_SOUTH_ALLIANCE)

    set p = Person.create(Player(11))
    call p.setFaction(FACTION_DRUIDS)
    call p.setTeam(TEAM_NIGHT_ELVES)

    call Person.create(Player(12))
    call Person.create(Player(13))
    call Person.create(Player(14))
  endfunction

endlibrary