library QuestTownWatch requires QuestData

  globals
    private constant integer QUEST_RESEARCH_ID = 'R077'   //This research is given when the quest is completed
  endglobals

  struct QuestTownWatch extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "邪教徒们被消灭了，我们的城镇现在安全了"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得4000木材和500黄金"
    endmethod

    private method OnComplete takes nothing returns nothing
    call AdjustPlayerStateBJ( 500, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
    call AdjustPlayerStateBJ( 4000, this.Holder.Player, PLAYER_STATE_RESOURCE_LUMBER )
    endmethod

    private method OnAdd takes nothing returns nothing
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("诅咒教派", "异端邪教徒们正在洛丹伦的村庄中传播致命的瘟疫，我们必须阻止他们，防止腐化，杀死所有的邪教分子", "ReplaceableTextures\\CommandButtons\\BTNAcolyte.blp")
      call this.AddQuestItem(QuestItemResearch.create('Rhse', 'h083'))
      call this.AddQuestItem(QuestItemBuild.create('h084', 8))
      call this.AddQuestItem(QuestItemKillXUnit.create('u01U', 3))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary