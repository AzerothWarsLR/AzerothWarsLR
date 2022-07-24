library QuestFrozenThrone requires QuestData, GeneralHelpers

  struct QuestFrozenThrone extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod
    private method operator CompletionPopup takes nothing returns string
      return "作为对其使命的奖励，伊利丹和他的追随者们被允许加入燃烧军团。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "伊利达雷队伍将会加入燃烧军团"
    endmethod

    private method OnComplete takes nothing returns nothing 
      if FACTION_QUELTHALAS.Team == TEAM_NAGA then
        set FACTION_QUELTHALAS.Team = TEAM_LEGION
        set SUMMON_KIL.Progress = QUEST_PROGRESS_INCOMPLETE
        set GREAT_TREACHERY.Progress = QUEST_PROGRESS_FAILED
        set STAY_LOYAL.Progress = QUEST_PROGRESS_FAILED
        call UnitRemoveAbilityBJ( 'A0IK', LEGEND_KAEL.Unit)
        call UnitRemoveAbilityBJ( 'A0IF', LEGEND_KAEL.Unit)
        call UnitAddAbility(LEGEND_KAEL.Unit, 'A0R7')
      endif
      if FACTION_FEL_HORDE.Team == TEAM_NAGA then
        set FACTION_FEL_HORDE.Team = TEAM_LEGION
      endif
      set FACTION_NAGA.Team = TEAM_LEGION
      call SetPlayerTechResearched(FACTION_QUELTHALAS.Player, 'R075', 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("冰与火之交响曲", "基尔加丹命令伊利丹摧毁冰封王座，而他将服从命令", "ReplaceableTextures\\CommandButtons\\BTNMetamorphosis.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(LEGEND_LICHKING.Unit))
      call this.AddQuestItem(QuestItemResearch.create('R063', 'o01I'))
      return this
    endmethod
  endstruct

endlibrary