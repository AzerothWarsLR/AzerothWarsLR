library QuestOrgrimmar requires QuestData, FrostwolfSetup

  globals
    private constant integer STRUCTURE_ID = 'o01B'
    private constant integer HERO_ID = 'Orex'
    private constant integer ALTAR_ID = 'oalt'
  endglobals

  struct QuestOrgrimmar extends QuestData
    private QuestItemUpgrade questItemUpgrade

    private method operator CompletionPopup takes nothing returns string
      return "The first true Orcish capital on Azeroth has been established. Thrall names it Orgrimmar in honor of his friend and mentor."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Orgrimmar becomes a capital if it's in Kalimdor, and you can summon Rexxar from the " + GetObjectName(ALTAR_ID)
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.Holder.modObjectLimit(STRUCTURE_ID, -1)
      if RectContainsUnit(gg_rct_Kalimdor, questItemUpgrade.TriggerUnit) then
        set LEGEND_ORGRIMMAR.Unit = questItemUpgrade.TriggerUnit
        set LEGEND_ORGRIMMAR.IsCapital = true
      endif
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(HERO_ID, 1)
      call this.Holder.modObjectLimit(STRUCTURE_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("To Tame a Land", "The Orcs led by Thrall grew up in human internment camps, and have never had a land to call their own. Now they must forge their own path.", "ReplaceableTextures\\CommandButtons\\BTNFortress.blp")
      set this.questItemUpgrade = QuestItemUpgrade.create(STRUCTURE_ID, 'ofrt')
      call this.AddQuestItem(questItemUpgrade)
      set this.ResearchId = 'R03S'
      return this
    endmethod
  endstruct

endlibrary