//Takes away all of Scourge's heroes then gives them back in a particular order to adjust function key selections.

library SortScourgeLegends initializer OnInit requires LegendScourge

  globals
    private group ScourgeLegends
  endglobals

  private function In takes unit whichUnit returns nothing
    if GetOwningPlayer(whichUnit) == FACTION_SCOURGE.Person.p then
      call SetUnitOwner(whichUnit, Player(PLAYER_NEUTRAL_PASSIVE), false)
      call GroupAddUnit(ScourgeLegends, whichUnit)
    endif
  endfunction

  private function Out takes unit whichUnit returns nothing
    if IsUnitInGroup(whichUnit, ScourgeLegends) then
      call SetUnitOwner(whichUnit, FACTION_SCOURGE.Person.p, false)
      call GroupRemoveUnit(ScourgeLegends, whichUnit)
    endif
  endfunction

  function SortScourgeLegends takes nothing returns nothing
    local group tempGroup = CreateGroup()

    call In(LEGEND_ANUBARAK.Unit)
    call In(LEGEND_KELTHUZAD.Unit)
    call In(LEGEND_RIVENDARE.Unit)
    call In(LEGEND_ARTHAS.Unit)

    call Out(LEGEND_ANUBARAK.Unit)
    call Out(LEGEND_KELTHUZAD.Unit)
    call Out(LEGEND_RIVENDARE.Unit)
    call Out(LEGEND_ARTHAS.Unit)
  endfunction

  private function OnInit takes nothing returns nothing
    set ScourgeLegends = CreateGroup()
  endfunction

endlibrary