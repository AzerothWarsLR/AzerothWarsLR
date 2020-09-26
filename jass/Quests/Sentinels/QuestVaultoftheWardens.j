library QuestVaultoftheWardens requires QuestData, SentinelsConfig

  struct QuestSentinelsKillWarsong extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "With the Broken Isles and the Tomb of Sargeras secured, work has begun on a maximum security prison named the Vault of the Wardens."
    endmethod

    private method OnComplete takes nothing returns nothing
      call CreateUnit(this.Holder.Player, 'n04G', GetRectCenterX(gg_rct_VaultoftheWardens), GetRectCenterY(gg_rct_VaultoftheWardens), 220)
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Vault of the Wardens", "In millenia past, the most vile entities of Azeroth were imprisoned in a facility near Zin-Ashari. The Broken Isles, now raised from the sea floor, would be a strategic location for a newer edition of such a prison.", "ReplaceableTextures\\CommandButtons\\BTNReincarnationWarden.blp")
      call this.AddQuestItem(QuestItemCaptureUnit.create(gg_unit_n05Y_0805))
      call this.AddQuestItem(QuestItemCaptureUnit.create(gg_unit_n00J_3344))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_SENTINELS.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary