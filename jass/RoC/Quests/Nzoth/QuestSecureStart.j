  library QuestSecureStart requires QuestData, NzothSetup

  struct QuestSecureStart extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "海洋深渊现在由纳沙塔尔控制"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得150黄金并解锁纳沙塔尔的出口"
    endmethod

    private method OnComplete takes nothing returns nothing
      call FACTION_NZOTH.ModObjectLimit('n0C2', -UNLIMITED)   //Pillar of Waves
      call AdjustPlayerStateBJ( 150, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
      call WaygateActivateBJ( true, gg_unit_h01D_3381 )
      call WaygateSetDestinationLocBJ( gg_unit_h01D_3381, GetRectCenter(gg_rct_NazjatarEntrance1) )
      call WaygateActivateBJ( true, gg_unit_h01D_3384 )
      call WaygateSetDestinationLocBJ( gg_unit_h01D_3384, GetRectCenter(gg_rct_NazjatarEntrance2) )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("大海深处", "在我们离开前需要确保海洋深渊的安全，干掉附近的怪物来开启离开纳沙塔尔的出口。", "ReplaceableTextures\\CommandButtons\\BTNSeaTurtleRed.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n05W')))
      call this.AddQuestItem(QuestItemResearch.create('R092', 'n0C9'))
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_ntrd_2592)) //Big Turtle
      return this
    endmethod
  endstruct

endlibrary