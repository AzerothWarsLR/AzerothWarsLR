
library QuestGreatTreachery requires Persons, GeneralHelpers

  globals 
    private constant integer QUEST_RESEARCH_ID = 'R075'   //This research is given when the quest is completed
  endglobals

  struct QuestGreatTreachery extends QuestData
    private method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "血精灵加入了燃烧军团"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "解锁召唤基尔加丹任务并加入燃烧军团"
    endmethod    

    private method OnComplete takes nothing returns nothing
      set STAY_LOYAL.Progress = QUEST_PROGRESS_FAILED
      call UnitRemoveAbilityBJ( 'A0IF', LEGEND_KAEL.Unit)
      call UnitRemoveAbilityBJ( 'A0IK', LEGEND_KAEL.Unit)
      call RemoveUnit(LEGEND_LORTHEMAR.Unit)
      call FACTION_QUELTHALAS.ModObjectLimit('H02E',-UNLIMITED)       //Lorthemar
      set this.Holder.Team = TEAM_LEGION
      set SUMMON_KIL.Progress = QUEST_PROGRESS_INCOMPLETE
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("背叛者", "基尔加丹向凯尔提出了为他的人民提供力量和救赎。只有接受了基尔加丹的要求才能满足血精灵对魔法的渴望.", "ReplaceableTextures\\CommandButtons\\BTNFelKaelthas.blp")
      call this.AddQuestItem(QuestItemCastSpell.create('A0IF', true))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary