//When Black Temple is destroyed, Stormwind can train Khadgar.
library QuestKhadgar requires QuestData, StormwindSetup, GeneralHelpers

  globals
    private constant integer HERO_ID = 'H05Y'
  endglobals

  struct QuestKhadgar extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "卡德加已经被从黑暗神殿的束缚中解放出来，他现在可以为暴风王国服务了"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "允许在国王祭坛内召唤卡德加"
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.ModObjectLimit(HERO_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("永恒岗哨守护者", "在第二次战争结束时，卡德加留在了德拉诺封印黑暗之门并结束了战争。从那之后他便一直被困在外域的深处。", "ReplaceableTextures\\CommandButtons\\BTNMageWC2.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_BLACKTEMPLE, false))
      set this.ResearchId = 'R016'
      return this
    endmethod
  endstruct

endlibrary