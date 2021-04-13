library QuestJinthaAlor requires LegendNeutral

  globals
    private constant integer JINTHAALOR_RESEARCH = 'R02N'
  endglobals

  struct QuestJinthaAlor extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Jintha'Alor has fallen. The Vilebranch trolls lend their might to the " + this.Holder.Team.Name 
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of Jintha'Alor, the ability to train Bear Riders"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, JINTHAALOR_RESEARCH, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(JINTHAALOR_RESEARCH, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Ancient Egg", "The Vilebranch trolls of Jintha'Alor are controlled by their fear of the egg of the god Hakar, hidden in the Shrine  , smash it to gain their loyalty.", "ReplaceableTextures\\CommandButtons\\BTNForestTrollShadowPriest.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_JINTHAALOR, false))
      return this
    endmethod
  endstruct

endlibrary