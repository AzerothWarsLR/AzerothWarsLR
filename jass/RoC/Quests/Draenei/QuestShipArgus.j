library QuestShipArgus requires QuestData, QuestItemChannelRect

  struct QuestShipArgus extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "维纶打开了一道通往阿古斯的传送门"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "在风暴要塞和阿古斯之间建立一道传送门"
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
      local thistype this = thistype.allocate("重征风暴要塞", "风暴要塞仍然有能力打开通往阿古斯的传送门，但需要维纶来开启它。", "ReplaceableTextures\\CommandButtons\\BTNArcaneCastle.blp")
      call this.AddQuestItem(QuestItemChannelRect.create(gg_rct_TempestKeepSpawn, "风暴要塞", LEGEND_VELEN, 180, 0))
      return this
    endmethod
  endstruct

endlibrary