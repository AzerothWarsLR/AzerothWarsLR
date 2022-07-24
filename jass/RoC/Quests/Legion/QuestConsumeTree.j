library QuestConsumeTree requires Persons, LegionSetup, GeneralHelpers

  struct QuestConsumeTree extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "Archimonde has now consummed the World Tree and is now nigh unstoppable"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "By consuming the World Tree, Archimonde will obtain immense power. +80 to all stats. Additionally, the Druids faction will be eliminated."
    endmethod    

    private method OnComplete takes nothing returns nothing
      local unit whichUnit = LEGEND_ARCHIMONDE.Unit
      call FACTION_DRUIDS.obliterate()
      call BlzSetUnitName(whichUnit, "Devourer of Worlds")
      call AddSpecialEffectTarget("Abilities\\Weapons\\GreenDragonMissile\\GreenDragonMissile.mdl", whichUnit, "hand, right")
      call AddSpecialEffectTarget("Abilities\\Weapons\\GreenDragonMissile\\GreenDragonMissile.mdl", whichUnit, "hand, left")
      call AddHeroAttributes(whichUnit, 50, 50, 50)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Twilight of the Gods", "Consuming the World Tree will grant Archimonde immeasurable power and eliminate his mortal enemies, the Druids of Kalimdor, forever.", "ReplaceableTextures\\CommandButtons\\BTNGlazeroth.blp")
      call this.AddQuestItem(QuestItemChannelRect.create(gg_rct_ArchimondeChannel, "The World Tree", LEGEND_ARCHIMONDE, 420, 90))
      return this
    endmethod
  endstruct

endlibrary