library PlayerConfig initializer OnInit requires Persons, Team, TeamSetup, ScourgeSetup, EmeraldNightmareConfig, IllidariConfig, ScarletCrusadeConfig, IronforgeSetup, KultirasConfig, BloodElvesConfig, FrostwolfSetup, ForsakenConfig, CthunConfig, StormwindSetup, DruidsSetup

  function OnInit takes nothing returns nothing
    local Person p

    set p = Person.create(Player(0))
    set p.Faction = FACTION_SCOURGE          

    set p = Person.create(Player(1))
    set p.Faction = FACTION_EMERALDNIGHTMARE

    set p = Person.create(Player(2))
    set p.Faction = FACTION_ILLIDARI

    set p = Person.create(Player(3))
    set p.Faction = FACTION_SCARLETCRUSADE

    set p = Person.create(Player(4)) 
    set p.Faction = FACTION_IRONFORGE

    set p = Person.create(Player(5))
    set p.Faction = FACTION_KULTIRAS

    set p = Person.create(Player(6))
    set p.Faction = FACTION_BLOODELVES

    set p = Person.create(Player(7))
    set p.Faction = FACTION_FROSTWOLF

    set p = Person.create(Player(8))
    set p.Faction = FACTION_FORSAKEN

    set p = Person.create(Player(9))
    set p.Faction = FACTION_CTHUN

    set p = Person.create(Player(10))
    set p.Faction = FACTION_STORMWIND

    set p = Person.create(Player(11))
    set p.Faction = FACTION_DRUIDS

    call Person.create(Player(14))
    call Person.create(Player(15))
    call Person.create(Player(16))
  endfunction

endlibrary