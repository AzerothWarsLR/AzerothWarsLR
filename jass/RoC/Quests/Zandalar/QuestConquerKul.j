library QuestConquerKul requires LegendNeutral, LegendKultiras, TrollSetup

  globals
    private constant integer QUEST_RESEARCH_ID = 'R08D'   //This research is given when the quest is completed
  endglobals

  struct QuestConquerKul extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Before setting sails we need to conquer Kul'tiras"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Unlock shipyards and 750 gold"
    endmethod

    private method operator FailurePopup takes nothing returns string
      return "Zandalar has fallen"
    endmethod

    private method operator FailureDescription takes nothing returns string
      return "You can no longer build shipyards, but you unlock Zulfarrak"
    endmethod

    private method OnFail takes nothing returns nothing
      set FACTION_KULTIRAS.Team = TEAM_ALLIANCE
      set FACTION_TROLL.Team = TEAM_HORDE
      call ReviveHero(LEGEND_PRIEST.Unit, -9160, -17544, true)
      call ReviveHero(LEGEND_RASTAKHAN.Unit, -9160, -17544, true)
      call LEGEND_PRIEST.Spawn(this.Holder.Player, -9160, -17544, 110)
      call LEGEND_RASTAKHAN.Spawn(this.Holder.Player, -9160, -17544, 110)
      call SetUnitOwner(LEGEND_PRIEST.Unit, Player(PLAYER_NEUTRAL_PASSIVE), true)
      call SetUnitOwner(LEGEND_RASTAKHAN.Unit, Player(PLAYER_NEUTRAL_PASSIVE), true)
      call this.Holder.obliterate()
      call SetUnitOwner(LEGEND_PRIEST.Unit, this.Holder.Player, true)
      call SetUnitOwner(LEGEND_RASTAKHAN.Unit, this.Holder.Player, true)

      call TriggerExecute( gg_trg_SecondChanceAction)
      if GetLocalPlayer() == this.Holder.Player then
        call SetCameraPosition(GetRectCenterX(gg_rct_TrollSecondChance), GetRectCenterY(gg_rct_TrollSecondChance))
      endif
      call AdjustPlayerStateBJ( 1500, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
      call AdjustPlayerStateBJ( 2000, this.Holder.Player, PLAYER_STATE_RESOURCE_LUMBER )
    endmethod

    private method OnComplete takes nothing returns nothing
        call AdjustPlayerStateBJ( 750, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
        set FACTION_KULTIRAS.Team = TEAM_ALLIANCE
        set FACTION_TROLL.Team = TEAM_HORDE
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Conquer Boralus", "The Kul'tiran people and their fleet have been a threat to the Zandalari Empire for ages, it is time to put them to rest. ", "ReplaceableTextures\\CommandButtons\\BTNGalleonIcon.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_DAZARALOR, true))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_BORALUS))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary