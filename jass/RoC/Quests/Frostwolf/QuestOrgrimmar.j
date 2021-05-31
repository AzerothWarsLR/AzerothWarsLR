library QuestOrgrimmar requires QuestData, FrostwolfSetup

  globals
    private constant integer STRUCTURE_ID = 'u00U'
    private constant integer HERO_ID = 0
    private constant integer ALTAR_ID = 0
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
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("To Tame a Land", "The Orcs led by Thrall grew up in human internment camps, and have never had a land to call their own. The untamed lands of Kalimdor are ripe for settlement.", "ReplaceableTextures\\CommandButtons\\BTNFortress.blp")
      call this.AddQuestItem(QuestItemUpgrade.create(STRUCTURE_ID))
      set this.ResearchId = 0
      return this
    endmethod
  endstruct

endlibrary