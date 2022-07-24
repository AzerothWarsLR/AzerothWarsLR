library QuestOrgrimmarPortal requires QuestData, QuestItemChannelRect

  struct QuestOrgrimmarPortal extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "祖鲁希德开启了一道通往奥格瑞玛的传送门。快点，传送门只能维持三分钟。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "在龙喉港和奥格瑞玛之间开启一道传送门"
    endmethod

    private method OnComplete takes nothing returns nothing
      call WaygateActivateBJ( true, gg_unit_n07E_0816)
      call ShowUnitShow( gg_unit_n07E_0816)
      call WaygateSetDestinationLocBJ( gg_unit_n07E_0816, GetRectCenter(gg_rct_DragonmawPortal) )

      call WaygateActivateBJ( true, gg_unit_n07E_0775)
      call ShowUnitShow( gg_unit_n07E_0775)
      call WaygateSetDestinationLocBJ( gg_unit_n07E_0775, GetRectCenter(gg_rct_OrgrimmarPortal) )
      call TriggerExecute( gg_trg_PortalCollapse )

    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("部落的统一", "卡利姆多的新部落已经向龙吼氏族发出了邀请，祖鲁希德需要打开一个传送门来让他的人民通过。", "ReplaceableTextures\\CommandButtons\\BTNPortal.blp")
      call this.AddQuestItem(QuestItemChannelRect.create(gg_rct_DragonmawPortal, "龙喉港", LEGEND_ZULUHED, 180, 300))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_GRIMBATOL, false))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_ORGRIMMAR, false))
      return this
    endmethod
  endstruct

endlibrary