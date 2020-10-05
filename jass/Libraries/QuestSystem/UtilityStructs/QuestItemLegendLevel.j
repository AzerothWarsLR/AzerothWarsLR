library QuestItemLegendLevel requires QuestItemData

  struct QuestItemLegendLevel extends QuestItemData
    static method create takes Legend legend, integer level returns thistype
      local thistype this = thistype.allocate()
      set this.Description = legend.Name + " is level " + I2S(level)
      return this
    endmethod
  endstruct

endlibrary