library QuestSummonKil requires QuestData

  globals
    private constant integer RITUAL_ID = 'A0R7'
  endglobals

  struct QuestSummonKil extends QuestData
    private method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "欺诈者基尔加丹已经被召唤到艾泽拉斯"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "英雄基尔加丹"
    endmethod

    private method OnComplete takes nothing returns nothing
      call UnitRemoveAbilityBJ( 'A0R7', LEGEND_KAEL.Unit)
      call LEGEND_KILJAEDEN.Spawn(FACTION_QUELTHALAS.Player, GetRectCenterX(gg_rct_Sunwell), GetRectCenterY(gg_rct_Sunwell), 244)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("欺诈者", "欺诈者基尔加丹已经密谋了很久，凯尔最终会召唤他并摧毁艾泽拉斯吗？", "ReplaceableTextures\\CommandButtons\\BTNKiljaedin.blp")
      call this.AddQuestItem(QuestItemChannelRect.create(gg_rct_KaelSunwellChannel, "太阳井", LEGEND_KAEL, 180, 270))
      return this
    endmethod
  endstruct

endlibrary