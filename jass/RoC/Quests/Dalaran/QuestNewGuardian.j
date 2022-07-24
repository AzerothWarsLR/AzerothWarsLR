library QuestNewGuardian requires LegendDalaran, Display, GeneralHelpers

  struct QuestNewGuardian extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "达拉然已经认可吉安娜成为新的提瑞斯法守护者，赋予她提瑞斯法议会的部分权利。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "吉安娜获得混乱攻击、20点额外智力、传送和魔法盾"
    endmethod

    private method OnComplete takes nothing returns nothing
      local unit whichUnit = LEGEND_JAINA.Unit
      call UnitRemoveAbilityBJ( 'A0RB', LEGEND_JAINA.Unit)
      call AddSpecialEffectTarget("war3mapImported\\Soul Armor Cosmic.mdx", whichUnit, "chest")
      call BlzSetUnitName(whichUnit, "提瑞斯法守护者")
      call UnitAddAbility(whichUnit, 'A0BX') //Guardian of Tirisfal Spellbook
      call BlzSetUnitWeaponIntegerField(whichUnit, UNIT_WEAPON_IF_ATTACK_ATTACK_TYPE, 0, 5) //Chaos
      call AddHeroAttributes(whichUnit, 0, 0, 20)
      call LEGEND_JAINA.ClearUnitDependencies()
      set LEGEND_JAINA.PermaDies = false
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("提瑞斯法守护者", "麦迪文的死让艾泽拉斯失去了守护者。他留下的法术书可以用来强化出一名新的守护者。", "ReplaceableTextures\\CommandButtons\\BTNAstral Blessing.blp")
      call this.AddQuestItem(QuestItemLegendLevel.create(LEGEND_JAINA, 15))
      call this.AddQuestItem(QuestItemLegendHasArtifact.create(LEGEND_JAINA, ARTIFACT_BOOKOFMEDIVH))
      return this
    endmethod
  endstruct

endlibrary