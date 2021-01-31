library QuestDarkIron initializer OnInit requires QuestItemKillUnit, IronforgeConfig, LegendNeutral

  struct QuestDarkIron extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Ragnaros has been slain. The Dark Iron are free."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "You gain control of Shadowforge City and the hero Dagran Thaurassian"
    endmethod

    private method OnComplete takes nothing returns nothing
      local group tempGroup = CreateGroup()
      local unit u
      call LEGEND_DAGRAN.Spawn(this.Holder.Player, GetRectCenterX(gg_rct_DagranSpawn), GetRectCenterY(gg_rct_DagranSpawn), 44)
      call UnitDetermineLevel(LEGEND_DAGRAN.Unit, 1.00)             
      //Transfer all Neutral Passive units in region to Ironforge
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Shadowforge_City, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, this.Holder.Player)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Dark Iron Alliance", "The Dark Iron dwarves serve Ragnaros within Blackrock Mountain. Slay the elemental lord to free them from their servitude.", "ReplaceableTextures\\CommandButtons\\BTNRPGDarkIron.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(LEGEND_RAGNAROS.Unit))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_IRONFORGE.AddQuest(QuestDarkIron.create())
  endfunction

endlibrary