library QuestKingdomOfMan requires LordaeronConfig, StormwindConfig, ControlPoint, ArtifactConfig

  globals
    private constant integer RESEARCH_ID = 'R01N'
  endglobals

  struct QuestKingdomOfMan extends QuestData
    private method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "The people of the Eastern Kingdoms have been united under the banner of " + this.Holder.ColoredName + ". Long live the King!"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Gain a research improving all of your units, and merge the Crowns of Lordaeron and Stormwind"
    endmethod

    private method OnComplete takes nothing returns nothing
      local unit crownHolder = ARTIFACT_CROWNLORDAERON.owningUnit
      call RemoveItem(ARTIFACT_CROWNLORDAERON.item)
      call RemoveItem(ARTIFACT_CROWNSTORMWIND.item)
      call UnitAddItem(crownHolder, ARTIFACT_CROWNEASTERNKINGDOMS.item)
      call ARTIFACT_CROWNLORDAERON.setStatus(ARTIFACT_STATUS_HIDDEN)
      call ARTIFACT_CROWNLORDAERON.setDescription("Melted down")
      call ARTIFACT_CROWNSTORMWIND.setStatus(ARTIFACT_STATUS_HIDDEN)
      call ARTIFACT_CROWNSTORMWIND.setDescription("Melted down")
      call SetPlayerTechResearched(Holder.Player, RESEARCH_ID, 1)
      call DisplayResearchAcquired(Holder.Player, RESEARCH_ID, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.modObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Kingdom of Man", "Before the First War, all of humanity was united under the banner of the Arathorian Empire. Reclaim its greatness by uniting mankind once again.", "ReplaceableTextures\\CommandButtons\\BTNFireKingCrown.blp")
      call this.AddQuestItem(QuestItemAcquireArtifact.create(ARTIFACT_CROWNOFLORDAERON))
      call this.AddQuestItem(QuestItemAcquireArtifact.create(ARTIFACT_CROWNOFSTORMWIND))
      call this.AddQuestItem(QuestItemCaptureControlPoint.create('n010'))
      call this.AddQuestItem(QuestItemCaptureControlPoint.create('n01G'))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_LORDAERON.AddQuest(thistype.create())
      call FACTION_STORMWIND.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary