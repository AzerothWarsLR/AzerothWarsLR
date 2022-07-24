//Stormwind's Construction sites are enabled after a delay.
library QuestConstructionSites requires QuestData, StormwindSetup

  globals
    private constant integer RESEARCH_ID = 'R022'
  endglobals

  struct QuestConstructionSites extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "暴风城的建筑工地现在已经准备好升级"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "你的建筑工地可以升级"
    endmethod

    private method OnComplete takes nothing returns nothing
      if GetLocalPlayer() == this.Holder.Player then
        call PingMinimap(GetUnitX(gg_unit_h053_1121), GetUnitY(gg_unit_h053_1121), 5)
        call PingMinimap(GetUnitX(gg_unit_h055_0035), GetUnitY(gg_unit_h055_0035), 5)
      endif
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("必然的进步", "暴风城尚未完全从第二次战争期间遭受的蹂躏中恢复过来，并等待着重建。", "ReplaceableTextures\\CommandButtons\\BTNGenericHumanBuilding.blp")
      call this.AddQuestItem(QuestItemTime.create(360))
      return this
    endmethod
  endstruct

endlibrary