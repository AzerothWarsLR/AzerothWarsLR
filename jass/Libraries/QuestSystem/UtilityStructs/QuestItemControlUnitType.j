library QuestItemControlUnitType requires QuestItemData

  struct QuestItemControlUnitType extends QuestItemData
    static method create takes integer unitTypeId returns thistype
      local thistype this = thistype.allocate()
      set this.Description = "You control " + GetObjectName(unitTypeId)
      return this
    endmethod
  endstruct

endlibrary