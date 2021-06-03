library QuestChogall requires QuestData, FelHordeSetup, GeneralHelpers

  globals
    private constant integer HERO_ID = 'O01P'
    private constant integer ALTAR_ID = 'o02V'
  endglobals

  struct QuestChogall extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "With C'thun dead, the Old Gods hold no sway over Cho'gall."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "You can summmon Cho'gall from the " + GetObjectName(ALTAR_ID)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.modObjectLimit(HERO_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Twilight's Hammer", "When Gul'dan was torn to shreds by Sargeras' minions, Cho'gall found refuge in the Old God city of Ahn'qiraj. He must be rescued from his new dark master so that he can rejoin the Fel Horde.", "ReplaceableTextures\\CommandButtons\\BTNOgreMagi.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_n02F_1138)) //C'thun
      set this.ResearchId = 'R03G'
      return this
    endmethod
  endstruct

endlibrary