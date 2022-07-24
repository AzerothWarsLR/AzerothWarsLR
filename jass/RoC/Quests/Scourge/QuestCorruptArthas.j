library QuestCorruptArthas requires GeneralHelpers, LegendLordaeron, LordaeronSetup, QuestItemLegendDead, QuestItemEitherOf, QuestItemFactionDefeated

  globals
    private constant integer HERO_ID = 'Uear'
    private constant integer RESEARCH_ID = 'R01K'
  endglobals

  struct QuestCorruptArthas extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "由于未能保护他的人民，阿尔萨斯抓住了被诅咒的符文之剑霜之哀伤作为复仇的工具。霜之哀伤的恶意压倒了他，让阿尔萨斯成为了天灾忠实的死亡骑士，并将很快成为天灾最伟大的战士。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "允许在黑暗祭坛内召唤阿尔萨斯·米希尔"
    endmethod

    private method OnComplete takes nothing returns nothing
      call UnitDropAllItems(LEGEND_ARTHAS.Unit)
      call RemoveUnit(LEGEND_ARTHAS.Unit)
      set LEGEND_ARTHAS.Unit = null
      set LEGEND_ARTHAS.PlayerColor = PLAYER_COLOR_PURPLE
      set LEGEND_ARTHAS.StartingXP = 7000
      set LEGEND_ARTHAS.UnitType = 'Uear'
      call LEGEND_ARTHAS.ClearUnitDependencies()
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
      call Holder.ModObjectLimit(HERO_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("无处可逃", "当斯坦索姆城被攻陷时，阿尔萨斯王子将抛弃他的人民，加入天灾军团，成为他们的勇士。", "ReplaceableTextures\\CommandButtons\\BTNHeroDeathKnight.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_STRATHOLME))
      call this.AddQuestItem(QuestItemEitherOf.create(QuestItemLegendDead.create(LEGEND_ARTHAS), QuestItemFactionDefeated.create(FACTION_LORDAERON)))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary