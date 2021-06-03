library QuestOrgrimmar requires QuestData, FrostwolfSetup

  globals
    private constant integer STRUCTURE_ID = 'o01B'
    private constant integer HERO_ID = 'Orex'
    private constant integer ALTAR_ID = 'oalt'
  endglobals

  struct QuestOrgrimmar extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The first true Orcish capital on Azeroth has been established. Thrall names it Orgrimmar in honor of his friend and mentor."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "You can summon Rexxar from the " + GetObjectName(ALTAR_ID)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(HERO_ID, 1)
      call this.Holder.modObjectLimit(STRUCTURE_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("To Tame a Land", "The Orcs led by Thrall grew up in human internment camps, and have never had a land to call their own. Now they must forge their own path.", "ReplaceableTextures\\CommandButtons\\BTNFortress.blp")
      call this.AddQuestItem(QuestItemUpgrade.create(STRUCTURE_ID))
      set this.ResearchId = 'R03S'
      return this
    endmethod
  endstruct

endlibrary