library QuestBlademaster requires QuestData, ScarletSetup

 globals
    private constant integer QUEST_RESEARCH_ID = 'R04U'   //This research is given when the quest is completed
  endglobals

  struct QuestBlademaster extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "We have recaptured the transport ships."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "2 transport ships and the end of the orc attacks"
    endmethod

    private method GrantBlademaster takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Blademaster
      call GroupEnumUnitsInRect(tempGroup, gg_rct_BlademasterUnlock, null)
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
      call this.GrantBlademaster(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantBlademaster(this.Holder.Player)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Remnants of the Second War", "This island is infested by orcs, they have captured the transports. Kill them all", "ReplaceableTextures\\CommandButtons\\BTNHeroBlademaster.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_o00G_1521)) //Blademaster
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary