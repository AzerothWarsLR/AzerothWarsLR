library QuestItemLegendDead requires QuestItemData

  struct QuestItemLegendDead extends QuestItemData
    private static thistype array byLegend
    private Legend target = null

    method operator X takes nothing returns real
      return GetUnitX(target.Unit)
    endmethod

    method operator Y takes nothing returns real
      return GetUnitY(target.Unit)
    endmethod

    private method OnDeath takes nothing returns nothing
      set this.Progress = QUEST_PROGRESS_COMPLETE
    endmethod

    private static method OnAnyUnitDeath takes nothing returns nothing
      local thistype triggerLegend = Legend.ByHandle(GetTriggerUnit())
      if triggerLegend != 0 then
        call thistype.byLegend[triggerLegend].OnDeath()
      endif
    endmethod

    static method create takes Legend target returns thistype
      local thistype this = thistype.allocate()
      local trigger trig = CreateTrigger()
      set this.target = target
      set this.Description = GetHeroProperName(target.Unit)
      set thistype.byLegend[target] = this
      if target.Unit == null then
        set this.Progress = QUEST_PROGRESS_UNDISCOVERED
      elseif UnitAlive(target.Unit) then
        set this.Progress = QUEST_PROGRESS_COMPLETE
      endif
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      local trigger trig = CreateTrigger()
      call TriggerRegisterAnyUnitEventBJ(trig, EVENT_UNIT_DEATH)    
      call TriggerAddAction(trig, thistype.OnAnyUnitDeath)
    endmethod

  endstruct

endlibrary