library QuestSylvanasConfig initializer OnInit requires QuestData

  globals
    QuestData QUEST_SYLVANAS
    QuestItemData QUESTITEM_SYLVANAS
  endglobals

  private function OnInit takes nothing returns nothing
    set QUEST_SYLVANAS = QuestData.create("Reanimate Sylvanas", "Kill Ranger-General Sylvanas to reanimate her as a Banshee under your control. Sylvanas is aligned with Quel'thalas.", "", "ReplaceableTextures\\CommandButtons\\BTNSylvanusWindrunner.blp")
    set QUESTITEM_SYLVANAS = QUEST_SYLVANAS.addItem("Kill Sylvanas")
  endfunction

endlibrary