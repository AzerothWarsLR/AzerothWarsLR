library QuestShipArgus requires QuestData, QuestItemChannelRect

  struct QuestShipArgus extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "Velen has opened the portal to Argus"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Open a Portal between Tempest Keep and Argus"
    endmethod

    private method OnComplete takes nothing returns nothing
      call WaygateActivateBJ( true, gg_unit_h03V_3538 )
      call ShowUnitShow( gg_unit_h03V_3538 )
      call WaygateSetDestinationLocBJ( gg_unit_h03V_3538, GetRectCenter(gg_rct_OutlandToArgus) )
      call WaygateActivateBJ( true, gg_unit_h03V_3539 )
      call ShowUnitShow( gg_unit_h03V_3539 )
      call WaygateSetDestinationLocBJ( gg_unit_h03V_3539, GetRectCenter(gg_rct_TempestKeepSpawn) )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Reconquering Tempest Keep", "Tempest Keep still has the power to open a portal Argus, but Velen needs to channel it", "ReplaceableTextures\\CommandButtons\\BTNArcaneCastle.blp")
      call this.AddQuestItem(QuestItemChannelRect.create(gg_rct_TempestKeepSpawn, "Tempest Keep", LEGEND_VELEN, 180, 0))
      return this
    endmethod
  endstruct

endlibrary