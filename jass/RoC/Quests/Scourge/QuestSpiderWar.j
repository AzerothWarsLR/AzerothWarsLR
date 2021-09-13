library QuestSpiderWar requires QuestData, QuestItemKillUnit

  globals
    private constant integer QUEST_RESEARCH_ID = 'R03A'
  endglobals

  struct QuestSpiderWar extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Northrend is now under full control of the Lich King and the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Access to the Scholomance Research at the Frozen Throne"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, 'R03A', 1) 
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("War of the Spider", "The proud Nerubians have declared war on the newly formed Lich King, destroy them to secure the continent of Northrend.", "ReplaceableTextures\\CommandButtons\\BTNNerubianQueen.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n00I')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n08D')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n00G')))
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_n074_1565)) //Nezar'azret
      return this
    endmethod
  endstruct

endlibrary