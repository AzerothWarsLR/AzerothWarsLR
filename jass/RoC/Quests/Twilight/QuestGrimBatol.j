library QuestGrimBatol requires QuestData, TwilightSetup, GeneralHelpers

  globals
    private constant integer QUEST_RESEARCH_ID = 'R06Y'   //This research is given when the quest is completed
  endglobals

  struct QuestGrimBatol extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "格瑞姆巴托现在在我们的控制之下，它的军队现在可以自由的协助" + this.Holder.Team.Name + "了。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "控制格瑞姆巴托的所有单位并允许训练兽人死亡骑士单位。"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_Grim_Batol, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetUnitOwner(gg_unit_h01Z_0618, this.Holder.Player, true)
      call WaygateActivateBJ( true, gg_unit_n08R_2209 )
      call WaygateActivateBJ( true, gg_unit_n08R_2214 )
      call RescueNeutralUnitsInRect(gg_rct_Grim_Batol, this.Holder.Player)
    endmethod

    private method OnAdd takes nothing returns nothing
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("被诅咒的堡垒", "山中城格瑞姆巴托将会是暮光之锤氏族的完美堡垒。它在过去很好的发挥了作用，而今后也会继续如此。", "ReplaceableTextures\\CommandButtons\\BTNFortressWC2.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_VAELASTRASZ))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n03X')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n04V')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n09F')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n08T')))
      call this.AddQuestItem(QuestItemExpire.create(1428))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary