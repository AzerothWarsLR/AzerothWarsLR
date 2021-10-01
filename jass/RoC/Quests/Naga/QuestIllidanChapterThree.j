//Escapes Kalimdor, Find the Skull of Guldan
library QuestIllidanChapterThree requires QuestData, QuestItemLegendReachRect, QuestItemLegendDead, LegendNaga

   globals
    private constant integer RITUAL_ID = 'A0KY'
  endglobals
 
  struct QuestIllidanChapterThree extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "Illidan must awaken the Naga from the depth of the ocean"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Nazjatar and the Naga's loyalty"
    endmethod

    private method GrantNagaSmall takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Nagastarting base
      call GroupEnumUnitsInRect(tempGroup, gg_rct_NagaUnlock1, null)
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

    private method OnComplete takes nothing returns nothing
      local QuestData exilePath = QuestExilePath.create()
      call this.GrantNagaSmall(this.Holder.Player)
      call FACTION_NAGA.AddQuest(exilePath)
      set exilePath.Progress = QUEST_PROGRESS_UNDISCOVERED
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Chapter Three: Dwellers from the Deep", "Awakening the Naga's will give Illidan the army he needs to achieve his goals", "ReplaceableTextures\\CommandButtons\\BTNNagaMyrmidon.blp")
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_ILLIDAN, gg_rct_StartQuest3, "the exit"))
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_ILLIDAN, gg_rct_MaelstromAmbient, "the Maelstrom"))
      call this.AddQuestItem(QuestItemCastSpell.create(RITUAL_ID, true))
      return this
    endmethod
  endstruct

endlibrary  