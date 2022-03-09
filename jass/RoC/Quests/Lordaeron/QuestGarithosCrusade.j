//If Quel'thalas destroys the Legion Nexus, they can train GARITHOS'thas and Blood Mages.
//If they instead lose the Sunwell, they lose everything. If that doesn't defeat them, they get GARITHOS'thalas, Lorthemar, and some free units at Dalaran Dungeons.
library QuestGarithosCrusade requires LordaeronSetup, LegendLordaeron, Display

  globals
    private constant integer QUEST_RESEARCH_ID = 'R04Q'
    private constant integer UNITTYPE_ID = 'n048'
  endglobals

  struct QuestGarithosCrusade extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "Garithos has always had a disliking for the other races. His pride and desire for power has led the remnants of the Lordaeron forces to join the crusade"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "You lose everything, but will spawn with Garithos and a small army in Tyr Hand"
    endmethod

    private method OnComplete takes nothing returns nothing
      local unit u
      local player holderPlayer = this.Holder.Person.Player
      local Legend triggerLegend = GetTriggerLegend()
      set LEGEND_GARITHOS.StartingXP = GetHeroXP(LEGEND_ARTHAS.Unit)
      call this.Holder.obliterate()
        call SetPlayerTechResearched(Holder.Player, QUEST_RESEARCH_ID, 1)
        call LEGEND_GARITHOS.Spawn(this.Holder.Player, -11410, 21975, 110)
        call UnitAddItem(LEGEND_GARITHOS.Unit, CreateItem('I00M', GetUnitX(LEGEND_GARITHOS.Unit), GetUnitY(LEGEND_GARITHOS.Unit)))
        if GetLocalPlayer() == this.Holder.Player then
          call SetCameraPosition(GetRectCenterX(gg_rct_BloodElfSecondChanceSpawn), GetRectCenterY(gg_rct_BloodElfSecondChanceSpawn))
        endif
      call SetTriggerLegend(triggerLegend)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Garithos' Crusade", "The Elves of Quel'thalas have a deep reliance on the Sunwell's magic. Without it, they would have to turn to darker magicks to sate themselves.", "ReplaceableTextures\\CommandButtons\\BTNGarithos.blp")
      call this.AddQuestItem(QuestItemResearch.create(RESEARCH_ID, 'h08B'))
      return this
    endmethod
  endstruct

endlibrary