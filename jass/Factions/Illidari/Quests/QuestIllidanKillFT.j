library QuestIllidanKillFT initializer OnInit requires QuestData, IllidariConfig

  globals
    private QuestData QUEST_ILLIDAN
    private QuestItemData QUESTITEM_KILL
  endglobals

  private function Dies takes nothing returns nothing
    local Person illidariPerson = FACTION_ILLIDARI.whichPerson
    if GetOwningPlayer(GetKillingUnit()) == illidariPerson.p then
      call AddHeroXP(LEGEND_ILLIDAN.Unit, 2000, true)
      call AddHeroAttributes(LEGEND_ILLIDAN.Unit, 10, 10, 10)
      call FACTION_ILLIDARI.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)
    else
      call FACTION_ILLIDARI.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig
    local integer i = 0
    local unit u = null

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, gg_unit_u000_0649, EVENT_UNIT_DEATH )  //Frozen Throne
    call TriggerAddAction(trig, function Dies)

    //Quest setup
    set QUEST_ILLIDAN = QuestData.create("Symphony of Frost and Flame", "Illidan the Betrayer has sworn to shatter the Frozen Throne under the orders of the demon lord Kil'jaeden.", "Illidan has long been reviled for his reckless methods, but on this day he has once again proven that he ultimately fights for Azeroth. The Frozen Throne has fallen to the chaotic might of the Illidari.", "ReplaceableTextures\\CommandButtons\\BTNRevenant.blp")
    set QUESTITEM_KILL = QUEST_ILLIDAN.addItem("Destroy the Frozen Throne")
    call FACTION_ILLIDARI.addQuest(QUEST_ILLIDAN)
  endfunction

endlibrary