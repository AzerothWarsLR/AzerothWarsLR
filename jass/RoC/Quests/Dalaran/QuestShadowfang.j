library QuestShadowfang requires QuestData, LordaeronSetup, QuestItemKillUnit, GeneralHelpers


  struct QuestShadowfang extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "影牙城堡已经被解放，它的军队现在可以自由的协助" + this.Holder.Team.Name + "了。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得影牙城堡所有单位和建筑的控制权。"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_ShadowfangUnlock, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_ShadowfangUnlock, this.Holder.Player)
    endmethod

    private method OnAdd takes nothing returns nothing
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("银松森林的阴影", "银松森林对旅行者来说并不安全，需要对其进行调查。", "ReplaceableTextures\\CommandButtons\\BTNworgen.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_nwld_0984)) //Worgen
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01D')))
      call this.AddQuestItem(QuestItemExpire.create(1444))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary