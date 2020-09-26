library QuestQueldanil requires QuestData, QuelthalasConfig, LegendNeutral

  struct QuestQueldanil extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Quel'thalas has finally reunited with its lost rangers in the Hinterlands."
    endmethod

    private method OnComplete takes nothing returns nothing
      local unit u
      loop
        set u = FirstOfGroup(udg_QuelDanilLodge)
        exitwhen u == null
        call UnitRescue(u, this.Holder.Player)
        call GroupRemoveUnit(udg_QuelDanilLodge, u)
      endloop
      call DestroyGroup(udg_QuelDanilLodge)
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Quel'danil Lodge", "Quel'danil Lodge is a High Elven outpost situated in the Hinterlands. It's been some time since the rangers there have been in contact with Quel'thalas.", "ReplaceableTextures\\CommandButtons\\BTNBearDen.blp")
      call this.AddQuestItem(QuestItemAnyUnitInRect.create(gg_rct_QuelDanil_Lodge))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      local QuestData newQuest = thistype.create()
      call FACTION_QUELTHALAS.AddQuest(newQuest)
      set FACTION_QUELTHALAS.StartingQuest = newQuest
    endmethod
  endstruct

endlibrary