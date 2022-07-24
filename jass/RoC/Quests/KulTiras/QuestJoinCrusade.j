
library QuestJoinCrusade requires Persons, KultirasSetup, GeneralHelpers

  globals 
    private constant integer QUEST_RESEARCH_ID = 'R06U'   //This research is given when the quest is completed
  endglobals

  struct QuestJoinCrusade extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "库尔提拉斯加入了血色十字军"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "解锁秩序审判者并加入血色十字军"
    endmethod    

    private method OnComplete takes nothing returns nothing
      call UnitRemoveAbilityBJ( 'A0JB', LEGEND_ADMIRAL.Unit)
      set this.Holder.Team = TEAM_SCARLET
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("加入十字军", "戴林普罗德摩尔看到了血色十字军的困境。作为那恐怖战争的人类幸存者，他们应该联合起来。", "ReplaceableTextures\\CommandButtons\\BTNDivine_Reckoning_Icon.blp")
      call this.AddQuestItem(QuestItemCastSpell.create('A0JB', true))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary