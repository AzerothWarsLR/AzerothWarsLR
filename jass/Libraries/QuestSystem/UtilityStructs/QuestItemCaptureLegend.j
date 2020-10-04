library QuestItemControlLegend requires QuestItemData

  struct QuestItemControlLegend extends QuestItemData
    private static trigger unitDies = CreateTrigger()
    private static thistype array byLegend
    private Legend legend = 0

    method operator X takes nothing returns real
      return GetUnitX(legend.Unit)
    endmethod

    method operator Y takes nothing returns real
      return GetUnitY(legend.Unit)
    endmethod

    private method OnUnitChangeOwner takes nothing returns nothing
      if this.Holder.Team.ContainsFaction(legend.OwningFaction) then
        set this.Progress = QUEST_PROGRESS_COMPLETE
      else
        set this.Progress = QUEST_PROGRESS_FAILED
      endif
    endmethod

    private static method OnAnyUnitChangeOwner takes nothing returns nothing
      local thistype triggerLegend = Legend.ByHandle(GetTriggerUnit())
      if triggerLegend != 0 then
        call thistype.byLegend[triggerLegend].OnUnitChangeOwner()
      endif
    endmethod

    static method create takes Legend whichLegend returns thistype
      local thistype this = thistype.allocate()
      local trigger trig = CreateTrigger()
      call OnLegendChangeOwner.register(trig) 
      call TriggerAddAction(trig, function thistype.OnAnyUnitChangeOwner)
      set this.Description = "Capture " + GetHeroProperName(whichLegend.Unit)
      set thistype.byLegend[whichLegend] = this
      return this
    endmethod

  endstruct

endlibrary