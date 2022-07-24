library QuestStrahnbrad requires QuestData, LordaeronSetup, QuestItemControlPoint, QuestItemExpire, QuestItemSelfExists, GeneralHelpers


  struct QuestStrahnbrad extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "斯坦恩布莱德已经被解放"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得斯坦恩布莱德所有建筑和单位"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_StrahnbradUnlock, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_StrahnbradUnlock, this.Holder.Player)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("斯坦恩布莱德保卫战", "斯坦恩布莱德正遭到一些强盗的袭击，干掉他们。", "ReplaceableTextures\\CommandButtons\\BTNFarm.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01C')))
      call this.AddQuestItem(QuestItemExpire.create(1170))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary