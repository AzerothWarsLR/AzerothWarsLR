
library QuestRagnarosPath requires Persons, IronforgeSetup, GeneralHelpers

  struct QuestRagnarosPath extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "The Ragnaros has finally taken over Blackrock and join the Old Gods in their conquest of Azeroth"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Change your faction to the Ragnaros Fireminions and join the Old Gods"
    endmethod  

    private method RemoveCreeps takes nothing returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      call GroupEnumUnitsInRect(tempGroup, gg_rct_DarkIronPathUnlock, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_AGGRESSIVE) then
          call RemoveUnit(u)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null      
    endmethod  

    private method OnComplete takes nothing returns nothing
      call this.Holder.Leave()
      call this.RemoveCreeps()

      call this.Holder.CopyObjectLevels(FACTION_RAGNAROS)
      set this.Holder.Person.Faction = FACTION_RAGNAROS
      call RescueNeutralUnitsInRect(gg_rct_Shadowforge_City, FACTION_RAGNAROS.Player)
      call RescueNeutralUnitsInRect(gg_rct_DarkIronPathUnlock, FACTION_RAGNAROS.Player)

      if UnitAlive(gg_unit_N00D_1457) then
        call UnitRescue(gg_unit_N00D_1457, FACTION_RAGNAROS.Player)
        set LEGEND_RAGNAROS.UnitType = 'U02K'
        set LEGEND_RAGNAROS.PermaDies = true
        set LEGEND_RAGNAROS.DeathMessage = "The Firelord has finally been defeated and sent back to the Elemental plane."
        call SetUnitState(LEGEND_RAGNAROS.Unit, UNIT_STATE_LIFE, GetUnitState(LEGEND_RAGNAROS.Unit, UNIT_STATE_MAX_LIFE))
        call SetUnitState(LEGEND_RAGNAROS.Unit, UNIT_STATE_MANA, GetUnitState(LEGEND_RAGNAROS.Unit, UNIT_STATE_MAX_MANA))
        call UnitAddItemSafe(LEGEND_RAGNAROS.Unit, ARTIFACT_SULFURAS.item)
      else
        call ReviveHero(LEGEND_RAGNAROS.Unit, GetRectCenterX(gg_rct_DarkIronPathUnlock), GetRectCenterY(gg_rct_DarkIronPathUnlock), true)
        call UnitRescue(gg_unit_N00D_1457, FACTION_RAGNAROS.Player)
        set LEGEND_RAGNAROS.UnitType = 'U02K'
        set LEGEND_RAGNAROS.PermaDies = true
        set LEGEND_RAGNAROS.DeathMessage = "The Firelord has finally been defeated and sent back to the Elemental plane."
      endif

      set this.Holder.Team = TEAM_OLDGOD
      call AdjustPlayerStateBJ( 2000, FACTION_RAGNAROS.Player, PLAYER_STATE_RESOURCE_GOLD )
      call AdjustPlayerStateBJ( 2000, FACTION_RAGNAROS.Player, PLAYER_STATE_RESOURCE_LUMBER )
      call LEGEND_DAGRAN.Spawn(FACTION_RAGNAROS.Player, GetRectCenterX(gg_rct_DagranSpawn), GetRectCenterY(gg_rct_DagranSpawn), 270)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Firelord Awakens", "The Dragonmaw clan is still roaming in the Twilight Highlands.", "ReplaceableTextures\\CommandButtons\\BTNHeroAvatarOfFlame.blp")
      call this.AddQuestItem(QuestItemResearch.create('R08T', 'h048'))
      return this
    endmethod
  endstruct

endlibrary