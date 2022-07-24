library QuestTyr requires QuestData, ScarletSetup

 globals
    private constant integer RESEARCH_ID = 'R03R'   //This research is given when the quest is completed
  endglobals

  struct QuestTyr extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "提尔之手加入了战争，其军队现在可以自由协助" + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得提尔之手内所有单位和建筑"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_TyrUnlock, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_TyrUnlock, this.Holder.Player)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("血色飞地", "提尔之手暂时是中立的，但当时机成熟时，他们将与血色十字军结盟", "ReplaceableTextures\\CommandButtons\\BTNCastle.blp")
      call this.AddQuestItem(QuestItemTime.create(1000))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary