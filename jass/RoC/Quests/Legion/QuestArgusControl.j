library QuestArgusControl requires QuestData, LegionSetup

  globals
    private constant integer QUESTRESEARCH_ID = 'R055'   //This research is given when the quest is completed
  endglobals

  struct QuestArgusControl extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "You have can now build Unholy Reliquary " //Todo: where is Astral Walk researched? What is the shop called?
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Unlock the Unholy Reliquary"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Argus Incursion", "The planet of Argus is not fully under the control of the Legion. Bring it under control!", "ReplaceableTextures\\CommandButtons\\BTNMastersLodge.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0BF')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0BH')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0BG')))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUESTRESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary