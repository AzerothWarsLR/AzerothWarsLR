library QuestAwakenCthun requires QuestData, QuestItemKillUnit

  globals
    private constant integer QUEST_RESEARCH_ID = 'R06A'   //This research is given when the quest is completed
  endglobals

  struct QuestAwakenCthun extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Old God C'thun has awaken and you can train Wasps"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Gain control of C'thun and enable you to train Wasps"
    endmethod

    private method OnComplete takes nothing returns nothing
      call PauseUnitBJ( false, gg_unit_U00R_0609 )
      call SetUnitTimeScalePercent( gg_unit_U00R_0609, 100.00 )
      call DestroyEffectBJ(udg_CthunEffect)
      call SetPlayerAbilityAvailableBJ( false, 'A01O', this.Holder.Player)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Awakening of C'thun", "The Old God C'thun is still slumbering, Skeram will need to awaken him with an unholy ritual.", "ReplaceableTextures\\CommandButtons\\BTNCthunIcon.blp")
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_SKERAM, gg_rct_CthunSummon, "Near Cthun"))
      call this.AddQuestItem(QuestItemBuild.create('n0AH', 1))
      call this.AddQuestItem(QuestItemCastSpell.create('A01O', true))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary