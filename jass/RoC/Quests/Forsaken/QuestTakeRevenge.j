library QuestTakeRevenge requires QuestData, ForsakenSetup

  struct QuestTakeRevenge extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "With the Lich King eliminated, Sylvanas vengeance is finally complete. She has absorbed his power and has become the Banshee Queen"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Sylvanas gains 20 intelligence, 20 strength and Chaos damage"
    endmethod

    private method OnComplete takes nothing returns nothing
      local unit whichUnit = LEGEND_SYLVANASV.Unit
      call BlzSetUnitName(whichUnit, "Banshee Queen")
      call AddSpecialEffectTarget("war3mapImported\\SoulArmor.mdx", whichUnit, "chest")
      call BlzSetUnitWeaponIntegerField(whichUnit, UNIT_WEAPON_IF_ATTACK_ATTACK_TYPE, 0, 5) //Chaos
      call SetHeroInt(whichUnit, GetHeroInt(whichUnit, false) + 20, true)
      call SetHeroStr(whichUnit, GetHeroStr(whichUnit, false) + 20, true)
      call LEGEND_SYLVANASV.ClearUnitDependencies()
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Cold-Hearted Revenge", "Sylvanas longs to take revenge on the Lich King. Killing him and absorbing his power would maybe satisfy the emptiness inside her", "ReplaceableTextures\\CommandButtons\\BTNHelmofdomination.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0BC')))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_SYLVANASV, true))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_LICHKING))
      return this
    endmethod
  endstruct

endlibrary