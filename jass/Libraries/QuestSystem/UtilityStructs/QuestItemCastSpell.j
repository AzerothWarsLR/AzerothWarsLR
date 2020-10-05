library QuestItemCastSpell requires QuestItemData

  struct QuestItemCastSpell extends QuestItemData
    static method operator Caster takes nothing returns unit
      return null
    endmethod

    static method create takes integer spellId returns thistype
      local thistype this = thistype.allocate()
      set this.Description = "Cast " + GetObjectName(spellId)
      return this
    endmethod
  endstruct

endlibrary