library QuestReanimateSylvanas requires QuestData, ScourgeSetup, QuelthalasSetup, LegendQuelthalas

  globals
    private constant integer SYLVANAS_ID = 'Usyl'
    private constant integer ALTAR_ID = 'uaod'
  endglobals

  struct QuestReanimateSylvanas extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Sylvanas has been slain. Her soul is ripped from her body, and she becomes the first of the High Elven Banshees."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "You can summon Sylvanas from the " + GetObjectName(ALTAR_ID)
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetUnitAnimation(LEGEND_SUNWELL.Unit, "stand second")
      call SetUnitAnimation(LEGEND_SUNWELL.Unit, "stand third")
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.modObjectLimit(SYLVANAS_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The First Banshee", "Sylvanas, the Ranger-General of Silvermoon, stands between the legions of the Scourge and the Sunwell. Destroy her people, and her soul will be transformed into a tormented Banshee under the Scourge's control.", "ReplaceableTextures\\CommandButtons\\BTNBansheeRanger.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_SUNWELL, false))
      set this.ResearchId = 'R02D'
      return this
    endmethod
  endstruct

endlibrary