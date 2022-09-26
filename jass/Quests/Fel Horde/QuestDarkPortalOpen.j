library QuestDarkPortalOpen requires QuestData, FelHordeSetup, GeneralHelpers

  struct QuestDarkPortalOpen extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod
    
    private method operator CompletionPopup takes nothing returns string
      return "The Dark Portal is now open"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "The Dark Portal is now open"
    endmethod

    private method OpenPortal takes nothing returns nothing
      call SetUnitInvulnerable(gg_unit_n05J_3375, false)
      call WaygateActivateBJ( true, gg_unit_n036_2719 )
      call WaygateSetDestinationLocBJ( gg_unit_n036_2719, GetRectCenter(gg_rct_Dark_Portal_Exit_3) )

      call WaygateActivateBJ( true, gg_unit_n036_2720 )
      call WaygateSetDestinationLocBJ( gg_unit_n036_2720, GetRectCenter(gg_rct_Dark_Portal_Exit_1) )

      call WaygateActivateBJ( true, gg_unit_n036_3291 )
      call WaygateSetDestinationLocBJ( gg_unit_n036_3291, GetRectCenter(gg_rct_Dark_Portal_Entrance_1) )

      call WaygateActivateBJ( true, gg_unit_n036_1065 )
      call WaygateSetDestinationLocBJ( gg_unit_n036_1065, GetRectCenter(gg_rct_Dark_Portal_Exit_2) )

      call WaygateActivateBJ( true, gg_unit_n036_0778 )
      call WaygateSetDestinationLocBJ( gg_unit_n036_0778, GetRectCenter(gg_rct_Dark_Portal_Entrance_3) )

      call WaygateActivateBJ( true, gg_unit_n036_3292 )
      call WaygateSetDestinationLocBJ( gg_unit_n036_3292, GetRectCenter(gg_rct_Dark_Portal_Entrance_2) )
    endmethod
    
    private method OnFail takes nothing returns nothing
      call OpenPortal()
    endmethod

    private method OnComplete takes nothing returns nothing
      call OpenPortal()
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Dark Portal Opens", "The Dark Portal has been opened", "ReplaceableTextures\\CommandButtons\\BTNDarkPortal.blp")
      call this.AddQuestItem(QuestItemTime.create(600))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_EXODARSHIP))
      call this.AddQuestItem(QuestItemExpire.create(785))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary