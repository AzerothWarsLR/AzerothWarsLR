library QuestVaultoftheWardens initializer OnInit requires QuestData, SentinelsConfig

  struct QuestVaultoftheWardens extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "With the Broken Isles and the Tomb of Sargeras secured, work has begun on a maximum security prison named the Vault of the Wardens."
    endmethod

    private method OnComplete takes nothing returns nothing
      call CreateUnit(this.Holder.Player, 'n04G', GetRectCenterX(gg_rct_VaultoftheWardens), GetRectCenterY(gg_rct_VaultoftheWardens), 220)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Vault of the Wardens", "In millenia past, the most vile entities of Azeroth were imprisoned in a facility near Zin-Ashari. The Broken Isles, now raised from the sea floor, would be a strategic location for a newer edition of such a prison.", "ReplaceableTextures\\CommandButtons\\BTNReincarnationWarden.blp")
      call this.AddQuestItem(QuestItemControlUnit.create(gg_unit_n05Y_0805))
      call this.AddQuestItem(QuestItemControlUnit.create(gg_unit_n00J_3344))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_SENTINELS.AddQuest(QuestVaultoftheWardens.create())
  endfunction

endlibrary