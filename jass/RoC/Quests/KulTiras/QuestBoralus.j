library QuestBoralus requires QuestData, ScarletSetup

  globals
    private constant integer QUEST_RESEARCH_ID = 'R00L'   //This research is given when the quest is completed
  endglobals

  struct QuestBoralus extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Kul'Tiras has joined the war and its military is now free to assist the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Kul'Tiras and enables Katherine Proodmoure to be trained at the altar"
    endmethod

    private method GrantKulTiras takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in KulTiras
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Kultiras, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) and GetUnitFoodUsed(u) != 10  then
          call UnitRescue(u, whichPlayer)
        else
          if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, Player(PLAYER_NEUTRAL_PASSIVE))
          endif
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null      
    endmethod

    private method OnFail takes nothing returns nothing
      call this.GrantKulTiras(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantKulTiras(this.Holder.Player)
      if GetLocalPlayer() == this.Holder.Player then
        call PlayThematicMusicBJ( "war3mapImported\\KultirasTheme.mp3" )
      endif
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The City at Sea", "Proudmoore is stranded at sea, rejoin Boralus to gain the city ", "ReplaceableTextures\\CommandButtons\\BTNHumanShipyard.blp")
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_ADMIRAL, gg_rct_Kultiras, "Kul'tiras"))
      call this.AddQuestItem(QuestItemExpire.create(1465))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary