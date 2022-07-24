library QuestFreeNerzhul requires QuestData, LegendFrostwolf, FrostwolfSetup

  struct QuestFreeNerzhul extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "耐奥祖最终摆脱了他作为统御之盔持有者的痛苦折磨。在他临死前的最后一刻，他将他的智慧传给了萨尔。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "萨尔获得10点力量，10点敏捷和10点智力"
    endmethod   

    private method OnComplete takes nothing returns nothing
      call AddHeroAttributes(LEGEND_THRALL.Unit, 10, 10, 10)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("被诅咒的狱卒", "在成为巫妖王之前，耐奥祖曾是影月氏族的酋长和老萨满。也许他过去的残存仍然留在了那冰封王座之内。", "ReplaceableTextures\\CommandButtons\\BTNShaman.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(LEGEND_LICHKING.Unit))
      return this
    endmethod
  endstruct

endlibrary