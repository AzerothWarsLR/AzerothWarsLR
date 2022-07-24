library QuestConsumeTree requires Persons, LegionSetup, GeneralHelpers

  struct QuestConsumeTree extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "阿克蒙德已经吞噬了世界之树并几乎势不可挡"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "通过吞噬世界之树，阿克蒙德将获得巨大的力量。全属性增加80点并将消除德鲁伊阵营。"
    endmethod    

    private method OnComplete takes nothing returns nothing
      local unit whichUnit = LEGEND_ARCHIMONDE.Unit
      call FACTION_DRUIDS.obliterate()
      call BlzSetUnitName(whichUnit, "Devourer of Worlds")
      call AddSpecialEffectTarget("Abilities\\Weapons\\GreenDragonMissile\\GreenDragonMissile.mdl", whichUnit, "hand, right")
      call AddSpecialEffectTarget("Abilities\\Weapons\\GreenDragonMissile\\GreenDragonMissile.mdl", whichUnit, "hand, left")
      call AddHeroAttributes(whichUnit, 50, 50, 50)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("诸神黄昏", "吞噬世界之树将赋予阿克蒙德不可估量的力量并永远地消灭掉作为他死敌的德鲁伊。", "ReplaceableTextures\\CommandButtons\\BTNGlazeroth.blp")
      call this.AddQuestItem(QuestItemChannelRect.create(gg_rct_ArchimondeChannel, "世界之树", LEGEND_ARCHIMONDE, 420, 90))
      return this
    endmethod
  endstruct

endlibrary