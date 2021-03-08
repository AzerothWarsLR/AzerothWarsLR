library QuestSetup requires DalaranQuestSetup, DruidsQuestSetup, FelHordeQuestSetup, FrostwolfQuestSetup, IronforgeQuestSetup, LegionQuestSetup, LordaeronQuestSetup, QuelthalasQuestSetup, ScourgeQuestSetup, SentinelsQuestSetup, StormwindQuestSetup, WarsongQuestSetup

  public function OnInit takes nothing returns nothing
    call DalaranQuestSetup_OnInit()
    call DruidsQuestSetup_OnInit()
    call FelHordeQuestSetup_OnInit()
    call FrostwolfQuestSetup_OnInit()
    call IronforgeQuestSetup_OnInit()
    call LegionQuestSetup_OnInit()
    call LordaeronQuestSetup_OnInit()
    call QuelthalasQuestSetup_OnInit()
    call ScourgeQuestSetup_OnInit()
    call SentinelsQuestSetup_OnInit()
    call StormwindQuestSetup_OnInit()
    call WarsongQuestSetup_OnInit()
  endfunction

endlibrary