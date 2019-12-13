library DemonSoulAssembly initializer OnInit requires Artifact, Persons

  globals
    private constant real DUMMY_X = 22700
    private constant real DUMMY_Y = 23735
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
      set tempArtifact = Artifact.artifactsByType['I01A']
      set tempItem = tempArtifact.item
      call UnitAddItem(triggerUnit, tempItem)
      set triggerPerson = Persons[GetPlayerId(GetOwningPlayer(triggerUnit))]
      call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, triggerPerson.faction.prefixCol + triggerPerson.faction.name + "|r has assembled the Demon Soul!" )
      set tempItem = null
      call DestroyTrigger(GetTriggeringTrigger())  
    endif
    set triggerUnit = null
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_PICKUP_ITEM)
    call TriggerAddAction(trig, function ItemPickup)
  endfunction

endlibrary