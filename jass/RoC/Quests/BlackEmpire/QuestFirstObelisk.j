library QuestFirstObelisk requires QuestData, QuestItemKillUnit

  struct QuestFirstObelisk extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The first Obelisk has been set. The next one will be summoned in the Twilight Highlands"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "The first Obelisk will be placed in Storm Peaks"
    endmethod

    private method GiveNyalotha takes player whichPlayer returns nothing
      local unit u

      set u = FirstOfGroup(udg_NyalothaGroup1)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, whichPlayer)
        endif
        call GroupRemoveUnit(udg_NyalothaGroup1, u)
        set u = FirstOfGroup(udg_NyalothaGroup1)
      endloop

      //Cleanup
      call DestroyGroup(udg_NyalothaGroup1)
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GiveNyalotha(this.Holder.Player)
      call RemoveDestructable( gg_dest_ATg1_35873 )
      call RemoveDestructable( gg_dest_ATg3_35872 )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The First Obelisk", "The twisted reality of Ny'alotha is disconnected from Azeroth. 3 Obelisks will be needed to link the 2 realities together. The first Obelisk will be planted in Northrend", "ReplaceableTextures\\CommandButtons\\BTNIceCrownObelisk.blp")
      call this.AddQuestItem(QuestItemUpgrade.create('n0AS', 'n0AR'))
      call this.AddQuestItem(QuestItemTrain.create('u02E','n0B6', 1))
      call this.AddQuestItem(QuestItemBuild.create('n0BA', 1))
      return this
    endmethod
  endstruct

endlibrary