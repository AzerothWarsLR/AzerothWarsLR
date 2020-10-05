library QuestItemLegendAlive requires QuestItemData

  struct QuestItemLegendAlive extends QuestItemData
    static method create takes Legend target returns thistype
      local thistype this = thistype.allocate()
      set this.Description = target.Name + " is alive"
      return this
    endmethod
  endstruct

endlibrary