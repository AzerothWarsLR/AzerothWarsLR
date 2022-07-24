library QuestArgusControl requires QuestData, LegionSetup

  globals
    private constant integer QUESTRESEARCH_ID = 'R055'   //This research is given when the quest is completed
  endglobals

  struct QuestArgusControl extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "你现在可以建筑邪恶圣骨匣了" //Todo: where is Astral Walk researched? What is the shop called?
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "解锁邪恶圣骨匣"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("入侵阿古斯", "阿古斯还没有完全被军团所控制，收服它吧！", "ReplaceableTextures\\CommandButtons\\BTNMastersLodge.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0BF')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0BH')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0BG')))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUESTRESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary