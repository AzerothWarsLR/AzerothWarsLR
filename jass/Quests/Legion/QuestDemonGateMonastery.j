library QuestDemonGateMonastery initializer OnInit requires QuestData, LegionConfig

  globals
    private constant integer DEMONGATE_ID = 'ndmg'

    private QuestData QUEST_DEMONGATEMONASTERY
    private QuestItemData QUESTITEM_DEMONGATEMONASTERY
  endglobals

  private function Dies takes nothing returns nothing
    local Person legionPerson = FACTION_LEGION.Person
    local Person killingPerson = Person.ByHandle(GetOwningPlayer(GetKillingUnit()))

    if killingPerson.Faction.Team.ContainsPlayer(legionPerson.Player) then
      call CreateUnit(legionPerson.Player, DEMONGATE_ID, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()), 270.)
      call SetDoodadAnimationRectBJ( "hide", 'YObb', gg_rct_ScarletMonastery )
      call SetDoodadAnimationRectBJ( "hide", 'ZSab', gg_rct_ScarletMonastery )
      call SetDoodadAnimationRectBJ( "hide", 'YOsw', gg_rct_ScarletMonastery )
      call SetDoodadAnimationRectBJ( "show", 'LOsm', gg_rct_ScarletMonastery )
      call SetDoodadAnimationRectBJ( "hide", 'YOlp', gg_rct_ScarletMonastery )
      call SetDoodadAnimationRectBJ( "hide", 'ZCv2', gg_rct_ScarletMonastery )
      call SetDoodadAnimationRectBJ( "hide", 'ZCv1', gg_rct_ScarletMonastery )
      call SetDoodadAnimationRectBJ( "show", 'ZCv1', gg_rct_ScarletMonastery )
      call FACTION_LEGION.setQuestItemProgress(QUESTITEM_DEMONGATEMONASTERY, QUEST_PROGRESS_COMPLETE, true)
    else
      call FACTION_LEGION.setQuestItemProgress(QUESTITEM_DEMONGATEMONASTERY, QUEST_PROGRESS_FAILED, true)
    endif
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, gg_unit_h00T_0786, EVENT_UNIT_DEATH )
    call TriggerAddCondition(trig, Condition(function Dies))   

    set QUEST_DEMONGATEMONASTERY = QuestData.create("A Scarlet Rift", "The energies surrounding the Scarlet Monastery are extraordinary. Destroy this bastion of light to fabricate a Demon Gate in its place.", "The great Scarlet Monastery has fallen, and from its ashes rise an even greater Demon Gate.", "ReplaceableTextures\\CommandButtons\\BTNMaskOfDeath.blp")
    set QUESTITEM_DEMONGATEMONASTERY = QUEST_DEMONGATEMONASTERY.addItem("Destroy the Scarlet Monastery")
    call FACTION_LEGION.addQuest(QUEST_DEMONGATEMONASTERY) 
  endfunction

endlibrary