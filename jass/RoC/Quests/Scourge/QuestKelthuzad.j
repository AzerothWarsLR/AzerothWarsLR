library QuestKelthuzad requires QuestData, ScourgeSetup, LegendScourge, LegendQuelthalas

  struct QuestKelthuzad extends QuestData
    private method operator CompletionPopup takes nothing returns string
      local string completionPopup = "克尔苏加德通过太阳井无限的魔法能量获得了重生和力量。"
      if FACTION_LEGION != 0 then
        set completionPopup = completionPopup + "他现在有能力召唤燃烧军团了。"
      endif
      return completionPopup
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "克尔苏加德变成了巫妖"
    endmethod

    private method OnComplete takes nothing returns nothing
      set LEGEND_KELTHUZAD.UnitType = UNITTYPE_KELTHUZAD_LICH
      set LEGEND_KELTHUZAD.PermaDies = false
      call SetUnitState(LEGEND_KELTHUZAD.Unit, UNIT_STATE_LIFE, GetUnitState(LEGEND_KELTHUZAD.Unit, UNIT_STATE_MAX_LIFE))
      call SetUnitState(LEGEND_KELTHUZAD.Unit, UNIT_STATE_MANA, GetUnitState(LEGEND_KELTHUZAD.Unit, UNIT_STATE_MAX_MANA))
      call DestroyEffect(AddSpecialEffect("war3mapImported\\Soul Beam Blue.mdx", GetUnitX(LEGEND_KELTHUZAD.Unit), GetUnitY(LEGEND_KELTHUZAD.Unit)))
      call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl", GetUnitX(LEGEND_KELTHUZAD.Unit), GetUnitY(LEGEND_KELTHUZAD.Unit)))
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("超越死亡的生命", "克尔苏加德是诅咒教派的领袖，也是一位非常强大的亡灵巫师。如果他被带到太阳井并浸泡在太阳井的井水中，他将作为一个不朽的巫妖复活.", "ReplaceableTextures\\CommandButtons\\BTNLichVersion2.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_SUNWELL, false))
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_KELTHUZAD, gg_rct_Sunwell, "太阳井"))
      return this
    endmethod
  endstruct

endlibrary