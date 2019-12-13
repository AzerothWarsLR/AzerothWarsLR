//Anyone on the Night Elves team approaches Moonglade with a unit with the Horn of Cenarius,
//Causing Malfurion to spawn.

library EventMalfurionAwakens initializer OnInit

  globals
    private constant integer HORN_OF_CENARIUS = 'cnhn'
    private constant integer GHANIR = 'I00C'
  endglobals

  private function EntersRegion takes nothing returns nothing
    local Person druidsPerson = PersonsByFaction[FACTION_DRUIDS]
    local player druidsPlayer = druidsPerson.p
    local Person triggerPerson = 0
    local unit malfurion = gg_unit_Efur_3093
    local Artifact tempArtifact = 0

    if UnitHasItemOfTypeBJ(GetTriggerUnit(), HORN_OF_CENARIUS) and IsUnitAliveBJ(gg_unit_nbwd_0737) then
      set triggerPerson = Persons[GetPlayerId(GetOwningPlayer(GetTriggerUnit()))]
      if triggerPerson.team == TEAM_NIGHT_ELVES and druidsPerson != 0 then //Night Elves
        call DisplayTextToForce(GetPlayersAll(), "Malfurion has awoken from his deep slumber in the Barrow Den.")
        call ShowUnit(malfurion, true)
        call SetUnitInvulnerable(malfurion, false)
        call SetUnitOwner(malfurion, druidsPlayer, true)
        set tempArtifact = Artifact.artifactsByType[GHANIR] //G'hanir
        call UnitAddItem(malfurion, tempArtifact.item)
        call DestroyTrigger(GetTriggeringTrigger())
      endif
      call DestroyTrigger(GetTriggeringTrigger())
    endif

    //Cleanup
    set druidsPlayer = null
    set malfurion = null
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterEnterRectSimple(trig, gg_rct_Moonglade)
    call TriggerAddCondition(trig, Condition(function EntersRegion))
  endfunction

endlibrary