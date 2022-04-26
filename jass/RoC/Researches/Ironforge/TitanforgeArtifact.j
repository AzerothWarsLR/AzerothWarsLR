library TitanForgeArtifact initializer OnInit requires ArtifactSetup, FilteredResearchEvents, Environment

  globals
    private constant integer RESEARCH_ID = 'R08K'
  endglobals

  private function Research takes nothing returns nothing
    local item heldItem = UnitItemInSlot(GetTriggerUnit(), 0)
    local Artifact heldArtifact = Artifact.artifactsByType[GetItemTypeId(heldItem)]
    if (heldItem != null and heldArtifact != 0 and heldArtifact.Titanforged == false) then
      call heldArtifact.Titanforge()
    else
      call AdjustPlayerStateBJ(75, GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER)
    endif
    call SetPlayerTechResearched(GetTriggerPlayer(), RESEARCH_ID, 1)
  endfunction

  private function OnInit takes nothing returns nothing
    call RegisterResearchFinishedAction(RESEARCH_ID, function Research)
  endfunction

endlibrary