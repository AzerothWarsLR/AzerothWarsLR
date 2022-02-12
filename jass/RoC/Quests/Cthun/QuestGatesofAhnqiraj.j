library QuestGatesofAhnqiraj requires QuestData, QuestItemKillUnit

  struct QuestGatesofAhnqiraj extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "The Old God C'thun has awaken and is now ready to unleash the Qiraji on the world of Azeorth."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Gain control of C'thun and enable you to open the Gates of Ahn'qiraj"
    endmethod

    private method OnComplete takes nothing returns nothing
      call WaygateActivateBJ(true, gg_unit_h03V_3441)
      call ShowUnitShow(gg_unit_h03V_3441)
      call WaygateSetDestinationLocBJ(gg_unit_h03V_3441, GetRectCenter(gg_rct_WorldTunnelEntrance))
      call WaygateActivateBJ(true, gg_unit_h03V_3449)
      call ShowUnitShow(gg_unit_h03V_3449)
      call WaygateSetDestinationLocBJ(gg_unit_h03V_3449, GetRectCenter(gg_rct_WorldTunnelExit))
      call SetUnitInvulnerable(gg_unit_h02U_2413, false)
      call PlayThematicMusicBJ("war3mapImported\\CthunTheme.mp3")
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Gates of Ahn'Qiraj", "At the conclusion of the War of the Shifting Sands, the Dragonflights sealed the Qiraji behind the Scarab Wall. Now centuries later, C'thun is once again ready to open the gates to his ancient empire.", "ReplaceableTextures\\CommandButtons\\BTNScarabMedal.blp")
      call this.AddQuestItem(QuestItemCastSpell.create('A0O1', true))
      return this
    endmethod
  endstruct

endlibrary