library QuestSentinelsKillWarsong initializer OnInit requires SentinelsConfig, LegendWarsong, Display

  globals
    private constant integer UNITTYPE_ID = 'echm'
    private constant integer RESEARCH_ID = 'R007'
    private constant integer UNIT_LIMIT = 4
    private constant integer BUILDING_ID = 'edos'
    private constant integer LIGHTNINGBARRAGE_ID = 'R018'
  endglobals

  struct QuestSentinelsKillWarsong extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Warsong presence on Kalimdor has been eliminated. The land has been protected from their misbegotten race."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Learn to train " + GetObjectName(UNITTYPE_ID) + "s from the " + GetObjectName('edos')
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, RESEARCH_ID, 1)
      call DisplayUnitTypeAcquired(Holder.Player, UNITTYPE_ID, "You can now train " + I2S(UNIT_LIMIT) + " " + GetObjectName(UNITTYPE_ID) + "s from the " + GetObjectName(BUILDING_ID) + ".")
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.modObjectLimit(RESEARCH_ID, UNLIMITED)
      call Holder.modObjectLimit(LIGHTNINGBARRAGE_ID, UNLIMITED)
      call Holder.modObjectLimit(UNITTYPE_ID, UNIT_LIMIT)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Green-skinned Brutes", "The Warsong Clan has arrived near Ashenvale and begun threatening the wilds. These invaders must be repelled.", "ReplaceableTextures\\CommandButtons\\BTNRaider.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_STONEMAUL))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_LUMBERCAMP))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_SENTINELS.AddQuest(QuestSentinelsKillWarsong.create())
  endfunction

endlibrary