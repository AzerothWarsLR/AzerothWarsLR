library QuestYoggSaron requires QuestData, GeneralHelpers

  globals
    private constant integer RESEARCH_ID = 'R07R'
  endglobals

  struct QuestYoggSaron extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Yogg-Saron has been awoken"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "The old god Yogg-Saron will join the Black Empire and enable to train Forgotten ones"
    endmethod

    private method OnComplete takes nothing returns nothing
      call UnitRescue(gg_unit_U02C_2829, this.Holder.Player)  //Yogg
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Fiend of a Thousand Faces", "Yogg-Saron is still imprisonned in Northrend, he needs to be freed and join the Black Empire", "ReplaceableTextures\\CommandButtons\\BTNYogg-saronIcon.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n053')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n00I')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n02S')))
      set this.ResearchId = RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary