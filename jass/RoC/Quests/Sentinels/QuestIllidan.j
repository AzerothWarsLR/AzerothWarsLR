library QuestIllidan requires QuestData, SentinelsSetup

  globals
    private constant integer HERO_ID = 0
    private constant integer RITUAL_ID = 'A00J'
  endglobals

  struct QuestIllidan extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Burning Legion, the ancient enemy of the Night Elves, has returned to Azeroth. Desperate for allies, Tyrande is prepared to release Illidan from his imprisonment."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "You can summon Illidan from the Altar of Elders"
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.modObjectLimit(HERO_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Betrayer", "Illidan Stormrage was imprisoned within the Barrow Deeps for his actions following the Great Sundering. Only an existential threat could justify his release.", "ReplaceableTextures\\CommandButtons\\BTNHeroDemonHunter.blp")
      call this.AddQuestItem(QuestItemCastSpell.create(RITUAL_ID, false))
      set this.ResearchId = 0
      return this
    endmethod
  endstruct

endlibrary