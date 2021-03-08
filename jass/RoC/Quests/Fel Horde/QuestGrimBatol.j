library QuestGrimBatol requires QuestData, FelHordeConfig, DetermineLevel, LegendIronforge, LegendStormwind

  globals
    private constant integer ZULUHED_ID = 'O00Y'
    private constant integer RESEARCH_ID = 'R069'
  endglobals

  struct QuestGrimBatol extends QuestData
    private static group GrimBatolUnits

    private method operator CompletionPopup takes nothing returns string
      return "Zuluhed the Whacked and his followers join the Fel Horde once more. Near the Black Temple, the great Nether Dragon Neltharaku awakens."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "The demihero Nelrathaku, control of all units at Grim Batol, and you can summon the hero Zuluhed the Whacked from the Altar of Domination"
    endmethod

    private method OnComplete takes nothing returns nothing
      local unit u
      local player holderPlayer = this.Holder.Person.Player
      loop
        set u = FirstOfGroup(thistype.GrimBatolUnits)
        exitwhen u == null
        call UnitRescue(u, holderPlayer)
        call GroupRemoveUnit(thistype.GrimBatolUnits, u)
      endloop
      call UnitRescue(gg_unit_n08A_3097, holderPlayer)  //Neltharauku
      call SetUnitOwner(gg_unit_h01Z_0618, holderPlayer, true)
      call EnableWaygate(gg_unit_n08R_2209) //Grim Batol Tunnels
      call EnableWaygate(gg_unit_n08R_2214) //Grim Batol Tunnels
      call IssueImmediateOrderBJ( gg_unit_ocbw_3168, "battlestations" ) //Orc Burrow
      call IssueImmediateOrderBJ( gg_unit_ocbw_3166, "battlestations" ) //Orc Burrow
      call SetPlayerTechResearched(FACTION_FEL_HORDE.Player, RESEARCH_ID, 1)
      call DestroyGroup(thistype.GrimBatolUnits)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.modObjectLimit(RESEARCH_ID, UNLIMITED)
      call Holder.modObjectLimit(ZULUHED_ID, 1)
    endmethod

    private static method EnableWaygate takes unit u returns nothing
      call ShowUnit(u, true)
      call SetUnitInvulnerable(u, true)
      call SetUnitOwner(u, Player(PLAYER_NEUTRAL_PASSIVE), true)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Recruit the Dragonmaw Clan", "The Dragonmaw Clan are old allies of the Fel Horde. With an adequate show of strength, they could be recruited to Magtheridon's cause once more.", "ReplaceableTextures\\CommandButtons\\BTNBlackDragon.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_THELSAMAR))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_DARKSHIRE))
      call this.AddQuestItem(QuestItemAnyUnitInRect.create(gg_rct_Grim_Batol, "Grim Batol", true))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      //Setup initially invulnerable and hidden group at Grim Batol
      local group tempGroup = CreateGroup()
      local unit u
      local integer i = 0
      call ShowUnit(gg_unit_n08A_3097, false)
      set thistype.GrimBatolUnits = CreateGroup()
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Grim_Batol, null)
      loop
        set u = FirstOfGroup(tempGroup)
        exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call SetUnitInvulnerable(u, true)
          call GroupAddUnit(thistype.GrimBatolUnits, u)
          if IsUnitType(u, UNIT_TYPE_STRUCTURE) == false then
            call ShowUnit(u, false)
          endif
        endif
        call GroupRemoveUnit(tempGroup, u)
        set i = i + 1
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null
    endmethod
  endstruct

endlibrary