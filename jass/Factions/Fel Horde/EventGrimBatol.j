library EventGrimBatol initializer OnInit requires Persons, Faction, DetermineLevel

  globals
    private group GrimBatolUnits
  endglobals

  private function EnableUnitForPlayer takes unit u, player p returns nothing
    call ShowUnit(u, true)
    call SetUnitInvulnerable(u, false)
    call SetUnitOwner(u, p, true)
  endfunction

  private function EnableWaygate takes unit u returns nothing
    call ShowUnit(u, true)
    call SetUnitInvulnerable(u, true)
    call SetUnitOwner(u, Player(PLAYER_NEUTRAL_PASSIVE), true)
  endfunction

  private function GiveGrimBatol takes player whichPlayer returns nothing
    local unit u
    call DisplayTextToPlayer(whichPlayer, 0, 0, "The Dark Horde has been reformed once more! Zuluhed and the Dragonmaw Clan of Grim Batol have joined with Magtheridon's Fel Horde.")
    loop
      set u = FirstOfGroup(GrimBatolUnits)
      exitwhen u == null
      call EnableUnitForPlayer(u, whichPlayer)
      call GroupRemoveUnit(GrimBatolUnits, u)
    endloop
    call EnableUnitForPlayer(gg_unit_n08A_3097, whichPlayer)  //Neltharauku
    call SetUnitOwner(gg_unit_h01Z_0618, whichPlayer, true)
    call UnitDetermineLevel(gg_unit_O00Y_3094, 1.) //Zuluhed
    call EnableWaygate(gg_unit_n08R_2209) //Grim Batol Tunnels
    call EnableWaygate(gg_unit_n08R_2214) //Grim Batol Tunnels
    call IssueImmediateOrderBJ( gg_unit_o02O_3247, "battlestations" ) //Orc Burrow
    call IssueImmediateOrderBJ( gg_unit_o02O_3248, "battlestations" ) //Orc Burrow
    call DestroyGroup(GrimBatolUnits)
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function Actions takes nothing returns nothing
    local Person triggerPerson = Persons[GetPlayerId(GetOwningPlayer(GetTriggerUnit()))]
    if triggerPerson.faction == FACTION_FEL_HORDE and not IsUnitAliveBJ(gg_unit_nrwm_1981) and not IsUnitAliveBJ(gg_unit_h05H_1847) and not IsUnitAliveBJ(gg_unit_h03Y_0077) then
      call GiveGrimBatol(triggerPerson.p)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    local integer i = 0
    local unit u = null
    call TriggerRegisterEnterRectSimple(trig, gg_rct_Grim_Batol)
    call TriggerAddAction(trig, function Actions)
    set GrimBatolUnits = CreateGroup()
    call GroupEnumUnitsInRect(GrimBatolUnits, gg_rct_Grim_Batol, null)

    loop
      exitwhen i > BlzGroupGetSize(GrimBatolUnits)
      set u = BlzGroupUnitAt(GrimBatolUnits, i)
      if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
        call SetUnitInvulnerable(u, true)
        call ShowUnit(u, false)
        set i = i + 1
      else
        call GroupRemoveUnit(GrimBatolUnits, u)
      endif
    endloop
  endfunction

endlibrary