//If Grom enters the Warsong Camp area, OR a time elapses, OR someone becomes a solo Horde Path, give the Camp to a Horde player.
library QuestWarsongCamp requires WarsongConfig, FrostwolfConfig, LegendWarsong, GeneralHelpers

  struct QuestWarsongCamp extends QuestData
    private Faction fallbackFaction = 0

    private method operator CompletionPopup takes nothing returns string
      return "Grommash has established a foothold in Ashenvale and is now ready to begin harvesting supplies in earnest."
    endmethod

    private method GiveCamp takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u
      //Transfer all Neutral Passive units in the camp
      call GroupEnumUnitsInRect(tempGroup, gg_rct_WarsongCamp, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, whichPlayer)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop      
      //Cleanup
      call DestroyGroup (tempGroup)
      set tempGroup = null
    endmethod

    private method OnFail takes nothing returns nothing
      if this.FallbackFaction != 0 then
        call this.GiveCamp(this.FallbackFaction.Player)
      else
        call this.GiveCamp(Player(PLAYER_NEUTRAL_AGGRESSIVE))
      endif
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GiveCamp(this.Holder.Player)
    endmethod

    private static method create takes Faction fallbackFaction returns thistype
      local thistype this = thistype.allocate("Warsong Camp", "The forests of Ashenvale seem to be an untapped resource. Establish a foothold there.", "ReplaceableTextures\\CommandButtons\\BTNMercenaryCamp.blp")
      set this.fallbackFaction = fallbackFaction
      call this.AddQuestItem(QuestItemEitherOf.create(QuestItemTime.create(180), QuestItemAnyHeroInRect.create(gg_rct_WarsongCamp)))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      local QuestData newQuest = thistype.create(FACTION_FROSTWOLF)
      call FACTION_WARSONG.AddQuest(newQuest)
      set FACTION_WARSONG.StartingQuest = newQuest
    endmethod
  endstruct

endlibrary