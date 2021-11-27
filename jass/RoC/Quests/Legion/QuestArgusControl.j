library QuestArgusControl requires QuestData, LegionSetup

  globals
    private constant integer QUESTRESEARCH_ID = 'R055'   //This research is given when the quest is completed
  endglobals

  struct QuestArgusControl extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Argus and the Diamond Mine are now under our control and you can research Astral Walk"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "control of the Diamond Mine and enable to research Astral Walk"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetUnitOwner(gg_unit_n0BE_3105, this.Holder.Player, true)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Argus Incursion", "The planet of Argus is not fully under the control of the Legion, bring it under control!", "ReplaceableTextures\\CommandButtons\\BTNMastersLodge.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0BF')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0BH')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0BG')))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUESTRESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary