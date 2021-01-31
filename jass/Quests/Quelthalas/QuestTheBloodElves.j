library QuestTheBloodElves initializer OnInit requires QuelthalasConfig, LegendLegion, LegendQuelthalas, Display

  globals
    private constant integer QUEST_RESEARCH_ID = 'R04Q'
    private constant integer UNITTYPE_ID = 'n048'
    private constant integer BUILDING_ID = 'n0A2'
  endglobals

  struct QuestTheBloodElves extends QuestData
    private method operator CompletionPopup takes nothing returns string
      if not UnitAlive(LEGEND_SILVERMOON.Unit) then
        return "Silvermoon has fallen. The survivors name themselves the Blood Elves in remembrance of their fallen people."
      endif
      return "The Legion Nexus has been obliterated. A group of ambitious mages seize the opportunity to study the demons' magic, becoming the first Blood Mages."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Learn to train " + GetObjectName(UNITTYPE_ID) + "s from the Consortium"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, QUEST_RESEARCH_ID, 1)
      call DisplayUnitTypeAcquired(Holder.Player, UNITTYPE_ID, "You can now train " + GetObjectName(UNITTYPE_ID) + "s from the " + GetObjectName(BUILDING_ID) + ".")
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.modObjectLimit(QUEST_RESEARCH_ID, UNLIMITED)
      call Holder.modObjectLimit(UNITTYPE_ID, 6)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Blood Elves", "The Elves of Quel'thalas have a deep reliance on the Sunwell's magic. Without it, they would have to turn to darker magicks to sate themselves. Even with the Sunwell standing, temptation lies in wait.", "ReplaceableTextures\\CommandButtons\\BTNHeroBloodElfPrince.blp")
      call this.AddQuestItem(QuestItemEitherOf.create(QuestItemLegendDead.create(LEGEND_LEGIONNEXUS), QuestItemLegendDead.create(LEGEND_SILVERMOON)))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_QUELTHALAS.AddQuest(QuestTheBloodElves.create())
  endfunction

endlibrary