library QuestDemonGateMonastery requires QuestData, LegionConfig

  globals
    private constant integer DEMONGATE_ID = 'ndmg'
  endglobals

  struct QuestDemonGateMonastery extends QuestData
    private QuestItemKillUnit questItemKillMonastery

    private method operator CompletionPopup takes nothing returns string
      return "The great Scarlet Monastery has fallen, and from its ashes rises an even greater Demon Gate."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Gain a new Demon Gate"
    endmethod

    private method OnComplete takes nothing returns nothing
      call CreateUnit(Holder.Player, DEMONGATE_ID, GetUnitX(this.questItemKillMonastery.TargetUnit), GetUnitY(this.questItemKillMonastery.TargetUnit), 270.)
      call SetDoodadAnimationRectBJ( "hide", 'YObb', gg_rct_ScarletMonastery )
      call SetDoodadAnimationRectBJ( "hide", 'ZSab', gg_rct_ScarletMonastery )
      call SetDoodadAnimationRectBJ( "hide", 'YOsw', gg_rct_ScarletMonastery )
      call SetDoodadAnimationRectBJ( "show", 'LOsm', gg_rct_ScarletMonastery )
      call SetDoodadAnimationRectBJ( "hide", 'YOlp', gg_rct_ScarletMonastery )
      call SetDoodadAnimationRectBJ( "hide", 'ZCv2', gg_rct_ScarletMonastery )
      call SetDoodadAnimationRectBJ( "hide", 'ZCv1', gg_rct_ScarletMonastery )
      call SetDoodadAnimationRectBJ( "show", 'ZCv1', gg_rct_ScarletMonastery )
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("A Scarlet Rift", "The energies surrounding the Scarlet Monastery are extraordinary. Destroy this bastion of light to fabricate a Demon Gate in its place.", "ReplaceableTextures\\CommandButtons\\BTNMaskOfDeath.blp")
      set this.questItemKillMonastery = this.AddQuestItem(QuestItemKillUnit.create(gg_unit_h00T_0786))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_LEGION.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary