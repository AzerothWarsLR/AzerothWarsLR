library QuestItemLegendInRect requires QuestItemData, Persons

  struct QuestItemLegendInRect extends QuestItemData
    static method create takes Legend legend, rect target, string rectName returns thistype
      local thistype this = thistype.allocate()
      set this.Description = legend.Name + " is at " + rectName
      return this
    endmethod
  endstruct

endlibrary