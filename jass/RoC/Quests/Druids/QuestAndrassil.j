library QuestAndrassil requires QuestData, ControlPoint, DruidsSetup

  globals
    private constant integer RESEARCH_ID = 'R002'
    private constant integer URSOC_ID = 'E00A'
  endglobals

  struct QuestAndrassil extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "随着诺森德最终摆脱了巫妖王的影响，重新种下安达希尔的时机已经来临，希望它能帮助开垦这片贫瘠的土地。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "在灰熊丘陵的新首都可以研究利爪德鲁伊的一个强大升级，并解锁长者祭坛内的英雄乌索克。"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, RESEARCH_ID, 1)
      call CreateUnit(Holder.Player, 'n04F', GetRectCenterX(gg_rct_Andrassil), GetRectCenterY(gg_rct_Andrassil), 0)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.ModObjectLimit('R05X', UNLIMITED)
      call Holder.ModObjectLimit(URSOC_ID, 1)
      call Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("雪原之冠", "很久之前范达尔鹿盔从诺达希尔上砍下了一颗树苗并在诺森德种下了安达希尔。没有守护巨龙的祝福让它落入了古神的腐化之中。如果诺森德被收复的话，安达希尔就可以重新开始生长了。", "ReplaceableTextures\\CommandButtons\\BTNTreant.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_LICHKING))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n03U')))
      call this.AddQuestItem(QuestItemAnyUnitInRect.create(gg_rct_GrizzlyHills, "灰熊丘陵", true))
      return this
    endmethod
  endstruct

endlibrary