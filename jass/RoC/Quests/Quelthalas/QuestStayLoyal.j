library QuestStayLoyal requires Persons, GeneralHelpers

  globals 
    private constant integer QUEST_RESEARCH_ID = 'R08Z'   //This research is given when the quest is completed
  endglobals

  struct QuestStayLoyal extends QuestData
    private method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "血精灵忠于伊利丹"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "与伊利丹保持同盟关系"
    endmethod    

    private method OnComplete takes nothing returns nothing
      set GREAT_TREACHERY.Progress = QUEST_PROGRESS_FAILED
      set SUMMON_KIL.Progress = QUEST_PROGRESS_FAILED
      call UnitRemoveAbilityBJ( 'A0IK', LEGEND_KAEL.Unit)
      call UnitRemoveAbilityBJ( 'A0IF', LEGEND_KAEL.Unit)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("拒绝基尔加丹的提议", "基尔加丹向凯尔提供了力量和救赎，凯尔拒绝并抵制恶魔力量的诱惑", "ReplaceableTextures\\CommandButtons\\BTNDemonHunter2.blp")
      call this.AddQuestItem(QuestItemCastSpell.create('A0IK', true))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary