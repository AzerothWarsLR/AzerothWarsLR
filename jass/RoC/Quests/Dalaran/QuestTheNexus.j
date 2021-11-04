library QuestTheNexus requires Persons, DalaranSetup, GeneralHelpers

  struct QuestTheNexus extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "The Nexus powers have been absorbed by Jaina and she joins the Lich King in the eternal ice of Northrend."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "You become the Nexus faction, allied with the Scourge and enemy with everyone else. Jaina becomes much more powerful"
    endmethod    

    private method OnComplete takes nothing returns nothing
      set NEW_GUARDIAN.Progress = QUEST_PROGRESS_FAILED
      set FALLEN_GUARDIAN.Progress = QUEST_PROGRESS_FAILED
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
      set FACTION_SCOURGE.Team = TEAM_SCOURGE
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Nexus", "The new Lich King calls for Jaina, tempts her with power. The Nexus needs a master, and Jaina is perfect for it.", "ReplaceableTextures\\CommandButtons\\BTNBlueDragonNexus.blp")
      call this.AddQuestItem(QuestItemCastSpell.create('A0RB', true))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_JAINA, true))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_NEXUS, false))
      return this
    endmethod
  endstruct

endlibrary