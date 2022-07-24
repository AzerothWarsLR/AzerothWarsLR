library QuestJoinAllianceNaga requires Persons, GeneralHelpers

  struct QuestJoinAllianceNaga extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "伊利达雷加入了联盟"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "加入联盟"
    endmethod    

    private method OnComplete takes nothing returns nothing
      call UnitRemoveAbilityBJ( 'A0IG', LEGEND_ALTRUIS.Unit)
      set this.Holder.Team = TEAM_ALLIANCE
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("加入联盟", "随着世界末日威胁的出现，联盟终于接触到了暗夜精灵并邀请他们加入联盟。", "ReplaceableTextures\\CommandButtons\\BTNalliance.blp")
      call this.AddQuestItem(QuestItemCastSpell.create('A0IG', true))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_ALTRUIS, true))
      call this.AddQuestItem(QuestItemResearch.create('R062', 'n055'))
      return this
    endmethod
  endstruct

endlibrary