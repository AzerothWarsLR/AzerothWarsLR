library QuestItemCastSpell requires QuestItemData

  struct QuestItemCastSpell extends QuestItemData
    private unit caster
    private integer spellId = 0

    private static integer count = 0
    private static thistype array byIndex

    method operator Caster takes nothing returns unit
      return this.caster
    endmethod

    private method OnCast takes unit caster returns nothing
      if this.Progress != QUEST_PROGRESS_COMPLETE then
        set this.caster = caster
        set this.Progress = QUEST_PROGRESS_COMPLETE
      endif
    endmethod

    private static method OnAnyUnitFinishesSpell takes nothing returns nothing
      local integer i = 0
      local thistype loopItem
      local integer spellAbilityId = GetSpellAbilityId()
      loop
        exitwhen i == thistype.count
        set loopItem = thistype.byIndex[i]
        if loopItem.spellId == spellAbilityId then
          call loopItem.OnCast(GetTriggerUnit())
        endif
        set i = i + 1
      endloop    
    endmethod

    static method create takes integer spellId returns thistype
      local thistype this = thistype.allocate()
      local trigger trig = CreateTrigger()
      set this.Description = "Cast " + GetObjectName(spellId)
      set this.spellId = spellId
      call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_SPELL_FINISH )
      call TriggerAddAction(trig, function thistype.OnAnyUnitFinishesSpell)
      set thistype.byIndex[thistype.count] = this
      set thistype.count = thistype.count + 1
      return this
    endmethod
  endstruct

endlibrary