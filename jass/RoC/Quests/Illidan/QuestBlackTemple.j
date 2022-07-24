library QuestBlackTemple requires QuestData, GeneralHelpers

  struct QuestBlackTemple extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "伊利丹杀掉了玛瑟里顿并收服了邪部落，伊利达雷变得更强了。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "邪部落将会加入我们，而玛瑟里顿会永久死亡"
    endmethod

    private method OnComplete takes nothing returns nothing 
      if FACTION_NAGA.Team == TEAM_NAGA then
        set FACTION_FEL_HORDE.Team = TEAM_NAGA
      endif
      set LEGEND_GRUUL.StartingXP = GetHeroXP(LEGEND_MAGTHERIDON.Unit)
      call RemoveUnit(LEGEND_MAGTHERIDON.Unit)
      call FACTION_FEL_HORDE.ModObjectLimit('Nmag', -UNLIMITED)           //Magtheridon
      call FACTION_FEL_HORDE.ModObjectLimit('n0D3', UNLIMITED)           //Ogron
      call LEGEND_GRUUL.Spawn(FACTION_FEL_HORDE.Player, GetRectCenterX(gg_rct_KilsorrowUnlock), GetRectCenterY(gg_rct_KilsorrowUnlock), 270)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("外域之主", "邪部落软弱而自满。伊利达雷会轻易征服他们并让他们为伊利丹服务。", "ReplaceableTextures\\CommandButtons\\BTNMetamorphosis.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_BLACKTEMPLE, false))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n00R')))
      call this.AddQuestItem(QuestItemResearch.create('R063', 'n055'))
      return this
    endmethod
  endstruct

endlibrary