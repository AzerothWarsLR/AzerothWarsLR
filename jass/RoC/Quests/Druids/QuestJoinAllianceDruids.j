library QuestJoinAllianceDruid requires Persons, GeneralHelpers

  struct QuestJoinAllianceDruid extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "德鲁伊加入了联盟"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "加入联盟"
    endmethod    


    private method OnComplete takes nothing returns nothing
      call UnitRemoveAbilityBJ( 'A0IG', LEGEND_MALFURION.Unit)
      set this.Holder.Team = TEAM_ALLIANCE
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("加入联盟", "随着世界末日威胁的出现，联盟终于接触到了暗夜精灵并邀请他们加入联盟。", "ReplaceableTextures\\CommandButtons\\BTNalliance.blp")
      call this.AddQuestItem(QuestItemCastSpell.create('A0IG', true))
      return this
    endmethod
  endstruct

endlibrary