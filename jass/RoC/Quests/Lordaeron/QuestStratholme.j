library QuestStratholme requires QuestData, LordaeronSetup, QuestItemKillUnit, GeneralHelpers


  struct QuestStratholme extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "斯坦索姆已经被解放，其军队现在可以自由地协助" + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得斯坦索姆所有建筑和单位"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_StratholmeUnlock, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_StratholmeUnlock, this.Holder.Player)
    endmethod

    private method OnAdd takes nothing returns nothing
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("黑石与卷轴", "黑石氏族占领了奥特兰克，为了洛丹伦的安全必须消灭他们。", "ReplaceableTextures\\CommandButtons\\BTNChaosBlademaster.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_o00B_1316)) //Jubei
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n019')))
      call this.AddQuestItem(QuestItemUpgrade.create('hcas', 'htow'))
      call this.AddQuestItem(QuestItemExpire.create(1470))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary