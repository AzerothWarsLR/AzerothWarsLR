library QuestWarsongKillSentinels requires WarsongConfig, LegendSentinels, Display

  globals
    private constant integer RESEARCH_ID = 'R058'
    private constant integer ZEPPELIN_ID = 'nzep'
  endglobals

  struct QuestWarsongKillSentinels extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Sentinels have been slain. With their Hippogryphs no longer terrorizing the skies, the Horde can field its refurbished Zeppelins."
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.Holder.modObjectLimit(UNITTYPE_ID, LIMIT_CHANGE)
      call DisplayUnitLimit(this.Holder, UNITTYPE_ID)
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Perfect Warriors", "The prowess and savagery of the Sentinels is to be respected - and feared. They must be eliminated.", "ReplaceableTextures\\CommandButtons\\BTNGoblinZeppelin.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_AUBERDINE))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_FEATHERMOON))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_WARSONG.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary