library QuestGrimBatol initializer OnInit requires QuestData, FelHordeConfig, DetermineLevel

  globals
    private QuestData QUEST_GRIMBATOL
    private QuestItemData QUESTITEM_GRIMBATOL_THELSAMAR
    private QuestItemData QUESTITEM_GRIMBATOL_DARKSHIRE
    private QuestItemData QUESTITEM_GRIMBATOL_VISIT

    private constant integer RESEARCH_ID = 'R069'

    private group GrimBatolUnits
  endglobals

  private function EnableWaygate takes unit u returns nothing
    call ShowUnit(u, true)
    call SetUnitInvulnerable(u, true)
    call SetUnitOwner(u, Player(PLAYER_NEUTRAL_PASSIVE), true)
  endfunction

  private function GiveGrimBatol takes player whichPlayer returns nothing
    local unit u
    loop
      set u = FirstOfGroup(GrimBatolUnits)
      exitwhen u == null
      call UnitRescue(u, whichPlayer)
      call GroupRemoveUnit(GrimBatolUnits, u)
    endloop
    call UnitRescue(gg_unit_n08A_3097, whichPlayer)  //Neltharauku
    call SetUnitOwner(gg_unit_h01Z_0618, whichPlayer, true)
    call UnitDetermineLevel(gg_unit_O00Y_3094, 1.) //Zuluhed
    call EnableWaygate(gg_unit_n08R_2209) //Grim Batol Tunnels
    call EnableWaygate(gg_unit_n08R_2214) //Grim Batol Tunnels
    call IssueImmediateOrderBJ( gg_unit_o02O_3247, "battlestations" ) //Orc Burrow
    call IssueImmediateOrderBJ( gg_unit_o02O_3248, "battlestations" ) //Orc Burrow
    call FACTION_FEL_HORDE.setQuestItemProgress(QUESTITEM_GRIMBATOL_VISIT, QUEST_PROGRESS_COMPLETE, true)
    call SetPlayerTechResearched(FACTION_FEL_HORDE.Player, RESEARCH_ID, 1)
    call DestroyGroup(GrimBatolUnits)
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function EntersRegion takes nothing returns nothing
    if GetOwningPlayer(GetTriggerUnit()) == FACTION_FEL_HORDE.Player and not IsUnitAliveBJ(gg_unit_nrwm_1981) and not IsUnitAliveBJ(gg_unit_h05H_1847) and not IsUnitAliveBJ(gg_unit_h03Y_0077) then
      call GiveGrimBatol(FACTION_FEL_HORDE.Player)
    endif
  endfunction

  private function ThelsamarDies takes nothing returns nothing
    call FACTION_FEL_HORDE.setQuestItemProgress(QUESTITEM_GRIMBATOL_THELSAMAR, QUEST_PROGRESS_COMPLETE, true)
  endfunction

  private function DarkshireDies takes nothing returns nothing
    call FACTION_FEL_HORDE.setQuestItemProgress(QUESTITEM_GRIMBATOL_DARKSHIRE, QUEST_PROGRESS_COMPLETE, true)
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig
    local integer i = 0
    local unit u = null
    local group tempGroup = CreateGroup()

    set trig = CreateTrigger()
    call TriggerRegisterEnterRectSimple(trig, gg_rct_Grim_Batol)
    call TriggerAddAction(trig, function EntersRegion)

    //Setup initially invulnerable and hidden group at Grim Batol
    set GrimBatolUnits = CreateGroup()
    call GroupEnumUnitsInRect(tempGroup, gg_rct_Grim_Batol, null)
    loop
      set u = FirstOfGroup(tempGroup)
      exitwhen u == null
      if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
        call SetUnitInvulnerable(u, true)
        call GroupAddUnit(GrimBatolUnits, u)
        if IsUnitType(u, UNIT_TYPE_STRUCTURE) == false then
          call ShowUnit(u, false)
        endif
      endif
      call GroupRemoveUnit(tempGroup, u)
      set i = i + 1
    endloop
    call DestroyGroup(tempGroup)
    set tempGroup = null

    //Capital death setup
    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, gg_unit_h05H_1847, EVENT_UNIT_DEATH )  //Thelsamar
    call TriggerAddAction(trig, function ThelsamarDies)

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, gg_unit_h03Y_0077, EVENT_UNIT_DEATH )  //Darkshire
    call TriggerAddAction(trig, function DarkshireDies)

    //Quest setup
    set QUEST_GRIMBATOL = QuestData.create("Recruit the Dragonmaw Clan", "The Dragonmaw Clan are old allies of the Fel Horde. With an adequate show of strength, they could be recruited to Magtheridon's cause once more.", "Zuluhed the Whacked and his followers join the Fel Horde once more. Near the Black Temple, the great Nether Dragon Neltharaku awakens.", "ReplaceableTextures\\CommandButtons\\BTNBlackDragon.blp")
    set QUESTITEM_GRIMBATOL_THELSAMAR = QUEST_GRIMBATOL.addItem("Destroy Thalsamar")
    set QUESTITEM_GRIMBATOL_DARKSHIRE = QUEST_GRIMBATOL.addItem("Destroy Darkshire")
    set QUESTITEM_GRIMBATOL_VISIT = QUEST_GRIMBATOL.addItem("Bring a unit to Grim Batol")
    call FACTION_FEL_HORDE.addQuest(QUEST_GRIMBATOL)
    set FACTION_FEL_HORDE.StartingQuest = QUEST_GRIMBATOL
  endfunction

endlibrary