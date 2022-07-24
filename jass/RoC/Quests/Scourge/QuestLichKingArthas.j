library QuestLichKingArthas requires QuestData, ScourgeSetup, Artifact, GeneralHelpers

  struct QuestLichKingArthas extends QuestData
    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "阿尔萨斯自己登上了冰封王座并粉碎了耐奥祖的冰冻监狱。阿尔萨斯的身体和灵魂与耐奥祖合二为一成为了无比强大的巫妖王。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "阿尔萨斯成为巫妖王，但冰封王座将失去能力"
    endmethod

    private method OnComplete takes nothing returns nothing
      call PlayThematicMusicBJ( "Sound\\Music\\mp3Music\\LichKingTheme.mp3" )
      set LEGEND_LICHKING.DeathMessage = "冰冠堡垒被夷为了平地。不幸的是，巫妖王已经离开了他的邪恶王座。"
      set LEGEND_LICHKING.PermaDies = false
      set LEGEND_LICHKING.Hivemind = false
      call UnitRemoveAbility(LEGEND_LICHKING.Unit, 'A0W8')
      call UnitRemoveAbility(LEGEND_LICHKING.Unit, 'A0L3')
      call UnitRemoveAbility(LEGEND_LICHKING.Unit, 'A002')
      call UnitRemoveAbility(LEGEND_LICHKING.Unit, 'A001')
      call BlzSetUnitMaxMana(LEGEND_LICHKING.Unit, 0)
      call BlzSetUnitName(LEGEND_LICHKING.Unit, "冰冠堡垒")
      set LEGEND_ARTHAS.UnitType = 'N023'
      set LEGEND_ARTHAS.PermaDies = true
      set LEGEND_ARTHAS.Hivemind = true
      set LEGEND_ARTHAS.DeathMessage = "强大的巫妖王已经被杀死。失去了巫妖王的领导，亡灵们变得失控了。"
      call SetUnitState(LEGEND_ARTHAS.Unit, UNIT_STATE_LIFE, GetUnitState(LEGEND_ARTHAS.Unit, UNIT_STATE_MAX_LIFE))
      call SetUnitState(LEGEND_ARTHAS.Unit, UNIT_STATE_MANA, GetUnitState(LEGEND_ARTHAS.Unit, UNIT_STATE_MAX_MANA))
      call UnitAddItemSafe(LEGEND_ARTHAS.Unit, ARTIFACT_HELMOFDOMINATION.item)
      set this.Holder.Team = TEAM_SCOURGE
      call UnitRescue(gg_unit_h00O_2516, FACTION_SCOURGE.Player)
      call SetPlayerStateBJ( this.Holder.Player, PLAYER_STATE_FOOD_CAP_CEILING, 250 )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("晋升", "在冰封王座的深处，巫妖王耐奥祖迫切的需要他的勇士将他从主宰之盔束缚中释放出来，并将其力量与天灾最伟大的死亡骑士的力量合并.", "ReplaceableTextures\\CommandButtons\\BTNRevenant.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_ARTHAS, false))
      call this.AddQuestItem(QuestItemLegendLevel.create(LEGEND_ARTHAS, 12))
      call this.AddQuestItem(QuestItemResearch.create('R07X', 'u000'))
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_ARTHAS, gg_rct_LichKing, "冰冠堡垒"))
      return this
    endmethod
  endstruct

endlibrary