library QuestSapphiron requires QuestData, ScourgeSetup

  globals
    private constant integer SAPPHIRON_ID = 'ubdd'
    private constant integer SAPPHIRON_RESEARCH = 'R025'
  endglobals

  struct QuestSapphiron extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "萨菲隆已死，并在天灾军团的命令下被复活成为了一只强大的冰霜巨龙。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得半英雄萨菲隆和冰霜巨龙"
    endmethod

    private method OnComplete takes nothing returns nothing
      call CreateUnit(this.Holder.Player, SAPPHIRON_ID, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()), GetUnitFacing(GetTriggerUnit()))
      call SetPlayerTechResearched(this.Holder.Player, SAPPHIRON_RESEARCH, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(SAPPHIRON_RESEARCH, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("萨菲隆", "杀死蓝龙-萨菲隆，让克尔苏加德将她复活成一只冰霜巨龙。在诺森德可以找到萨菲隆.", "ReplaceableTextures\\CommandButtons\\BTNFrostWyrm.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_SAPPHIRON))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_KELTHUZAD, false))
      return this
    endmethod
  endstruct

endlibrary