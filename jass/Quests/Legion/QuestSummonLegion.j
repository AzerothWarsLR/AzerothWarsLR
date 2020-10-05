library QuestSummonLegion initializer OnInit requires QuestData, ScourgeConfig, LegionConfig

  globals
    private constant integer RITUAL_ID = 'A00J'
  endglobals

  struct QuestSummonLegion extends QuestData
    private method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "Tremble, mortals, and despair. Doom has come to this world."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Gain control of Archimonde and all other units in the Twisting Nether, and learn to train Greater Demons"
    endmethod

    private method OnAdd takes nothing returns nothing
      if Holder.presenceResearch == 0 then
        call BJDebugMsg("ERROR: " + Holder.Name + " has no presence research. QuestSummonLegion won't work")
      endif
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Under the Burning Sky", "The greater forces of the Burning Legion lie in wait in the vast expanse of the Twisting Nether. Use the Book of Medivh to tear open a hole in space-time, and visit the full might of the Legion upon Azeroth.", "ReplaceableTextures\\CommandButtons\\BTNArchimonde.blp")
      call this.AddQuestItem(QuestItemCastSpell.create(RITUAL_ID))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_LEGION.AddQuest(QuestSummonLegion.create())
  endfunction

endlibrary