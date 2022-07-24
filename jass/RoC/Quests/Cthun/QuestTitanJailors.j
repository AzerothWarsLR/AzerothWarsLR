library QuestTitanJailors requires QuestData, CthunSetup, QuestItemKillUnit, GeneralHelpers

  globals
    private constant integer QUEST_RESEARCH_ID = 'R07B'   //This research is given when the quest is completed
  endglobals

  struct QuestTitanJailors extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "THe titan jailors guarding C'thun's resting place have been destroyed. Now nothing stands between the Qiraji and their master."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Gain control of all units in Ahn'qiraj's inner temple and unlock the awakening spell for C'thun"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_TunnelUnlock, Player(PLAYER_NEUTRAL_AGGRESSIVE))
      call WaygateActivateBJ( true, gg_unit_h03V_0591 )
      call WaygateSetDestinationLocBJ( gg_unit_h03V_0591, GetRectCenter(gg_rct_Silithus_Stone_Interior) )
    endmethod

    private method OnComplete takes nothing returns nothing
      call WaygateActivateBJ( true, gg_unit_h03V_0591 )
      call WaygateSetDestinationLocBJ( gg_unit_h03V_0591, GetRectCenter(gg_rct_Silithus_Stone_Interior) )
      call RescueNeutralUnitsInRect(gg_rct_TunnelUnlock, this.Holder.Player)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Jailors of the Old God", "The Old God C'thun is imprisoned deep within the temple of Ahn'qiraj, defended by mechanical wardens left behind by the Titans.", "ReplaceableTextures\\CommandButtons\\BTNArmorGolem.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_nsgg_1490)) //Golem
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n02K')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n078')))
      call this.AddQuestItem(QuestItemExpire.create(1428))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary