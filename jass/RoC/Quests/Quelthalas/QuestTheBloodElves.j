//If Quel'thalas destroys the Legion Nexus, they can train Kael'thas and Blood Mages.
//If they instead lose the Sunwell, they lose everything. If that doesn't defeat them, they get Kael'thalas, Lorthemar, and some free units at Dalaran Dungeons.
library QuestTheBloodElves requires QuelthalasSetup, LegendLegion, LegendQuelthalas, Display

  globals
    private constant integer QUEST_RESEARCH_ID = 'R04Q'
    private constant integer UNITTYPE_ID = 'n048'
    private constant integer BUILDING_ID = 'n0A2'
    private constant integer HERO_ID = 'Hkal'
  endglobals

  struct QuestTheBloodElves extends QuestData
    private static group SecondChanceUnits

    private method operator CompletionPopup takes nothing returns string
      return "军团枢纽已经被摧毁。一群雄心勃勃的法师抓住机会学习了恶魔的魔法，成为第一批血法师."
    endmethod

    private method operator FailurePopup takes nothing returns string
      return "太阳井沦陷了。幸存者们逃到了达拉然，并将自己改名为血精灵，以纪念他们倒下的人民。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "在联合议会中可以训练" + GetObjectName(UNITTYPE_ID) + "单位了, 并可以从祭坛中召唤凯尔萨斯王子"
    endmethod

    private method operator FailureDescription takes nothing returns string
      return "你失去了你控制的一切，但你在达拉然地牢获得了凯尔萨斯王子，并在联合议会中可以训练" + GetObjectName(UNITTYPE_ID) + "单位了。"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, QUEST_RESEARCH_ID, 1)
      call DisplayUnitTypeAcquired(Holder.Player, UNITTYPE_ID, "现在你可以在" + GetObjectName(BUILDING_ID) + "中训练" + GetObjectName(UNITTYPE_ID) + "单位了。")
    endmethod

    private method OnFail takes nothing returns nothing
      local unit u
      local player holderPlayer = this.Holder.Person.Player
      local Legend triggerLegend = GetTriggerLegend()
      set LEGEND_KAEL.StartingXP = GetHeroXP(LEGEND_ANASTERIAN.Unit)
      call this.Holder.obliterate()
      if this.Holder.ScoreStatus != SCORESTATUS_DEFEATED then
        loop
          set u = FirstOfGroup(thistype.SecondChanceUnits)
          exitwhen u == null
          call UnitRescue(u, holderPlayer)
          call GroupRemoveUnit(thistype.SecondChanceUnits, u)
        endloop
        call DestroyGroup(thistype.SecondChanceUnits)
        call SetPlayerTechResearched(Holder.Player, QUEST_RESEARCH_ID, 1)
        call LEGEND_KAEL.Spawn(this.Holder.Player, -11410, 21975, 110)
        call UnitAddItem(LEGEND_KAEL.Unit, CreateItem('I00M', GetUnitX(LEGEND_KAEL.Unit), GetUnitY(LEGEND_KAEL.Unit)))
        call UnitAddItem(LEGEND_KAEL.Unit, CreateItem('I000', GetUnitX(LEGEND_KAEL.Unit), GetUnitY(LEGEND_KAEL.Unit)))
        call AdjustPlayerStateBJ( 500, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 2000, this.Holder.Player, PLAYER_STATE_RESOURCE_LUMBER )
        if GetLocalPlayer() == this.Holder.Player then
          call SetCameraPosition(GetRectCenterX(gg_rct_BloodElfSecondChanceSpawn), GetRectCenterY(gg_rct_BloodElfSecondChanceSpawn))
        endif
      endif
      call SetTriggerLegend(triggerLegend)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.ModObjectLimit(QUEST_RESEARCH_ID, UNLIMITED)
      call Holder.ModObjectLimit(UNITTYPE_ID, 6)
      call Holder.ModObjectLimit(HERO_ID, 1)
    endmethod

    private static method onInit takes nothing returns nothing
      //Setup initially invulnerable and hidden group at Dalaran Dungeons
      local group tempGroup = CreateGroup()
      local unit u
      local integer i = 0
      set thistype.SecondChanceUnits = CreateGroup()
      call GroupEnumUnitsInRect(tempGroup, gg_rct_BloodElfSecondChanceSpawn, null)
      loop
        set u = FirstOfGroup(tempGroup)
        exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call ShowUnit(u, false)
          call SetUnitInvulnerable(u, true)
          call GroupAddUnit(thistype.SecondChanceUnits, u)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set i = i + 1
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("血精灵", "奎尔萨拉斯的精灵极度的依赖太阳井的魔法。没有它，他们将不得不求助于更黑暗的魔法来满足自己。", "ReplaceableTextures\\CommandButtons\\BTNHeroBloodElfPrince.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_LICHKING))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_ANASTERIAN, true))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_SUNWELL, true))
      return this
    endmethod
  endstruct

endlibrary