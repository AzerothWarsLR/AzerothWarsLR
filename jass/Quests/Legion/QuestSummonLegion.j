library QuestSummonLegion requires QuestData, ScourgeConfig, LegionConfig

  globals
    private constant integer RITUAL_ID = 'A00J'
  endglobals

  struct QuestSummonLegion extends QuestData
    private method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "Tremble, mortals, and despair. Doom has come to this world."
    endmethod

    private method OnAdd takes nothing returns nothing
      if Holder.PresenceResearch == 0 then
        call BJDebugMsg("ERROR: " + Holder.Name + " has no presence research. QuestSummonLegion won't work")
      endif
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Under the Burning Sky", "The greater forces of the Burning Legion lie in wait in the vast expanse of the Twisting Nether. Use the Book of Medivh to tear open a hole in space-time, and visit the full might of the Legion upon Azeroth.", "ReplaceableTextures\\CommandButtons\\BTNArchimonde.blp")
      call this.AddQuestItem(QuestItemEitherOf.create(QuestItemAcquireArtifact.create(ARTIFACT_BOOKOFMEDIVH), QuestItemLegendIsUnitType.create(LEGEND_KELTHUZAD, UNITTYPE_KELTHUZAD_LICH)))
      call this.AddQuestItem(QuestItemCastSpell.create(RITUAL_ID))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_LEGION.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary