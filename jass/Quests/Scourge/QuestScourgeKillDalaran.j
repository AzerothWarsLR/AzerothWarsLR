library QuestScourgeKillDalaran requires QuestData, ScourgeConfig, QuestItemKillUnit

  struct QuestScourgeKillDalaran extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Dalaran has been razed, and its libraries plundered."
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.Holder.modObjectLimit('uobs', 2)
      call DisplayUnitLimit(this.Holder, 'uobs')
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Forbidden Knowledge", "The libraries of Dalaran are filled with magical secrets that could be used to educate the Cult of the Damned, enabling them to repair more Obsidian Statues.", "ReplaceableTextures\\CommandButtons\\BTNBookOfTheDead.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(LEGEND_DALARAN.Unit))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_SCOURGE.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary