//Jaina goes to Scholomance while Scholomance building is destroyed and retrieves the Soul Gem

library QuestJainaSoulGem initializer OnInit requires QuestData, Artifact, DalaranConfig

  globals
    private QuestData QUEST_SOULGEM
    private QuestItemData QUESTITEM_DESTROY
    private QuestItemData QUESTITEM_VISIT
  endglobals

  private function EntersRegion takes nothing returns nothing
    local Artifact tempArtifact = 0
    if GetUnitTypeId(GetTriggerUnit()) == 'Hjai' and not IsUnitAliveBJ(gg_unit_u012_1149) then
      set tempArtifact = Artifact.artifactsByType['gsou']
      call UnitAddItem(GetTriggerUnit(), tempArtifact.item)
      call FACTION_DALARAN.setQuestItemProgress(QUESTITEM_VISIT, QUEST_PROGRESS_COMPLETE, true)   
      call DestroyTrigger(GetTriggeringTrigger())
    endif
  endfunction

  private function Dies takes nothing returns nothing
    call FACTION_DALARAN.setQuestItemProgress(QUESTITEM_DESTROY, QUEST_PROGRESS_COMPLETE, true)   
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterEnterRectSimple( trig, gg_rct_Jaina_soul_gem )
    call TriggerAddCondition( trig, Condition( function EntersRegion ) )

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent(trig, gg_unit_u012_1149, EVENT_UNIT_DEATH)        //Scholomance interior
    call TriggerAddCondition(trig, Condition(function Dies))

    set QUEST_SOULGEM = QuestData.create("The Soul Gem", "Scholomance is home to a wide variety of profane artifacts. Bring Jaina there to see what might be discovered.", "Jaina Proudmoore has discovered the Soul Gem within the ruined vaults at Scholomance.", "ReplaceableTextures\\CommandButtons\\BTNSoulGem.blp")
    set QUESTITEM_DESTROY = QUEST_SOULGEM.addItem("Scholomance is destroyed")
    set QUESTITEM_VISIT = QUEST_SOULGEM.addItem("Bring Jaina to Scholomance")
    call FACTION_DALARAN.addQuest(QUEST_SOULGEM) 
  endfunction

endlibrary