library QuestSpiderWar requires QuestData, QuestItemKillUnit, QuestItemExpire, QuestItemSelfExists, GeneralHelpers

  globals
    private constant integer QUEST_RESEARCH_ID = 'R03A'
  endglobals

  struct QuestSpiderWar extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "诺森德和冰冠堡垒现在完全在巫妖王和" + this.Holder.Team.Name + "的控制之下了。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "在冰封王座可以研究瘟疫了，解锁克尔苏加德和瑞文戴尔并在冰冠冰川获得一个基地。"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_Ice_Crown, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_Ice_Crown, this.Holder.Player)
      call SetPlayerTechResearched(Holder.Player, 'R03A', 1) 
      if GetLocalPlayer() == this.Holder.Player then
        call PlayThematicMusicBJ( "war3mapImported\\ScourgeTheme.mp3" )
      endif
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("蜘蛛之战", "骄傲的蛛魔已经向新成立的巫妖王宣战，杀掉他们以控制诺森德大陆。", "ReplaceableTextures\\CommandButtons\\BTNNerubianQueen.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n00I')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n08D')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n00G')))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_NEZARAZRET))
      call this.AddQuestItem(QuestItemUpgrade.create('unp2', 'unpl'))
      call this.AddQuestItem(QuestItemExpire.create(1480))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary