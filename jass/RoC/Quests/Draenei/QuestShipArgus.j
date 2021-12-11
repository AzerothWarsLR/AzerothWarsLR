library QuestShipArgus requires QuestData, QuestItemChannelRect

  struct QuestShipArgus extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Velen is now ready to summon a Portal to Argus"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Give Velen the ability to summon a portal to Argus"
    endmethod

    private method OnComplete takes nothing returns nothing
      call UnitAddAbility(LEGEND_VELEN.Unit, 'A00J')
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Reconquering Tempest Keep", "Tempest Keep still has the power to open a portal Argus, but Velen needs to channel it", "ReplaceableTextures\\CommandButtons\\BTNArcaneCastle.blp")
      call this.AddQuestItem(QuestItemChannelRect.create(gg_rct_TempestKeepSpawn, "Tempest Keep", LEGEND_VELEN, 60, 0))
      return this
    endmethod
  endstruct

endlibrary