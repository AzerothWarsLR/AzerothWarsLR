library QuestItemLegendInRect requires QuestItemData, Legend, Environment

  private function RectToRegion takes rect whichRect returns region
    local region rectRegion = CreateRegion()
    call RegionAddRect(rectRegion, whichRect)
    return rectRegion
  endfunction

  struct QuestItemLegendInRect extends QuestItemData
    private Legend legend
    private region target

    private static trigger entersRectTrig = CreateTrigger()
    private static trigger exitsRectTrig = CreateTrigger()
    private static integer count = 0
    private static thistype array byIndex

    private method OnRegionEnterOrExit takes nothing returns nothing
      if UnitAlive(this.legend.Unit) == true and IsUnitInRegion(this.target, this.legend.Unit) then
        set this.Progress = QUEST_PROGRESS_COMPLETE
      else
        set this.Progress = QUEST_PROGRESS_INCOMPLETE
      endif
    endmethod

    private static method OnAnyRegionExit takes nothing returns nothing
      local integer i = 0
      loop
        exitwhen i == thistype.count
        if GetTriggeringRegion() == thistype.byIndex[i].target then
          call thistype.byIndex[i].OnRegionEnterOrExit()
        endif
        set i = i + 1
      endloop
    endmethod

    private static method OnAnyRegionEnter takes nothing returns nothing
      local integer i = 0
      loop
        exitwhen i == thistype.count
        if GetTriggeringRegion() == thistype.byIndex[i].target then
          call thistype.byIndex[i].OnRegionEnterOrExit()
        endif
        set i = i + 1
      endloop    
    endmethod

    static method create takes Legend legend, rect target, string rectName returns thistype
      local thistype this = thistype.allocate()
      set this.target = RectToRegion(target)
      set this.legend = legend
      set this.Description = legend.Name + " is at " + rectName
      call TriggerRegisterEnterRegion(thistype.entersRectTrig, this.target, null)
      call TriggerRegisterEnterRegion(thistype.exitsRectTrig, this.target, null)
      set thistype.byIndex[thistype.count] = this
      set thistype.count = thistype.count + 1
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call TriggerAddAction(thistype.entersRectTrig, function QuestItemLegendInRect.OnAnyRegionEnter)
      call TriggerAddAction(thistype.exitsRectTrig, function QuestItemLegendInRect.OnAnyRegionEnter)
    endmethod
  endstruct

endlibrary