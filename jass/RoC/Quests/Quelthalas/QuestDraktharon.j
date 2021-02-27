library QuestDraktharon initializer OnInit requires QuestData, QuelthalasConfig, LegendNeutral

  globals
    private constant integer DARKHAN_ID = 'h052'
    private constant integer DARKHAN_RESEARCH = 'R02H'
  endglobals

  struct QuestDraktharon extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Dar'Khan Drathir, a revered member of the Convocation of Silvermoon, has returned to serve the High Elves after his mysterious disappearance."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "The demihero " + GetObjectName(DARKHAN_ID)
    endmethod

    private method OnComplete takes nothing returns nothing
      call CreateUnit(this.Holder.Player, DARKHAN_ID, GetUnitX(LEGEND_DRAKTHARONKEEP.Unit), GetUnitY(LEGEND_DRAKTHARONKEEP.Unit), GetUnitFacing(LEGEND_DRAKTHARONKEEP.Unit))
      call SetPlayerTechResearched(this.Holder.Player, DARKHAN_RESEARCH, 1)
      call DisplayUnitTypeAcquired(this.Holder.Player, DARKHAN_ID, "You have acquired the demi-hero Dar'Khan Drakthir, and can revive him from the Altar of Kings if he dies.")
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(DARKHAN_ID, 1)
      call this.Holder.modObjectLimit(DARKHAN_RESEARCH, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Drak'tharon Keep", "Some time ago, Magister Dar'Khan Drakthir set sail to Northrend and hasn't been since. Perhaps if he can be found, he can be convinced to rejoin his people.", "ReplaceableTextures\\CommandButtons\\BTNMedivh.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_DRAKTHARONKEEP, false))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_QUELTHALAS.AddQuest(QuestDraktharon.create())
  endfunction

endlibrary