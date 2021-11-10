library QuestSecondObelisk requires QuestData, QuestItemKillUnit

  struct QuestSecondObelisk extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The second Obelisk has been set. The last one will be summoned in the Tanaris"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "The second Obelisk will be placed in Northern Twilight Highlands"
    endmethod

    private method OnComplete takes nothing returns nothing
      call RemoveDestructable( gg_dest_ATg2_35871 )
      call RemoveDestructable( gg_dest_ATg3_35869 )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Second Obelisk", "The Second Obelisk must be summoned in Northern Twilight Highlands, the convergence of realities draws close", "ReplaceableTextures\\CommandButtons\\BTNIceCrownObelisk.blp")
      call this.AddQuestItem(QuestItemBuild.create('n0BA', 2))
      return this
    endmethod
  endstruct

endlibrary