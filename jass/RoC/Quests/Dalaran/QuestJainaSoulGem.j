//Jaina goes to Scholomance while Scholomance building is destroyed and retrieves the Soul Gem
library QuestJainaSoulGem requires QuestData, Artifact, LegendDalaran, LegendScourge, GeneralHelpers

  struct QuestJainaSoulGem extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "吉安娜·普罗德摩尔在通灵学院的废墟之中发现了灵魂宝石。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "灵魂宝石"
    endmethod

    private method OnComplete takes nothing returns nothing
      call UnitAddItemSafe(LEGEND_JAINA.Unit, ARTIFACT_SOULGEM.item) 
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("灵魂宝石", "通灵学院内有着各种各样的邪恶神器。把吉安娜带到那里看看会发现什么。", "ReplaceableTextures\\CommandButtons\\BTNSoulGem.blp")
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_JAINA, gg_rct_Jaina_soul_gem, "通灵学院"))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_SCHOLOMANCE))
      return this
    endmethod
  endstruct

endlibrary