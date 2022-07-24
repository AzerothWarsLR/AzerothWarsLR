library QuestMaievOutland requires Persons, QuelthalasSetup, GeneralHelpers

  struct QuestMaievOutland extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "玛维的外域前哨基地已经建造完成。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得玛维的外域前哨基地所有单位和建筑并将玛维移动到外域"
    endmethod    

    private method OnComplete takes nothing returns nothing
      call SetUnitPosition(LEGEND_MAIEV.Unit, -5252, -27597)
      call UnitRemoveAbilityBJ( 'A0J5', LEGEND_MAIEV.Unit)
      call RescueUnitsInGroup(udg_MaievUnlockOutland, this.Holder.Player)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("复仇的驱使", "玛维复仇的欲望驱使她一路追逐伊利丹，直到另一个世界。", "ReplaceableTextures\\CommandButtons\\BTNMaievArmor.blp")
      call this.AddQuestItem(QuestItemCastSpell.create('A0J5', true))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_MAIEV, true))
      return this
    endmethod
  endstruct

endlibrary