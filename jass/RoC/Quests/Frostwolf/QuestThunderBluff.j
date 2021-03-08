//If the Centaur Khan dies, OR a time elapses, give Thunder Bluff to a Horde player.
library QuestThunderBluff initializer OnInit requires Persons, FrostwolfConfig, WarsongConfig, GeneralHelpers

  globals
    private group ThunderBluffUnits
  endglobals

  struct QuestThunderBluff extends QuestData
    private Faction fallbackFaction = 0

    private method operator CompletionPopup takes nothing returns string
      return "The Crossroads have been constructed."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of Thunder Bluff"
    endmethod    

    private method GiveThunderBluff takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Crossroads to one of the above factions
      call GroupEnumUnitsInRect(tempGroup, gg_rct_ThunderBluff, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, whichPlayer)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop

      //Cleanup
      call DestroyGroup(tempGroup)
      set tempGroup = null
    endmethod

    private method OnFail takes nothing returns nothing
      if this.fallbackFaction != 0 then
        call this.GiveThunderBluff(this.fallbackFaction.Player)
      else
        call this.GiveThunderBluff(Player(PLAYER_NEUTRAL_AGGRESSIVE))
      endif
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GiveThunderBluff(this.Holder.Player)
    endmethod

    public static method create takes Faction fallbackFaction returns thistype
      local thistype this = thistype.allocate("The Long March", "The Tauren have been wandering for too long. The plains of Mulgore would offer respite from this endless journey.", "ReplaceableTextures\\CommandButtons\\BTNCentaurKhan.blp")
      set this.fallbackFaction = fallbackFaction
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_CENTAURKHAN))
      call this.AddQuestItem(QuestItemAnyUnitInRect.create(gg_rct_ThunderBluff, "Thunder Bluff", true))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    //Setup initially invulnerable and hidden group at Thunder Bluff
    local group tempGroup = CreateGroup()
    local unit u
    local integer i = 0
    set ThunderBluffUnits = CreateGroup()
    call GroupEnumUnitsInRect(tempGroup, gg_rct_ThunderBluff, null)
    loop
      set u = FirstOfGroup(tempGroup)
      exitwhen u == null
      if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
        call SetUnitInvulnerable(u, true)
        call GroupAddUnit(ThunderBluffUnits, u)
      endif
      call GroupRemoveUnit(tempGroup, u)
      set i = i + 1
    endloop
    call DestroyGroup(tempGroup)
    set tempGroup = null
    
  endfunction

endlibrary