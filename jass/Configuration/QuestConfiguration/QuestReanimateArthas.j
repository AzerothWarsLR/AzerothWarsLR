library QuestReanimateArthas initializer OnInit requires QuestData

  globals
    QuestData QUEST_REANIMATE_ARTHAS
    QuestItemData QUESTITEM_DESTROY_STRATHOLME
    QuestItemData QUESTITEM_DESTROY_TYRSHAND
    QuestItemData QUESTITEM_DESTROY_CAPITAL_PALACE
  endglobals

  private function OnInit takes nothing returns nothing
    set QUEST_REANIMATE_ARTHAS = QuestData.create("Corrupt Prince Arthas", "When the last bastion of Lordaeron falls, Prince Arthas will abandon his people and join the Scourge as their champion.", "", "ReplaceableTextures\\CommandButtons\\BTNHeroDeathKnight.blp")
    set QUESTITEM_DESTROY_STRATHOLME = QUEST_REANIMATE_ARTHAS.addItem("Destroy Stratholme")
    set QUESTITEM_DESTROY_TYRSHAND = QUEST_REANIMATE_ARTHAS.addItem("Destroy Tyr's Hand")
    set QUESTITEM_DESTROY_CAPITAL_PALACE = QUEST_REANIMATE_ARTHAS.addItem("Destroy Capital Palace")
  endfunction

endlibrary