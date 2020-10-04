library QuestQuelthalasKillLegion requires QuelthalasConfig, LegendLegion, Display

  globals
    private constant integer QUEST_RESEARCH_ID = 'R04Q'
    private constant integer UNITTYPE_ID = 'n0A2'
    private constant integer CASTER_RESEARCH_ID = 'R027'
  endglobals

  struct QuestQuelthalasKillLegion extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Legion Nexus has been destroyed. The practice of demonology experiences a resurgence in High Elven society."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Learn to train " + GetObjectName(UNITTYPE_ID) + "s from the " + GetObjectName('hars')
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, QUEST_RESEARCH_ID, 1)
      call SetPlayerTechResearched(Holder.Player, CASTER_RESEARCH_ID, 3)
      call DisplayUnitTypeAcquired(Holder.Player, UNITTYPE_ID, "You can now train " + GetObjectName(UNITTYPE_ID) + "s from the Arcane Sanctum.")
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.modObjectLimit(QUEST_RESEARCH_ID, UNLIMITED)
      call Holder.modObjectLimit(UNITTYPE_ID, UNLIMITED)
      call Holder.modObjectLimit(CASTER_RESEARCH_ID, UNLIMITED)
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Illicit Practices", "Ever since Sargeras caught scent of Azeroth's magic overuse, demonology has been forbidden in Quel'thalas.", "ReplaceableTextures\\CommandButtons\\BTNHighElvenCleric.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(LEGEND_LEGIONNEXUS.Unit))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_QUELTHALAS.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary