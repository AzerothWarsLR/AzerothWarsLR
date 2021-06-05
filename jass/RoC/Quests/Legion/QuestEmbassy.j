library QuestEmbassy requires QuestData, LegionSetup
  globals
    private constant integer OBJECT_ID = 'u00U'
    private integer RESEARCH_ID = 'R042'
  endglobals

  struct QuestEmbassy extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Your presence on this world is now strong enough to start invoking infernal machines."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "You gain access to the Infernal Machine Factory"
    endmethod

    private method OnFail takes nothing returns nothing
      call this.Holder.modObjectLimit(RESEARCH_ID, -UNLIMITED)
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, RESEARCH_ID, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Infernal Foothold", "A stronger foothold in this world will be required to field the Burning Legion war machines.", "ReplaceableTextures\\CommandButtons\\BTNDemonBlackCitadel.blp")
      call this.AddQuestItem(QuestItemUpgrade.create(OBJECT_ID, 'u00N'))
      return this
    endmethod
  endstruct

endlibrary