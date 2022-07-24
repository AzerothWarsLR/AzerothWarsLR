//Frostwolf kills the Sea Witch. Thrall gets some boats to leave the Darkspear Isles.
//Presently this ONLY deals with the final component of the event. The rest is done in GUI. 
library QuestSeaWitch requires FrostwolfSetup, LegendNeutral, Display, QuestItemLegendDead

  globals
    private weathereffect Storm
    private constant integer QUEST_RESEARCH_ID = 'R05H' 
  endglobals

  struct QuestSeaWitch extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "海巫扎尔吉拉已死，萨尔和沃金可以启航了"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得暗矛岛上的所有单位和建筑并将萨尔传送到海岸边。"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_EchoUnlock, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      local Person killingPerson = Person.ByHandle(GetOwningPlayer(GetKillingUnit()))
      local group tempGroup = CreateGroup()
      local unit u
      //Transfer control of all passive units on island and teleport all Frostwolf units to shore
      call RescueNeutralUnitsInRect(gg_rct_CairneStart, this.Holder.Player)
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Darkspear_Island, null)
      loop
        set u = FirstOfGroup(tempGroup)
        exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, this.Holder.Player)
        endif
        if GetOwningPlayer(u) == FACTION_FROSTWOLF.Player and IsUnitType(u, UNIT_TYPE_STRUCTURE) == false then
          call SetUnitPosition(u, GetRandomReal(GetRectMinX(gg_rct_ThrallLanding), GetRectMaxX(gg_rct_ThrallLanding)), GetRandomReal(GetRectMinY(gg_rct_ThrallLanding), GetRectMaxY(gg_rct_ThrallLanding)))
        endif
        call GroupRemoveUnit(tempGroup, u)
      endloop
      call DestroyGroup(tempGroup)
      call RemoveWeatherEffectBJ(Storm)
      call CreateUnits(this.Holder.Player, 'opeo', -1818, -2070, 270, 3)
      call RescueNeutralUnitsInRect(gg_rct_EchoUnlock, this.Holder.Player)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("风暴中的乘客", "大酋长萨尔和他的部队搁浅在了暗矛群岛上。杀死那里的海巫来获得一个重建舰队并逃跑的机会。", "ReplaceableTextures\\CommandButtons\\BTNGhost.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_SEAWITCH))
      call this.AddQuestItem(QuestItemExpire.create(600))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      set Storm = AddWeatherEffect(gg_rct_Darkspear_Island, 'RAhr')
      call EnableWeatherEffect(Storm, true)
    endmethod
  endstruct

endlibrary