library QuestScepterOfTheQueen requires QuestData

  struct QuestScepterOfTheQueenWarsong extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Highborne are no longer implicitly defended by the Night Elven presence at Feathermoon Stronghold. The Horde unleashes their full might against these Night Elven arcanists."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Gain the Scepter of the Queen and turn all units in Dire Maul hostile"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetItemPosition(ARTIFACT_SCEPTEROFTHEQUEEN.item, GetRectCenterX(gg_rct_HighBourne), GetRectCenterY(gg_rct_HighBourne))
      call RescueNeutralUnitsInRect(gg_rct_HighBourne, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Royal Plunder", "Remnants of the ancient Highborne survive within the ruins of Dire Maul. If Feathermoon Stronghold falls, it would become a simple matter to slaughter the Highborne and plunder their artifacts.", "ReplaceableTextures\\CommandButtons\\BTNNagaWeaponUp2.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(LEGEND_FEATHERMOON.Unit))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_WARSONG.AddQuest(thistype.create())
    endmethod
  endstruct

  struct QuestScepterOfTheQueenSentinels extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Shen'dralar, the Highborne survivors of the Sundering, swear allegiance to their fellow Night Elves. As a sign of their loyalty, they offer up an artifact they have guarded for thousands of years: the Scepter of the Queen."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Gain the Scepter of the Queen and control of all units in Dire Maul"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetItemPosition(ARTIFACT_SCEPTEROFTHEQUEEN.item, GetRectCenterX(gg_rct_HighBourne), GetRectCenterY(gg_rct_HighBourne))
      call RescueNeutralUnitsInRect(gg_rct_HighBourne, Player(this.Holder.Player))
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Return to the Fold", "Remnants of the ancient Highborne survive within the ruins of Dire Maul. If Stonemaul falls, it would be safe for them to come out.", "ReplaceableTextures\\CommandButtons\\BTNNagaWeaponUp2.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(LEGEND_STONEMAUL.Unit))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_SENTINELS.AddQuest(thistype.create())
    endmethod
  endstruct  

  private function OnInit takes nothing returns nothing
    //Make the Shen'dralar starting units invulnerable
    local group tempGroup = CreateGroup()
    call GroupEnumUnitsInRect(tempGroup, gg_rct_HighBourne, null)
    loop
      set u = FirstOfGroup(tempGroup)
      if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
        call SetUnitInvulnerable(u, true)
      endif
      call GroupRemoveUnit(tempGroup, u)
      exitwhen u == null
    endloop
  endfunction

endlibrary