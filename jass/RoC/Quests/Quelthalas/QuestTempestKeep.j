library QuestTempestKeep requires Persons, QuelthalasSetup, GeneralHelpers

  globals
    private constant integer QUEST_RESEARCH_ID = 'R073'   //This research is given when the quest is completed
  endglobals

  struct QuestTempestKeep extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "The TempestKeep have been constructed."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of the TempestKeep"
    endmethod    

    private method GiveTempestKeep takes player whichPlayer returns nothing
      local unit u

      //Transfer all Neutral Passive units in TempestKeep to one of the above factions
      set u = FirstOfGroup(udg_TempestKeep)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) and GetUnitFoodUsed(u) != 10  then
          call UnitRescue(u, whichPlayer)
        else
          if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, Player(PLAYER_NEUTRAL_PASSIVE))
          endif
        endif
        call GroupRemoveUnit(udg_TempestKeep, u)
        set u = FirstOfGroup(udg_TempestKeep)
      endloop

      //Cleanup
      call DestroyGroup(udg_TempestKeep)
    endmethod

    private method OnComplete takes nothing returns nothing
      call FACTION_QUELTHALAS.AddQuest(SUMMON_KIL)
      set SUMMON_KIL.Progress = QUEST_PROGRESS_UNDISCOVERED
      call FACTION_QUELTHALAS.AddQuest(GREAT_TREACHERY)
      set GREAT_TREACHERY.Progress = QUEST_PROGRESS_UNDISCOVERED
      call FACTION_QUELTHALAS.AddQuest(STAY_LOYAL)
      set STAY_LOYAL.Progress = QUEST_PROGRESS_UNDISCOVERED
      call FACTION_QUELTHALAS.modObjectLimit('H00Q',-UNLIMITED)       //Anasterian
      call FACTION_QUELTHALAS.modObjectLimit('Hvwd',-UNLIMITED)       //Sylvanas
      call FACTION_QUELTHALAS.modObjectLimit('n075',-UNLIMITED)       //Vareesa
      call FACTION_QUELTHALAS.modObjectLimit('n00A',-UNLIMITED)       //Farstrider
      call FACTION_QUELTHALAS.modObjectLimit('hhes',-UNLIMITED)       //Swordsman
      call FACTION_QUELTHALAS.modObjectLimit('nbel',UNLIMITED)        //Sunfury
      call FACTION_QUELTHALAS.modObjectLimit('n09S',6)               //Ranger
      call FACTION_QUELTHALAS.modObjectLimit('n02F',6)               //Felblood Warlock
      call FACTION_QUELTHALAS.modObjectLimit('e01B',6)               //Arcane Anihilator

      call SetUnitOwner(LEGEND_KAEL.Unit, Player(PLAYER_NEUTRAL_PASSIVE), true)
      call SetUnitOwner(LEGEND_LORTHEMAR.Unit, Player(PLAYER_NEUTRAL_PASSIVE), true)
      call this.Holder.obliterate()
      call SetUnitOwner(LEGEND_KAEL.Unit, FACTION_QUELTHALAS.Player, true)
      call SetUnitOwner(LEGEND_LORTHEMAR.Unit, FACTION_QUELTHALAS.Player, true)
      call SetUnitPosition(LEGEND_KAEL.Unit, 4067, -21695)
      call SetUnitPosition(LEGEND_LORTHEMAR.Unit, 2067, -19395)
      call UnitRemoveAbilityBJ( 'A0IP', LEGEND_KAEL.Unit)
      call this.GiveTempestKeep(this.Holder.Player)
      set this.Holder.Team = TEAM_NAGA
      call UnitAddAbility(LEGEND_KAEL.Unit, 'A0IK')
      call UnitAddAbility(LEGEND_KAEL.Unit, 'A0IF')
      call AdjustPlayerStateBJ( 200, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
      call AdjustPlayerStateBJ( 400, this.Holder.Player, PLAYER_STATE_RESOURCE_LUMBER )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("In Search of Masters", "The Blood Elves are starved for magic, they need to search for more powerful sources of it. Maybe Outland is the answer to their plight", "ReplaceableTextures\\CommandButtons\\BTNBloodelvenWarrior.blp")
      call this.AddQuestItem(QuestItemCastSpell.create('A0IP', true))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_KAEL, true))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary