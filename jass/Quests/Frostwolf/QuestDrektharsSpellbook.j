library QuestDrektharsSpellbook initializer OnInit requires QuestData, Artifact, FrostwolfConfig

  globals
    private QuestData QUEST_DREKTHAR
    private QuestItemData QUESTITEM_VISIT
  endglobals

  private function EntersRegion takes nothing returns nothing
    local Artifact tempArtifact = 0
    if GetUnitTypeId(GetTriggerUnit()) == 'Othr' then
      set tempArtifact = Artifact.artifactsByType['dtsb']
      call UnitAddItem(GetTriggerUnit(), tempArtifact.item)
      call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "The World Tree, Nordrassil, has been captured by the forces of the Horde. Drek'thar has gifted Warchief Thrall his magical spellbook for this achievement.")
      call FACTION_FROSTWOLF.setQuestItemStatus(QUESTITEM_VISIT, QUEST_PROGRESS_COMPLETE, true)
      call DestroyTrigger(GetTriggeringTrigger())
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterEnterRectSimple( trig, gg_rct_Drekthars_Spellbook )
    call TriggerAddCondition( trig, function EntersRegion)

    //Quest setup
    set QUEST_DREKTHAR = QuestData.create("Drekthar's Spellbook", "The savage Night Elves threaten the safety of the entire Horde. Capture their World Tree and bring Thrall to its roots.", "The World Tree, Nordrassil, has been captured by the forces of the Horde. Drek'thar has gifted Warchief Thrall his magical spellbook for this achievement.", "ReplaceableTextures\\CommandButtons\\BTNSorceressMaster.blp")
    set QUESTITEM_VISIT = QUEST_DREKTHAR.addItem("Bring Thrall to the World Tree")
    call FACTION_FROSTWOLF.addQuest(QUEST_DREKTHAR)
  endfunction

endlibrary