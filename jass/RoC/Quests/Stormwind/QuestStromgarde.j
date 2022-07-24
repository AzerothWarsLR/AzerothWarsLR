library QuestStromgarde requires QuestData, StormwindSetup, LegendNeutral, GeneralHelpers

  globals
    private constant integer HERO_ID = 'H00Z'
    private constant integer RESEARCH_ID = 'R01M'
  endglobals

  struct QuestStromgarde extends QuestData
    private QuestItemAnyUnitInRect questItemAnyUnitInRect = 0

    private method operator CompletionPopup takes nothing returns string
      return "加林·托尔贝恩已经承诺加入暴风城"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得激流堡所有单位和建筑，神器托卡拉尔，并允许在国王祭坛内召唤加林·托尔贝恩"
    endmethod

    private method GiveStromgarde takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u
      //Transfer all Neutral Passive units in Stromgarde
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Stromgarde, null)
      loop
        set u = FirstOfGroup(tempGroup)
        exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, whichPlayer)
        endif
        call GroupRemoveUnit(tempGroup, u)
      endloop
      //Cleanup
      call DestroyGroup(tempGroup)
      set tempGroup = null
    endmethod

    private method OnFail takes nothing returns nothing
      call this.GiveStromgarde(Player(PLAYER_NEUTRAL_AGGRESSIVE))
      call SetItemPosition(ARTIFACT_TROLKALAR.item, 14088.9, 1236.3)
      call ARTIFACT_TROLKALAR.setStatus(ARTIFACT_STATUS_GROUND)
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GiveStromgarde(this.Holder.Player)
      call UnitAddItemSafe(this.questItemAnyUnitInRect.TriggerUnit, ARTIFACT_TROLKALAR.item)
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
      call Holder.ModObjectLimit(HERO_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("激流堡", "尽管激流堡的实力自阿拉索帝国时代以来已经减弱，但它仍然是人类的重要堡垒。他们可以被说服动员他们的力量来支援暴风城.", "ReplaceableTextures\\CommandButtons\\BTNTheCaptain.blp")
      set this.questItemAnyUnitInRect = QuestItemAnyUnitInRect.create(gg_rct_Stromgarde, "激流堡", true)
      call this.AddQuestItem(this.questItemAnyUnitInRect)
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary