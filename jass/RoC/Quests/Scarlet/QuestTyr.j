library QuestTyr requires QuestData, ScarletSetup

 globals
    private constant integer QUEST_RESEARCH_ID = 'R03R'   //This research is given when the quest is completed
  endglobals

  struct QuestTyr extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Tyr Hand has joined the war and its military is now free to assist the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Tyr Hand"
    endmethod

    private method GrantTyr takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Tyr
      call GroupEnumUnitsInRect(tempGroup, gg_rct_TyrUnlock, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) and GetUnitFoodUsed(u) != 10  then
          call UnitRescue(u, whichPlayer)
        else 
          call UnitRescue(u, Player(PLAYER_NEUTRAL_PASSIVE))
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null      
    endmethod

    private method OnFail takes nothing returns nothing
      call this.GrantTyr(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantTyr(this.Holder.Player)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Scarlet Enclave", "Tyr's Hand are neutral for the moment, but when the time is right, they will align themselves with the Scarlet Crusade", "ReplaceableTextures\\CommandButtons\\BTNCastle.blp")
      call this.AddQuestItem(QuestItemTime.create(1000))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary