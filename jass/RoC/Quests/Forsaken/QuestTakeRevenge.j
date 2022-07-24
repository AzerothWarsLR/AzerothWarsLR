library QuestTakeRevenge requires QuestData, ForsakenSetup, GeneralHelpers

  struct QuestTakeRevenge extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "随着巫妖王的逝世，希尔瓦娜斯的复仇终于完成了。她吸收了他的力量，成为了女妖之王"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "希尔瓦娜斯获得20点智力、力量和混乱攻击"
    endmethod

    private method OnComplete takes nothing returns nothing
      local unit whichUnit = LEGEND_SYLVANASV.Unit
      call BlzSetUnitName(whichUnit, "女妖之王")
      call AddSpecialEffectTarget("war3mapImported\\SoulArmor.mdx", whichUnit, "chest")
      call BlzSetUnitWeaponIntegerField(whichUnit, UNIT_WEAPON_IF_ATTACK_ATTACK_TYPE, 0, 5) //Chaos
      call AddHeroAttributes(whichUnit, 20, 0, 20)
      call LEGEND_SYLVANASV.ClearUnitDependencies()
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("冷酷的复仇", "希尔瓦娜斯渴望向巫妖王复仇。杀了他并吸收他的力量也许可以满足她内心的空虚", "ReplaceableTextures\\CommandButtons\\BTNHelmofdomination.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0BC')))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_SYLVANASV, true))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_LICHKING))
      return this
    endmethod
  endstruct

endlibrary