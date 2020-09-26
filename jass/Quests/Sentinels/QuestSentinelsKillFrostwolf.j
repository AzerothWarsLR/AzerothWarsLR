library SentinelsKillFrostwolf requires SentinelsConfig, LegendFrostwolf, Display

  globals
    private constant integer RESEARCH_ID = 'R052'
    private constant integer AMARA_ID = 'h03I'
  endglobals

  struct SentinelsKillFrostwolf extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Frostwolves have been ousted from Kalimdor, along with their Tauren allies. They will not be missed."
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
      call DisplayUnitTypeAcquired(this.Holder.Player, AMARA_ID, "You can now revive Amara from the Altar of Elders.")
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(AMARA_ID, 1)
      call this.Holder.modObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Drive Them Back", "The Frostwolf Clan is beginning to seize a firm foothold within the Barrens and on the plains of Mulgore. They must be driven back.", "ReplaceableTextures\\CommandButtons\\BTNThrall.blp")
      call this.AddQuestItem(QuestItemUnitDead.create(LEGEND_ORGRIMMAR))
      call this.AddQuestItem(QuestItemUnitDead.create(LEGEND_THUNDERBLUFF))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_SCOURGE.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary