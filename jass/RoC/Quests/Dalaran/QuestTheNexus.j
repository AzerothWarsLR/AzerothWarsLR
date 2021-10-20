library QuestTheNexus requires Persons, DalaranSetup, GeneralHelpers

  struct QuestTheNexus extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "The TheNexus have been constructed."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of the The Nexus"
    endmethod    

    private method OnComplete takes nothing returns nothing
      call FACTION_DALARAN.AddQuest(NEW_GUARDIAN)
      set NEW_GUARDIAN.Progress = QUEST_PROGRESS_FAILED
      call FACTION_DALARAN.AddQuest(FALLEN_GUARDIAN)
      set FALLEN_GUARDIAN.Progress = QUEST_PROGRESS_FAILED
      call FACTION_DALARAN.AddQuest(CRYSTAL_GOLEM)
      set CRYSTAL_GOLEM.Progress = QUEST_PROGRESS_FAILED
      call FACTION_DALARAN.modObjectLimit('h069',-UNLIMITED)       //Military Quarters
      call FACTION_DALARAN.modObjectLimit('h067',-UNLIMITED)       //Laboratory
      call FACTION_DALARAN.modObjectLimit('n096',-UNLIMITED)       //Golem
      call FACTION_DALARAN.modObjectLimit('o02U',-UNLIMITED)       //Crystal artillery
      call FACTION_DALARAN.modObjectLimit('n0AD',-UNLIMITED)       //Crystal Golem
      call FACTION_DALARAN.modObjectLimit('h032',-UNLIMITED)       //Battlemage
      call FACTION_DALARAN.modObjectLimit('n007',-UNLIMITED)       //Kirintor
      call FACTION_DALARAN.modObjectLimit('h022',-UNLIMITED)       //Peasant
      call FACTION_DALARAN.modObjectLimit('Hant',-UNLIMITED)       //Antonidas
      call FACTION_DALARAN.modObjectLimit('Haah',-UNLIMITED)       //Mediv
      call FACTION_DALARAN.modObjectLimit('njks',-UNLIMITED)       //Kasan
      call FACTION_DALARAN.modObjectLimit('R06O',-UNLIMITED)       //Phase Blade
      call FACTION_DALARAN.modObjectLimit('R061',-UNLIMITED)       //Forked Lightning
      call RemoveUnit(LEGEND_ANTONIDAS.Unit)
      call RemoveUnit(LEGEND_MEDIVH.Unit)

      call FACTION_DALARAN.modObjectLimit('U026',1)               //Malygos
      call FACTION_DALARAN.modObjectLimit('U027',1)               //Kalecgos

      call FACTION_DALARAN.modObjectLimit('n0A1',6)               //Elite
      call FACTION_DALARAN.modObjectLimit('h09C',UNLIMITED)               //Worker
      call FACTION_DALARAN.modObjectLimit('h099',UNLIMITED)               //Infantry
      call FACTION_DALARAN.modObjectLimit('n0A4',UNLIMITED)               //Dragonspawn
      call FACTION_DALARAN.modObjectLimit('u025',12)               //Elementalist
      call FACTION_DALARAN.modObjectLimit('n09T',6)               //Judicator
      call FACTION_DALARAN.modObjectLimit('h09A',UNLIMITED)               //Nexus
      call FACTION_DALARAN.modObjectLimit('h09B',UNLIMITED)               //Roost

      set LEGEND_JAINA.UnitType = 'H04A'

      call UnitRemoveAbilityBJ( 'A0RB', LEGEND_JAINA.Unit)
      set this.Holder.Team = TEAM_SCOURGE
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Nexus", "The Blood Elves are starved for magic, they need to search for more powerful sources of it. Maybe Outland is the answer to their plight", "ReplaceableTextures\\CommandButtons\\BTNBarracks.blp")
      call this.AddQuestItem(QuestItemCastSpell.create('A0RB', true))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_JAINA, true))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_NEXUS, false))
      return this
    endmethod
  endstruct

endlibrary