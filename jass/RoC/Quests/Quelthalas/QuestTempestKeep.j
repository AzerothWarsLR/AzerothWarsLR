library QuestTempestKeep requires Persons, QuelthalasSetup, GeneralHelpers

  globals
    private constant integer QUEST_RESEARCH_ID = 'R073'   //This research is given when the quest is completed
  endglobals

  struct QuestTempestKeep extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "风暴要塞已经建造好了."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得风暴要塞"
    endmethod    

    private method OnComplete takes nothing returns nothing
      call SetUnitOwner(LEGEND_KAEL.Unit, Player(PLAYER_NEUTRAL_AGGRESSIVE), true)
      call this.Holder.obliterate()
      call SetUnitOwner(LEGEND_KAEL.Unit, this.Holder.Player, true)
      call FACTION_QUELTHALAS.AddQuest(SUMMON_KIL)
      set SUMMON_KIL.Progress = QUEST_PROGRESS_UNDISCOVERED
      call FACTION_QUELTHALAS.AddQuest(GREAT_TREACHERY)
      set GREAT_TREACHERY.Progress = QUEST_PROGRESS_UNDISCOVERED
      call FACTION_QUELTHALAS.AddQuest(STAY_LOYAL)
      set STAY_LOYAL.Progress = QUEST_PROGRESS_UNDISCOVERED
      call FACTION_QUELTHALAS.ModObjectLimit('H00Q',-UNLIMITED)       //Anasterian
      call FACTION_QUELTHALAS.ModObjectLimit('Hvwd',-UNLIMITED)       //Sylvanas
      call FACTION_QUELTHALAS.ModObjectLimit('n075',-UNLIMITED)       //Vareesa
      call FACTION_QUELTHALAS.ModObjectLimit('n00A',-UNLIMITED)       //Farstrider
      call FACTION_QUELTHALAS.ModObjectLimit('hhes',-UNLIMITED)       //Swordsman
      call FACTION_QUELTHALAS.ModObjectLimit('nbel',UNLIMITED)        //Sunfury
      call FACTION_QUELTHALAS.ModObjectLimit('n09S',6)               //Ranger
      call FACTION_QUELTHALAS.ModObjectLimit('n02F',6)               //Felblood Warlock
      call FACTION_QUELTHALAS.ModObjectLimit('e01B',6)               //Arcane Anihilator

      call FACTION_QUELTHALAS.ModObjectLimit('H00Q',-UNLIMITED)       //Anasterian
      call FACTION_QUELTHALAS.ModObjectLimit('Hvwd',-UNLIMITED)       //sylvanas
      call RemoveUnit(LEGEND_ANASTERIAN.Unit)
      call RemoveUnit(LEGEND_SYLVANAS.Unit)

      call SetUnitPosition(LEGEND_KAEL.Unit, 4067, -21695)
      call SetUnitPosition(LEGEND_LORTHEMAR.Unit, 4067, -21695)
      call UnitRemoveAbilityBJ( 'A0IP', LEGEND_KAEL.Unit)
      call SetPlayerTechResearchedSwap( 'R076', 1, this.Holder.Player )
      call RescueUnitsInGroup(udg_TempestKeep, this.Holder.Player)
      call RescueUnitsInGroup(udg_TempestKeep2, this.Holder.Player)
      set this.Holder.Team = TEAM_NAGA
      call UnitAddAbility(LEGEND_KAEL.Unit, 'A0IK')
      call UnitAddAbility(LEGEND_KAEL.Unit, 'A0IF')
      
      if ( not ( IsUnitHiddenBJ(gg_unit_n07E_1491) == true ) ) then
            call IssueImmediateOrderBJ( LEGEND_KAEL.Unit, "thunderclap" )
      endif

      call AdjustPlayerStateBJ( 2000, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
      call AdjustPlayerStateBJ( 4000, this.Holder.Player, PLAYER_STATE_RESOURCE_LUMBER )
      set this.Holder.Name = "血精灵"
      set this.Holder.Icon = "ReplaceableTextures\\CommandButtons\\BTNBloodMage2.blp"
      if GetLocalPlayer() == this.Holder.Player then
          call SetCameraPosition(GetRectCenterX(gg_rct_TempestKeepSpawn), GetRectCenterY(gg_rct_TempestKeepSpawn))
      endif
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("寻找主人", "血精灵们渴望魔法，他们需要寻找更强大的魔法来源。也许外域是他们困境的答案。", "ReplaceableTextures\\CommandButtons\\BTNBloodelvenWarrior.blp")
      call this.AddQuestItem(QuestItemCastSpell.create('A0IP', true))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_KAEL, true))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary