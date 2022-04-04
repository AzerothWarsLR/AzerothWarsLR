library QuestArgentDawn requires QuestData, ScarletSetup, QuestItemResearch, QuestItemSelfExists, GeneralHelpers

  globals
    private constant integer RESEARCH_ID = 'R088'         //This research is required to complete the quest
    private constant integer QUEST_RESEARCH_ID = 'R087'   //This research is given when the quest is completed
  endglobals

  struct QuestArgentDawn extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "The Argent Dawn has been declared and ready to join the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Unlock your elites, Crusader units and Tirion Fordring"
    endmethod

    private method OnComplete takes nothing returns nothing
      set this.Holder.Name = "Argent"
      set this.Holder.Icon = "ReplaceableTextures\\CommandButtons\\BTNTirionPaladin.blp"
      call SetPlayerTechResearched(FACTION_SCARLET.Player, 'R086', 1)
      call PlayThematicMusicBJ( "war3mapImported\\ScarletTheme.mp3" )

      call FACTION_SCARLET.ModObjectLimit('h08I', -UNLIMITED)           //Crusader
      call FACTION_SCARLET.ModObjectLimit('h09I', UNLIMITED)                 //Argent Crusader

      call FACTION_SCARLET.ModObjectLimit('h08L', -UNLIMITED)           //Cavalier
      call FACTION_SCARLET.ModObjectLimit('h0A3', UNLIMITED)                 //Lilian

      call FACTION_SCARLET.ModObjectLimit('h08J', -UNLIMITED)           //Arbalest
      call FACTION_SCARLET.ModObjectLimit('h09J', UNLIMITED)                 //Lilian
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Argent Dawn", "The Militia of Lordaeron has been solidified into the Argent Dawn, a strong military force lead by Tirion Fording.", "ReplaceableTextures\\CommandButtons\\BTNResurrection.blp")
      call this.AddQuestItem(QuestItemResearch.create(RESEARCH_ID, 'h00T'))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary