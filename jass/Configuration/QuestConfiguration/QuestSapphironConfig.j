library QuestSapphiron initializer OnInit requires QuestData

  globals
    QuestData QUEST_SAPPHIRON
    QuestItemData QUESTITEM_SAPPHIRON
  endglobals

  private function OnInit takes nothing returns nothing
    set QUEST_SAPPHIRON = QuestData.create("Reanimate Sapphiron", "Kill Sapphiron the Blue Dragon to reanimate her as a Frost Wyrm. Sapphiron can be found in Northrend.", "Sapphiron has been slain, and has been reanimated as a mighty Frost Worm under your control.", "ReplaceableTextures\\CommandButtons\\BTNFrostWyrm.blp")
    set QUESTITEM_SAPPHIRON = QUEST_SAPPHIRON.addItem("Kill Sapphiron")
  endfunction

endlibrary