library QuestKilsorrow requires QuestData

  struct QuestKilsorrow extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Kil'sorrow is now established, and its military is now free to assist the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Kil'sorrow and 3 new Demon Gates"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_KilsorrowUnlock, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_KilsorrowUnlock, this.Holder.Player)
      call UnitRescue(gg_unit_n081_4142, FACTION_FEL_HORDE.Player)
    endmethod

    private method OnAdd takes nothing returns nothing
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Kil'sorrow Fortress", "This sinister fortress will serve the Fel Horde well, clear the surrounding lands to establish it", "ReplaceableTextures\\CommandButtons\\BTNFelOrcWatchTower.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n09X')))
      call this.AddQuestItem(QuestItemExpire.create(1452))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary