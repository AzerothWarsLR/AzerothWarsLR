//Chen Stormstout joins the Warsong when a Warsong unit approaches him.
library QuestChenStormstout requires QuestData, StormwindSetup, GeneralHelpers

  globals
    private constant integer CHEN_RESEARCH = 'R037'
    private constant integer CHEN_ID = 'Nsjs'
  endglobals

  struct QuestChenStormstout extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "陈·风暴烈酒加入了" + this.Holder.Team.Name + "。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得英雄陈·风暴烈酒"
    endmethod

    private method OnFail takes nothing returns nothing
      call RemoveUnit(gg_unit_Nsjs_1887)
    endmethod

    private method OnComplete takes nothing returns nothing
      call RemoveUnit(gg_unit_Nsjs_1887)
      call SetPlayerTechResearched(Holder.Player, CHEN_RESEARCH, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(CHEN_RESEARCH, UNLIMITED)
      call this.Holder.ModObjectLimit(CHEN_ID, 1)
      call SetUnitInvulnerable(gg_unit_Nsjs_1887, true)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("流浪的酿酒大师", "谣传有一种来自另外一个大陆的奇怪白毛生物。也许它能说服加入部落。", "ReplaceableTextures\\CommandButtons\\BTNPandarenBrewmaster.blp")
      call this.AddQuestItem(QuestItemAnyUnitInRect.create(gg_rct_Chen, "陈·风暴烈酒", false))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary