library QuestPlague initializer OnInit requires QuestData

  globals
    QuestData QUEST_PLAGUE
    QuestItemData QUESTITEM_PLAGUECOMMAND
    QuestItemData QUESTITEM_PLAGUETIME
  endglobals

  private function OnInit takes nothing returns nothing
    set QUEST_PLAGUE = QuestData.create("Plague of Undeath", "From turn 5, you can type -plague to unleash a devastating zombifying plague across the lands of Lordaeron.", "The plague has been unleashed!", "ReplaceableTextures\\CommandButtons\\BTNPlagueCloud.blp")
    set QUEST_PLAGUE = QUEST_PLAGUE.addItem("Survive until turn 5")
    set QUESTITEM_PLAGUECOMMAND = QUEST_PLAGUE.addItem("Type -plague")
  endfunction

endlibrary