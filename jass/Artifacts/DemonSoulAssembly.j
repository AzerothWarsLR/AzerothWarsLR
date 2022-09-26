library ZinrokhAssembly initializer OnInit requires Artifact, Persons, FilteredItemEvents, GeneralHelpers

  globals
    private constant real DUMMY_X = 22700
    private constant real DUMMY_Y = 23734
  endglobals

  private function Consume takes integer whichItemId returns nothing
    local Artifact tempArtifact = Artifact.artifactsByType[whichItemId]
    call SetItemPosition(tempArtifact.item, DUMMY_X, DUMMY_Y)
    call tempArtifact.setStatus(ARTIFACT_STATUS_HIDDEN)
    call tempArtifact.setDescription("Used to create the Demon Soul")
  endfunction

  private function ItemPickup takes nothing returns nothing
    local unit triggerUnit = GetTriggerUnit()
    local Person triggerPerson = 0
    local item tempItem = null
    local Artifact tempArtifact = 0

    if GetInventoryIndexOfItemTypeBJ(triggerUnit, 'I01J') > 0 and GetInventoryIndexOfItemTypeBJ(triggerUnit, 'I01K') > 0 and GetInventoryIndexOfItemTypeBJ(triggerUnit, 'I01M') > 0 and GetInventoryIndexOfItemTypeBJ(triggerUnit, 'I01I') > 0 and GetInventoryIndexOfItemTypeBJ(triggerUnit, 'I01L') > 0 then
      call Consume('I01J')         
      call Consume('I01K')  
      call Consume('I01M')  
      call Consume('I01I')   
      call Consume('I01L')
      set tempArtifact = Artifact.artifactsByType['I016']
      set tempItem = tempArtifact.item
      call UnitAddItemSafe(triggerUnit, tempItem)
      set triggerPerson = Person.ByHandle(GetOwningPlayer(GetTriggerUnit()))
      call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, triggerPerson.Faction.prefixCol + triggerPerson.Faction.Name + "|r has assembled Zin'rokh, Destroyer of Worlds!" )
      set tempItem = null
      call DestroyTrigger(GetTriggeringTrigger())  
    endif
    set triggerUnit = null
  endfunction

  private function OnInit takes nothing returns nothing
    call RegisterItemTypePickupAction('I01J', function ItemPickup)
    call RegisterItemTypePickupAction('I01K', function ItemPickup)
    call RegisterItemTypePickupAction('I01M', function ItemPickup)
    call RegisterItemTypePickupAction('I01I', function ItemPickup)
    call RegisterItemTypePickupAction('I01L', function ItemPickup)
  endfunction

endlibrary