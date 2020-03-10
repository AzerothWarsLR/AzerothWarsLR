library QuestPlague initializer OnInit requires QuestData

  globals
    QuestData QUEST_PLAGUE
  endglobals

  private function OnInit takes nothing returns nothing
    set QUEST_PLAGUE = QuestData.create("Plague of Undeath", "From turn 5, you can type -plague to unleash a devastating zombifying plague across the lands of Lordaeron.", "The plague has been unleashed!", "ReplaceableTextures\\CommandButtons\\BTNPlagueCloud.blp")
  endfunction

endlibrary