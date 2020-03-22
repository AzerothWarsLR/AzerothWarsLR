library QuestSilverpineGraveyard initializer OnInit requires QuestData

  globals
    QuestData QUEST_SILVERPINE
    QuestItemData QUESTITEM_SILVERPINE
  endglobals

  private function OnInit takes nothing returns nothing
    set QUEST_SILVERPINE = QuestData.create("Descecrate Silverpine Graveyard", "Silverpine Graveyard is full of human corpses waiting to be reanimated.", "", "ReplaceableTextures\\CommandButtons\\BTNSkeleton.blp")
    set QUESTITEM_SILVERPINE = QUEST_KELTHUZAD.addItem("Bring Kel'thuzad to Silverpine Graveyard")
  endfunction

endlibrary