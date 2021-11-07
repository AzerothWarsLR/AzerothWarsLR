library QuestFirstObelisk requires QuestData, QuestItemKillUnit

  struct QuestFirstObelisk extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The first Obelisk has been set. The next one will be summoned in the Twilight Highlands"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "The first Obelisk will be placed in Storm Peaks"
    endmethod

    private method OnComplete takes nothing returns nothing
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The First Obelisk", "The twisted reality of Ny'alotha is disconnected from Azeroth. 3 Obelisks will be needed to link the 2 realities together. The first Obelisk will be planted in Northrend", "ReplaceableTextures\\CommandButtons\\BTNIceCrownObelisk.blp")
      call this.AddQuestItem(QuestItemBuild.create('n0BA', 1))
      return this
    endmethod
  endstruct

endlibrary