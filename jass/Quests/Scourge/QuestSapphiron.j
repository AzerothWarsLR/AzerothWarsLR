library QuestSapphiron requires QuestData, ScourgeConfig

  globals
    private constant integer SAPPHIRON_ID = 'ubdd'
    private constant integer SAPPHIRON_RESEARCH = 'R025'
  endglobals

  struct QuestReanimateSylvanas extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Sapphiron has been slain, and has been reanimated as a mighty Frost Worm under the command of the Scourge."
    endmethod

    private method OnComplete takes nothing returns nothing
      call CreateUnit(this.Holder.Player, SAPPHIRON_ID, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()), GetUnitFacing(GetTriggerUnit()))
      call SetPlayerTechResearched(this.Holder.Player, SAPPHIRON_RESEARCH, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(SAPPHIRON_RESEARCH, UNLIMITED)
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Sapphiron", "Kill Sapphiron the Blue Dragon to reanimate her as a Frost Wyrm. Sapphiron can be found in Northrend.", "ReplaceableTextures\\CommandButtons\\BTNFrostWyrm.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_ubdr_0668))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_SCOURGE.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary