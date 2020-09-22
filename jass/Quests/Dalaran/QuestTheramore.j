library QuestTheramore requires QuestData, DetermineLevel, DalaranConfig

  struct QuestTheramore extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "A sizeable isle off the coast of Dustwallow Marsh has been colonized and dubbed Theramore, marking the first human settlement to be established on Kalimdor."
    endmethod

    private static method GrantToPlayer takes player whichPlayer returns nothing
      loop
        set u = FirstOfGroup(TheramoreUnits)
        exitwhen u == null
        call UnitRescue(u, whichPlayer)
        call GroupRemoveUnit(TheramoreUnits, u)
      endloop
      call DestroyGroup(TheramoreUnits)
    endmethod

    private method OnComplete takes nothing returns nothing
      call thistype.GrantToPlayer(this.Holder.Player)
    endmethod

    private method OnFail takes nothing returns nothing
      call thistype.GrantToPlayer(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private static method create takes nothing returns nothing
      local thistype this = thistype.allocate("Theramore", "The distant lands of Kalimdor remain untouched by human civilization. If the Third War proceeds poorly, it may become necessary to establish a forward base there.", "ReplaceableTextures\\CommandButtons\\BTNHumanArcaneTower.blp")
      call this.AddQuestItem(QuestItemTime.create(630))
      call this.AddQuestItem(QuestItemHeroInRect.create(gg_rct_Theramore))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      local group tempGroup
      local unit u
      set tempGroup = CreateGroup()
      set TheramoreUnits = CreateGroup()
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Theramore, null)
      loop
        set u = FirstOfGroup(tempGroup)
        exitwhen u == null
        call SetUnitInvulnerable(u, true)
        call SetUnitOwner(u, Player(PLAYER_NEUTRAL_PASSIVE), true)
        call GroupAddUnit(TheramoreUnits, u)
        call GroupRemoveUnit(tempGroup, u)
      endloop
      call DestroyGroup(tempGroup)

      call FACTION_DALARAN.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary