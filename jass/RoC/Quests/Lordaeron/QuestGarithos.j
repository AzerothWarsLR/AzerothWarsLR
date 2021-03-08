//Garithos is spawned spawns after a timer expires.
library QuestGarithos requires QuestData, LordaeronConfig, LegendLordaeron

  globals
    private constant integer HERO_ID = 'Hlgr'
    private constant integer RESEARCH_ID = 'R01E'
  endglobals

  struct QuestGarithos extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Grand General Othmar Garithos has finally arrived with reinforcements."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "24 Knights and you can train Garithos from the Altar of Kings"
    endmethod

    private method OnComplete takes nothing returns nothing
      call CreateUnits(this.Holder.Player, 'hkni', GetRectCenterX(gg_rct_Garithos), GetRectCenterY(gg_rct_Garithos), 270, 24)
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.modObjectLimit(RESEARCH_ID, UNLIMITED)
      call Holder.modObjectLimit(HERO_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Grand Marshal", "The Kingdom of Lordaeron is in a dire situation. Grand Marshal Othmar Garithos is on his way, accompanied by a small army.", "ReplaceableTextures\\CommandButtons\\BTNGarithos.blp")
      call this.AddQuestItem(QuestItemTime.create(900))
      return this
    endmethod
  endstruct

endlibrary