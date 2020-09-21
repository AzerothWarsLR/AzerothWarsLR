library QuestItemCaptureLegend requires QuestItemData

  struct QuestItemCaptureLegend extends QuestItemData
    private static trigger unitDies = CreateTrigger()
    private static thistype array byLegend
    private Legend legend = 0

    method operator X takes nothing returns real
      return GetUnitX(legend.Unit)
    endmethod

    method operator Y takes nothing returns real
      return GetUnitY(legend.Unit)
    endmethod

    private static method OnUnitChangeOwner takes nothing returns nothing
      if this.Holder.Team.ContainsFaction(legend.OwningFaction)
        set thistype.byHandleId[GetHandleId(GetTriggerUnit())].Progress = QUEST_PROGRESS_COMPLETE
      else
        set thistype.byHandleId[GetHandleId(GetTriggerUnit())].Progress = QUEST_PROGRESS_FAILED
      endif
    endmethod

    static method create takes Legend whichLegend returns nothing
      local thistype this = thistype.allocate()
      local trigger trig = CreateTrigger()
      call OnLegendChangeOwner.register(trig) 
      call TriggerAddAction(trig, function thistype.OnUnitChangeOwner)
      set this.desc = "Capture " + whichLegend.Name
      set thistype.byLegend[whichLegend] = this
      return this
    endmethod

  endstruct

endlibrary