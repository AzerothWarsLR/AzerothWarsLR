library QuestFelHordeKillStormwind requires QuestData, FelHordeSetup, QuestItemLegendDead, LegendStormwind

  globals
    private constant integer RESEARCH_ID = 'R05Z'
    private constant integer UNITTYPE_ID = 'n086'
    private constant integer BUILDING_ID = 'o030'
    private constant integer UNIT_LIMIT = 6
  endglobals

  struct QuestFelHordeKillStormwind extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "暴风城的毁灭留下了数千名精锐骑士的尸体。正如兽人们在第二次战争中所做的一样，邪兽人们把被杀死的暗影议会成员们的灵魂塞进了这些尸体内，重现了邪恶的死亡骑士团"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "祭坛内可以召唤泰隆·血魔了并在" + GetObjectName(BUILDING_ID) "内解锁" + I2S(UNIT_LIMIT) + "个" + GetObjectName(UNITTYPE_ID) 
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, RESEARCH_ID, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
      call Holder.ModObjectLimit(UNITTYPE_ID, UNIT_LIMIT)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("先行者们", "在第二次战争期间被杀掉的暗影议会成员的灵魂被注入了暴风城骑士的尸体内，成为了死亡骑士。如果暴风城再次陷落的话，那邪恶的死亡骑士团也可以再次归来。", "ReplaceableTextures\\CommandButtons\\BTNAcolyte.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_STORMWINDKEEP))
      return this
    endmethod
  endstruct

endlibrary