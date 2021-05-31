library QuestTortolla requires QuestData, DruidsSetup, GeneralHelpers

  globals
    private constant integer HERO_ID = 'H04U'
  endglobals

  struct QuestTortolla extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Tortolla has finally awoken from his ancient slumber."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "You can train Tortolla from the Altar of Elders"
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.modObjectLimit(HERO_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Turtle Demigod", "Tortolla was badly wounded during the War of the Ancients, and has been resting ever since.", "ReplaceableTextures\\CommandButtons\\BTNMageWC2.blp")
      call this.AddQuestItem(QuestItemTime.create(1200))
      set this.ResearchId = 0
      return this
    endmethod
  endstruct

endlibrary