library QuestGnomeregan initializer OnInit requires QuestData, IronforgeConfig

  globals
    private QuestData QUEST_GNOMEREGAN
    private QuestItemData QUESTITEM_GNOMEREGAN
  endglobals

  private function Actions takes nothing returns nothing
    local group tempGroup = CreateGroup()
    local unit u

    //Transfer all Neutral Passive units in Gnomeregan to Ironforge
    call GroupEnumUnitsInRect(tempGroup, gg_rct_Gnomergan, null)
    set u = FirstOfGroup(tempGroup)
    loop
    exitwhen u == null
      if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
        call UnitRescue(u, FACTION_IRONFORGE.Person.p)
      endif
      call GroupRemoveUnit(tempGroup, u)
      set u = FirstOfGroup(tempGroup)
    endloop
    call DestroyGroup(tempGroup)
    set tempGroup = null
    call FACTION_IRONFORGE.setQuestItemStatus(QUESTITEM_GNOMEREGAN, QUEST_PROGRESS_COMPLETE, true)    
    call SetPlayerTechResearched(FACTION_IRONFORGE.Person.p, 'R05Q', 1) 
    call DestroyTrigger(GetTriggeringTrigger())            
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterUnitEvent(trig, gg_unit_nitw_1513, EVENT_UNIT_DEATH)        //Ice Troll Warlord
    call TriggerAddCondition(trig, Condition(function Actions))

    set QUEST_GNOMEREGAN = QuestData.create("The City of Invention", "The people of Gnomeregan have long been unable to assist the Alliance in its wars due an infestation of troggs and Ice Trolls. Resolve their conflicts for them to gain their services.", "Gnomeregan has been literated, and its military is now free to assist the South Alliance.", "ReplaceableTextures\\CommandButtons\\BTNFlyingMachine.blp")
    set QUESTITEM_GNOMEREGAN = QUEST_GNOMEREGAN.addItem("Kill the Ice Trolls at Gnomeregan")
    call FACTION_IRONFORGE.addQuest(QUEST_GNOMEREGAN) 
  endfunction        

endlibrary