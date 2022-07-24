library QuestScepterOfTheQueen initializer OnInit requires QuestData, WarsongSetup, SentinelsSetup, 

  struct QuestScepterOfTheQueenWarsong extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "羽月要塞的暗夜精灵不再能暗中保护上层精灵了。部落将对这些暗夜精灵奥术师释放出他们全部的力量"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得女王权杖并使厄运之槌内的所有单位转为敌对。"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetItemPosition(ARTIFACT_SCEPTEROFTHEQUEEN.item, GetRectCenterX(gg_rct_HighBourne), GetRectCenterY(gg_rct_HighBourne))
      call RescueNeutralUnitsInRect(gg_rct_HighBourne, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("皇家掠夺者", "古老的上层精灵遗迹在厄运之槌的废墟中留存了下来。如果羽月要塞失守，屠杀这些上层精灵并掠夺他们的神器将变得十分简单", "ReplaceableTextures\\CommandButtons\\BTNNagaWeaponUp2.blp")
      call this.AddQuestItem(QuestItemLegendNotPermanentlyDead.create(LEGEND_STONEMAUL))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_FEATHERMOON))
      call this.AddQuestItem(QuestItemAnyUnitInRect.create(gg_rct_HighBourne, "厄运之槌", true))
      return this
    endmethod
  endstruct

  struct QuestScepterOfTheQueenSentinels extends QuestData
    private static integer researchId = 'R02O'

    private method operator CompletionPopup takes nothing returns string
      return "辛德拉，在大分裂中幸存下来的上层精灵们发誓效忠他们的暗夜精灵同伴。为了表示他们诚意，他们献上了一件他们守护了数千年的神器，女王权杖"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得女王权杖和厄运之槌所有单位和建筑"
    endmethod

    private method OnFail takes nothing returns nothing
      call this.Holder.ModObjectLimit(thistype.researchId, -UNLIMITED)
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetItemPosition(ARTIFACT_SCEPTEROFTHEQUEEN.item, GetRectCenterX(gg_rct_HighBourne), GetRectCenterY(gg_rct_HighBourne))
      call RescueNeutralUnitsInRect(gg_rct_HighBourne, this.Holder.Player)
      call SetPlayerTechResearched(this.Holder.Player, thistype.researchId, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(thistype.researchId, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("浪子回头", "古老的上层精灵遗迹在厄运之槌的废墟中留存了下来。如果石锤堡垒被摧毁，他们就可以安全的离开了。", "ReplaceableTextures\\CommandButtons\\BTNNagaWeaponUp2.blp")
      call this.AddQuestItem(QuestItemLegendNotPermanentlyDead.create(LEGEND_FEATHERMOON))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_STONEMAUL))
      call this.AddQuestItem(QuestItemAnyUnitInRect.create(gg_rct_HighBourne, "厄运之槌", true))
      return this
    endmethod
  endstruct  

  private function OnInit takes nothing returns nothing
    //Make the Shen'dralar starting units invulnerable
    local group tempGroup = CreateGroup()
    local unit u
    call GroupEnumUnitsInRect(tempGroup, gg_rct_HighBourne, null)
    loop
      set u = FirstOfGroup(tempGroup)
      exitwhen u == null
      if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
        call SetUnitInvulnerable(u, true)
      endif
      call GroupRemoveUnit(tempGroup, u)
    endloop
  endfunction

endlibrary