//Jaina goes to Scholomance while Scholomance building is destroyed and retrieves the Soul Gem
library QuestJainaSoulGem initializer OnInit requires QuestData, Artifact, DalaranConfig

  struct QuestJainaSoulGem extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Jaina Proudmoore has discovered the Soul Gem within the ruined vaults at Scholomance."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "The Soul Gem artifact"
    endmethod

    private method OnComplete takes nothing returns nothing
      call UnitAddItem(GetTriggerUnit(), ARTIFACT_SOULGEM.item) 
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Soul Gem", "Scholomance is home to a wide variety of profane artifacts. Bring Jaina there to see what might be discovered.", "ReplaceableTextures\\CommandButtons\\BTNSoulGem.blp")
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_JAINA, gg_rct_Jaina_soul_gem))
      call this.AddQuestItem(QuestItemUnitDead.create(gg_unit_u012_1149))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_DALARAN.AddQuest(QuestJainaSoulGem.create())
  endfunction

endlibrary