library HeroLimit initializer OnInit requires AIDS, Environment, GeneralHelpers

  globals
    private integer array HeroCountPerPlayer[MAX_PLAYERS]
    private integer RESEARCH_BELOWLIMIT = 'R009'
    private integer RESEARCH_ATLIMIT = 'R04H'
    private integer HERO_LIMIT = 4
  endglobals

  function GetHeroCount takes player whichPlayer returns integer
    return HeroCountPerPlayer[GetPlayerId(whichPlayer)]
  endfunction

  function GetHeroLimit takes player whichPlayer returns integer
    return HERO_LIMIT
  endfunction

  private function ModHeroCount takes player whichPlayer, integer mod returns nothing
    local integer id = GetPlayerId(whichPlayer)
    if whichPlayer == null then
      call BJDebugMsg("ERROR: Function ModHeroCount parameter whichPlayer cannot be null")
      return
    endif
    set HeroCountPerPlayer[id] = HeroCountPerPlayer[id] + mod
    if HeroCountPerPlayer[id] < HERO_LIMIT then
      call SetPlayerTechResearched(whichPlayer, RESEARCH_BELOWLIMIT, 1)
      call SetPlayerTechResearched(whichPlayer, RESEARCH_ATLIMIT, 0)
    else
      call SetPlayerTechResearched(whichPlayer, RESEARCH_BELOWLIMIT, 0)
      call SetPlayerTechResearched(whichPlayer, RESEARCH_ATLIMIT, 1)
    endif
  endfunction

  private struct Hero extends array
    public player owner //This is here because we can't get the unit's owner after it's been removed

    //! runtextmacro AIDS()
    private method AIDS_onCreate takes nothing returns nothing
      set this.owner = GetOwningPlayer(this.unit)
      call ModHeroCount(this.owner, 1)
    endmethod

    private method AIDS_onDestroy takes nothing returns nothing
      call ModHeroCount(this.owner, -1)
    endmethod

    private static method AIDS_filter takes unit u returns boolean
      if IsHeroUnitId(GetUnitTypeId(u)) then
        return true
      endif
      return false
    endmethod
  endstruct

  private function OnAnyUnitChangedOwner takes nothing returns nothing
    local Hero hero
    if IsHeroUnitId(GetUnitTypeId(GetTriggerUnit())) then
      set hero = GetUnitIndex(GetTriggerUnit())
      if hero != 0 then
        call ModHeroCount(hero.owner, -1)
        set hero.owner = GetOwningPlayer(GetTriggerUnit())
        call ModHeroCount(hero.owner, 1)
      endif
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local integer i = 0
    call PlayerUnitEventAddAction(EVENT_PLAYER_UNIT_CHANGE_OWNER, function OnAnyUnitChangedOwner)
    
    loop
      exitwhen i == MAX_PLAYERS
      call SetPlayerTechMaxAllowed(Player(i), RESEARCH_BELOWLIMIT, 200)
      call SetPlayerTechMaxAllowed(Player(i), RESEARCH_ATLIMIT, 200)
      set i = i + 1
    endloop
  endfunction

endlibrary