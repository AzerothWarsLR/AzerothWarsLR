//Kael or Tichondrious goes to the Dalaran Dungeons and retrieves the Skull of Gul'dan.
//Only works if the Skull of Gul'dan has been hidden as a result of Quel'thalas failing the troll event.

library EventSkullOfGuldanRetrieval initializer OnInit requires Persons, LegionConfig, IllidariConfig, ArtifactConfig

  private function EntersRegion takes nothing returns nothing
    local Person tempPerson = 0
    local Faction tempFaction = 0
    local Artifact tempArtifact = 0
    local unit triggerUnit = GetTriggerUnit()
    if IsUnitType(triggerUnit, UNIT_TYPE_HERO) then
      set tempPerson = Persons[GetPlayerId(GetOwningPlayer(triggerUnit))]
      set tempFaction = tempPerson.getFaction()
      if tempFaction == FACTION_LEGION or tempFaction == FACTION_ILLIDARI then
        set tempArtifact = Artifact.artifactsByType['I007']
        if tempArtifact.status == ARTIFACT_STATUS_HIDDEN then
          call PlaySoundBJ( gg_snd_SecretFound )
          call UnitAddItem(triggerUnit, tempArtifact.item)
          call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, tempFaction.getPrefixCol() + GetHeroProperName(triggerUnit) + "|r has retrieved the " + GetItemName(tempArtifact.item) + " from the Dalaran Dungeons.")   
          call DestroyTrigger(GetTriggeringTrigger())
        endif
      endif
    endif
    set triggerUnit = null
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterEnterRectSimple(trig, gg_rct_TichonSkull)
    call TriggerAddCondition(trig, Condition(function EntersRegion))
  endfunction

endlibrary