library QuestScarletCrusade initializer OnInit requires QuestData, QuestItemControlPoint, QuestItemLegendDead, LordaeronConfig, LegendLordaeron

  globals
    private constant integer RESEARCH_ID = 'R06P'
  endglobals

  struct QuestScarletCrusade extends QuestData
    private method operator CompletionPopup takes nothing returns string
      if GetOwningPlayer(ControlPoint.ByUnitType('n0AA').Unit) == FACTION_LORDAERON.Player then
        return "Alexandros Mograine has retrieved an orb of pure light from Blackrock Spire and had it forged into the great weapon Ashbringer. He returns to the nation of Lordaeron a changed man, bringing with him the ideals of the newly formed Scarlet Crusade."
      endif
      return "Alexandros Mograine has heard of Uther's death, and he returns home immediately. The threats against Lordaeron spur him to form the Scarlet Crusade."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "The hero Alexandros Mograine, and your Paladins are replaced with Scarlet Templars"
    endmethod

    private method OnComplete takes nothing returns nothing
      if GetOwningPlayer(ControlPoint.ByUnitType('n0AA').Unit) == FACTION_LORDAERON.Player then
        call LEGEND_MOGRAINE.Spawn(this.Holder.Player, 18546, -30320, 93)
      else
        call LEGEND_MOGRAINE.Spawn(this.Holder.Player, 9092, 8717, 93)
      endif
      call UnitDetermineLevel(LEGEND_MOGRAINE.Unit, 1.00)
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
      call this.Holder.modObjectLimit('h00F', -UNLIMITED)      //Lordaeron Paladin 
      call this.Holder.modObjectLimit('h06B', 6)               //Grand Templar
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Scarlet Crusade", "Alexandros Mograine, one of the leaders of the Silver Hand, hasn't been seen since the Second War. He must still be somewhere in the south.", "ReplaceableTextures\\CommandButtons\\BTNAshbringer.blp")
      call this.AddQuestItem(QuestItemEitherOf.create(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0AA')), QuestItemLegendDead.create(LEGEND_UTHER)))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_LORDAERON.AddQuest(QuestScarletCrusade.create())
  endfunction

endlibrary