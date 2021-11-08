library QuestThirdObelisk requires QuestData, QuestItemKillUnit

  struct QuestThirdObelisk extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "Ny'alotha has been linked to the world of Azeroth permanently."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Ny'alotha portals will be permanently opened and the Old God Yogg'saron will be available to be freed"
    endmethod

    private method OnComplete takes nothing returns nothing
      
      call GroupClear( udg_BlackEmpirePortals )
      call WaygateActivateBJ( true, gg_unit_h03V_0257 )
      call WaygateSetDestinationLocBJ( gg_unit_h03V_0257, GetRectCenter(gg_rct_NyTanaris) )

      call WaygateActivateBJ( true, gg_unit_h03V_1110 )
      call WaygateSetDestinationLocBJ( gg_unit_h03V_1110, GetRectCenter(gg_rct_NyNorth) )

      call WaygateActivateBJ( true, gg_unit_h03V_0396 )
      call WaygateSetDestinationLocBJ( gg_unit_h03V_0396, GetRectCenter(gg_rct_NyHighland) )

      call WaygateActivateBJ( true, gg_unit_n07F_1101 )
      call WaygateSetDestinationLocBJ( gg_unit_n07F_1101, GetRectCenter(gg_rct_Ny_Ulduar_Interior) )

      call WaygateActivateBJ( true, gg_unit_n07F_1001 )
      call WaygateSetDestinationLocBJ( gg_unit_n07F_1001, GetRectCenter(gg_rct_Ny_Silithus_Interior) )

      call WaygateActivateBJ( true, gg_unit_n07F_1069 )
      call WaygateSetDestinationLocBJ( gg_unit_n07F_1069, GetRectCenter(gg_rct_Ny_Twilight_Highlands_Interior) )

      call WaygateActivateBJ( false, gg_unit_h03V_0257 )
    
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Merging of Realities", "The Third Obelisk will finally complete the merging of Ny'alotha with Azeroth, it must be summoned in Tanaris", "ReplaceableTextures\\CommandButtons\\BTNHorrorSoul.blp")
      call this.AddQuestItem(QuestItemBuild.create('n0BA', 3))
      return this
    endmethod
  endstruct

endlibrary