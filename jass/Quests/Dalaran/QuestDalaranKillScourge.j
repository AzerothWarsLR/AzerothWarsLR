library QuestDalaranKillScourge initializer OnInit requires QuestItemKillUnit, QuestItemControlUnit, DalaranConfig, LegendLegion

  globals
    private constant integer QUEST_RESEARCH_ID = 'R053'
    private constant integer UNITTYPE_ID = 'u01R'
    private constant integer CASTER_RESEARCH_ID = 'Rune'
  endglobals

  struct QuestDalaranKillScourge extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Lich King has been slain. The practice of necromancy slowly returns to the academies of Dalaran."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Learn to train " + GetObjectName(UNITTYPE_ID) + "s from the " + GetObjectName('hars')
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, QUEST_RESEARCH_ID, 1)
      call SetPlayerTechResearched(Holder.Player, CASTER_RESEARCH_ID, 3)
      call DisplayUnitTypeAcquired(Holder.Player, UNITTYPE_ID, "You can now train " + GetObjectName(UNITTYPE_ID) + "s from the Arcane Sanctum.")
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(QUEST_RESEARCH_ID, UNLIMITED)
      call this.Holder.modObjectLimit(UNITTYPE_ID, UNLIMITED)
      call this.Holder.modObjectLimit(CASTER_RESEARCH_ID, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Legitimate Necromancy", "The heinous actions of the Cult of the Damned have illegitimized necromancy in the eyes of the Council of Six.", "ReplaceableTextures\\CommandButtons\\BTNNecromancer.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(LEGEND_LICHKING.Unit))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_DALARAN.AddQuest(QuestDalaranKillScourge.create())
  endfunction

endlibrary