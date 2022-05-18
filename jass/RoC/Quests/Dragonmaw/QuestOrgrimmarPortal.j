library QuestOrgrimmarPortal requires QuestData, QuestItemChannelRect

  struct QuestOrgrimmarPortal extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "Zuluhead has opened the portal to Orgrimmar. Hurry, it will collapse in 3 mins"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Open a Portal between Dragonmaw Port and Orgrimmar"
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
      local thistype this = thistype.allocate("The Reunification of the Horde", "The new Horde in Kalimdor has send a message to the Dragonmaw Clan to join them, Zuluhead will need to open a portal for his people to go through!", "ReplaceableTextures\\CommandButtons\\BTNPortal.blp")
      call this.AddQuestItem(QuestItemChannelRect.create(gg_rct_DragonmawPortal, "Dragonmaw Port", LEGEND_ZULUHED, 180, 300))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_GRIMBATOL, false))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_ORGRIMMAR, false))
      return this
    endmethod
  endstruct

endlibrary