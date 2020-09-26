library QuestAndrassil requires QuestData, ControlPoint, DruidsConfig

  struct QuestAndrassil extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "With Northrend finally free of the Lich King's influence, the time is ripe to regrow Andrassil in the hope that it can help reclaim this barren land."
    endmethod

    private method operator RewardDescription takes nothing returns string
      return "Gain a new capital at Grizzly Hills that can research a powerful upgrade for your Furbolgs and Druids of the Claw"
    endmethod

    private method OnComplete takes nothing returns nothing
      call CreateUnit(Holder.Player, 'n04F', GetRectCenterX(gg_rct_Andrassil), GetRectCenterY(gg_rct_Andrassil), 0)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.modObjectLimit('R05X', UNLIMITED)
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Crown of the Snow", "Long ago, Fandral Staghelm cut a sapling from Nordrassil and used it to grow Andrassil in Northrend. Without the blessing of the Aspects, it fell to the Old Gods' corruption. If Northrend were to be reclaimed, Andrassil's growth could begin anew.", "ReplaceableTextures\\CommandButtons\\BTNTreant.blp")
      call this.AddQuestItem(QuestItemKillLegend.create(LEGEND_LICHKNG))
      call this.AddQuestItem(QuestItemCaptureUnitType.create('n03U'))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_DRUIDS.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary