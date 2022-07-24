library QuestReanimateSylvanas requires QuestData, ScourgeSetup, QuelthalasSetup, LegendQuelthalas

  globals
    private constant integer SYLVANAS_ID = 'Usyl'
    private constant integer ALTAR_ID = 'uaod'
  endglobals

  struct QuestReanimateSylvanas extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "奎尔萨拉斯在天灾的屠杀下已经陷落。甚至连奎尔多雷长生的源头太阳井都被污染了。希尔瓦娜斯因为她的顽强抵抗而被禁止拥有一个干净利落的死亡，她被迫成为了第一个高等精灵女妖"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "你现在可以在" + GetObjectName(ALTAR_ID) + "召唤希尔瓦娜斯了"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetUnitAnimation(LEGEND_SUNWELL.Unit, "stand second")
      call SetUnitAnimation(LEGEND_SUNWELL.Unit, "stand third")
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("第一个女妖", "银月城的游侠将军希尔瓦娜斯坚守在天灾军团和太阳井之间。摧毁她的人民，她的灵魂将会被转化为折磨女妖", "ReplaceableTextures\\CommandButtons\\BTNBansheeRanger.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_SUNWELL, false))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_LICHKING, true))
      set this.ResearchId = 'R02D'
      return this
    endmethod
  endstruct

endlibrary