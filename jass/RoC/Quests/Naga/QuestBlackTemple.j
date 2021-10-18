library QuestBlackTemple requires QuestData, GeneralHelpers

  struct QuestBlackTemple extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Fel horde has joined the Illidari and Magtheridon is dead."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "The Fel Horde will join us and Magtheridon will die"
    endmethod

    private method OnComplete takes nothing returns nothing 
      set FACTION_FEL_HORDE.Team = TEAM_NAGA
      call RemoveUnit(LEGEND_MAGTHERIDON.Unit)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Lord of Outland", "The Fel Horde is weak and complacent, the Illidari will easily conquer them to serve Illidan. ", "ReplaceableTextures\\CommandButtons\\BTNMetamorphosis.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(LEGEND_BLACKTEMPLE.Unit))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n00R')))
      call this.AddQuestItem(QuestItemResearch.create('R063', 'n055'))
      return this
    endmethod
  endstruct

endlibrary