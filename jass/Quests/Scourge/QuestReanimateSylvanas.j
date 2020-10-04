library QuestReanimateSylvanas initializer OnInit requires QuestData, ScourgeConfig, QuelthalasConfig, LegendQuelthalas

  globals
    private constant integer SYLVANAS_RESEARCH = 'R02D'
    private constant integer SYLVANAS_ID = 'uswb'
  endglobals

  struct QuestReanimateSylvanas extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Sylvanas has been slain. Her soul is ripped from her body, and she becomes the first of the High Elven Banshees."
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(this.Holder.Player, SYLVANAS_RESEARCH, 1)
      call LEGEND_JENNALLA.Spawn(FACTION_QUELTHALAS.Player, 18509, 18073, 295)
      call CreateUnit(this.Holder.Player, SYLVANAS_ID, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()), GetUnitFacing(GetTriggerUnit()))
      call SetHeroXP(LEGEND_JENNALLA.Unit, GetHeroXP(LEGEND_SYLVANAS.Unit), true)
      set LEGEND_SYLVANAS.Unit = null
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(SYLVANAS_RESEARCH, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The First Banshee", "Sylvanas, the Ranger-General of Silvermoon, stands between the legions of the Scourge and the Sunwell. Slay her, and her soul will be transformed into a tormented Banshee under the Scourge's control.", "ReplaceableTextures\\CommandButtons\\BTNBansheeRanger.blp")
      call this.AddQuestItem(QuestItemKillLegend.create(LEGEND_SYLVANAS))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_SCOURGE.AddQuest(QuestReanimateSylvanas.create())
  endfunction

endlibrary