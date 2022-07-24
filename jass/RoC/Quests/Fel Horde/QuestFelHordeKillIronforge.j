library QuestFelHordeKillIronforge requires QuestData, FelHordeSetup, QuestItemLegendDead, LegendIronforge

  globals
    private constant integer RESEARCH_ID = 'R011'
    private constant integer UNITTYPE_ID = 'nina'
    private constant integer BUILDING_ID = 'o030'
    private constant integer UNIT_LIMIT = 4
  endglobals

  struct QuestFelHordeKillIronforge extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "大熔炉已被摧毁。邪兽人的苦工们立即抢下了其完整的精炼厂并将其投入到制造魔钢之中"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "在" + GetObjectName(BUILDING_ID) + "内解锁" + I2S(UNIT_LIMIT) + GetObjectName(UNITTYPE_ID) + "并获得魔钢板甲"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, RESEARCH_ID, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
      call Holder.ModObjectLimit(UNITTYPE_ID, UNIT_LIMIT)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("魔钢精炼", "铁炉堡的铁匠们精通于制造物品和战争机器，而在被邪兽人俘虏后他们被奴役去冶炼和精炼最强的金属，魔钢", "ReplaceableTextures\\CommandButtons\\BTNInfernalFlameCannon.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_GREATFORGE))
      return this
    endmethod
  endstruct

endlibrary