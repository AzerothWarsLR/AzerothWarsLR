library QuestSlashAndBurn initializer OnInit requires QuestData, WarsongConfig

  globals
    private QuestItemData QUESTITEM_KILL1
    private QuestItemData QUESTITEM_KILL2
    private QuestItemData QUESTITEM_KILL3
    private constant integer LUMBER_REWARD = 500
  endglobals

  private function UnitIsTreeOfLife takes unit whichUnit returns boolean
    if GetUnitTypeId(whichUnit) == 'etol' or GetUnitTypeId(whichUnit) == 'etoa' or GetUnitTypeId(whichUnit) == 'etoe' then
      return true
    endif
    return false
  endfunction

  private function Dies takes nothing returns nothing
    if FACTION_WARSONG.Person.Team.containsPlayer(GetOwningPlayer(GetKillingUnit())) and UnitIsTreeOfLife(GetTriggerUnit()) then
      if FACTION_WARSONG.getQuestItemProgress(QUESTITEM_KILL1) != QUEST_PROGRESS_COMPLETE then
        call AdjustPlayerStateBJ(LUMBER_REWARD, FACTION_WARSONG.Person.p, PLAYER_STATE_RESOURCE_LUMBER)
        call FACTION_WARSONG.setQuestItemProgress(QUESTITEM_KILL1, QUEST_PROGRESS_COMPLETE, true)
      elseif FACTION_WARSONG.getQuestItemProgress(QUESTITEM_KILL2) != QUEST_PROGRESS_COMPLETE then
        call AdjustPlayerStateBJ(LUMBER_REWARD, FACTION_WARSONG.Person.p, PLAYER_STATE_RESOURCE_LUMBER)
        call FACTION_WARSONG.setQuestItemProgress(QUESTITEM_KILL2, QUEST_PROGRESS_COMPLETE, true)
      elseif FACTION_WARSONG.getQuestItemProgress(QUESTITEM_KILL3) != QUEST_PROGRESS_COMPLETE then
        call AdjustPlayerStateBJ(LUMBER_REWARD, FACTION_WARSONG.Person.p, PLAYER_STATE_RESOURCE_LUMBER)
        call FACTION_WARSONG.setQuestItemProgress(QUESTITEM_KILL3, QUEST_PROGRESS_COMPLETE, true)
      endif
    endif
  endfunction

  public function OnInit takes nothing returns nothing
    local trigger trig
    local QuestData tempQuest

    set trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddAction(trig, function Dies)

    //Quest setup
    set tempQuest = QuestData.create("Slash and Burn", "The enormous, enchanted Trees of Life are rich with resources. You must seek out three of these sacred Trees and rip them down.", "The Horde has torn apart a series of Night Elven Tree of Life and harvested them for their resources.", "ReplaceableTextures\\CommandButtons\\BTNTreeOfLife.blp")
    set QUESTITEM_KILL1 = tempQuest.addItem("Destroy Trees of Life 1/3")
    set QUESTITEM_KILL2 = tempQuest.addItem("Destroy Trees of Life 2/3")
    set QUESTITEM_KILL3 = tempQuest.addItem("Destroy Trees of Life 3/3")
    call FACTION_WARSONG.addQuest(tempQuest)
  endfunction

endlibrary