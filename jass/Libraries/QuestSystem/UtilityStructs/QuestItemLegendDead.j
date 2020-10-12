library QuestItemLegendDead requires QuestItemData, Legend

  struct QuestItemLegendDead extends QuestItemData
    private Legend target = 0
    private static integer count = 0
    private static thistype array byIndex

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
      local integer i = 0
      local thistype loopItem
      loop
        exitwhen i == thistype.count
        set loopItem = thistype.byIndex[i]
        if loopItem.target == GetTriggerLegend() then
          call loopItem.OnDeath()
        endif
        set i = i + 1
      endloop
    endmethod

    static method create takes Legend target returns thistype
      local thistype this = thistype.allocate()
      local trigger trig = CreateTrigger()
      set this.target = target
      set this.Description = target.Name + " is dead"
      set thistype.byIndex[thistype.count] = this
      set thistype.count = thistype.count + 1
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      local trigger trig = CreateTrigger()
      call OnLegendPermaDeath.register(trig)
      call TriggerAddAction(trig, function thistype.OnAnyUnitDeath)
    endmethod

  endstruct

endlibrary