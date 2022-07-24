library QuestGadgetzan requires QuestData, GoblinSetup, QuestItemKillUnit

  globals
    private constant integer QUEST_RESEARCH_ID = 'R07E'   //This research is given when the quest is completed
  endglobals

  struct QuestGadgetzan extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "解锁诺格弗格并且加基森现在可以自由支援" + this.Holder.Team.Name + "。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得加基森所有单位和建筑，并允许在祭坛内可以召唤诺格弗格。"
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
    endmethod

    private method OnAdd takes nothing returns nothing
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("加基森", "加基森是在卡利姆多的完美立足点。", "ReplaceableTextures\\CommandButtons\\BTNHeroAlchemist.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n05C')))
      call this.AddQuestItem(QuestItemExpire.create(1522))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary