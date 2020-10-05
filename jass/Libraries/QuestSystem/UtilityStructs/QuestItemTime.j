library QuestItemTime requires QuestItemData, Persons

  struct QuestItemTime extends QuestItemData
    static method create takes integer duration returns thistype
      local thistype this = thistype.allocate()
      set this.Description = I2S(duration) + " seconds have elapsed"
      return this
    endmethod
  endstruct

endlibrary