library QuestBusinessExpansion requires QuestData

  globals
    private constant integer QUEST_RESEARCH_ID = 'R07G'   //This research is given when the quest is completed
  endglobals

  struct QuestBusinessExpansion extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "你现在可以建筑船坞和船只了"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "船坞可以建造了"
    endmethod

     private method GrantGadetzan takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Gadetzan
      call GroupEnumUnitsInRect(tempGroup, gg_rct_GadgetUnlock, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, whichPlayer)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null      
    endmethod

    private method OnFail takes nothing returns nothing
      call this.GrantGadetzan(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantGadetzan(this.Holder.Player)
      if GetLocalPlayer() == this.Holder.Player then
        call PlayThematicMusicBJ( "war3mapImported\\GoblinTheme.mp3" )
      endif
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("商业扩张", "贸易大王加里维克斯需要大量的财富来统治未来的地精帝国，他需要在世界各地迅速扩张他的业务", "ReplaceableTextures\\CommandButtons\\BTNGoblinPrince.blp")
      call this.AddQuestItem(QuestItemTrain.create('nzep','o04M', 16))
      call this.AddQuestItem(QuestItemTrain.create('o04S','o04M', 10))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary