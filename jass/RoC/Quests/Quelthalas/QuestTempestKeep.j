//If any Horde unit enters the TempestKeep area, OR a time elapses, OR someone becomes a solo Horde Path, give the TempestKeep to a Horde player.

library QuestTempestKeep requires Persons, QuelthalasSetup, GeneralHelpers

  struct QuestTempestKeep extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "The TempestKeep have been constructed."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of the TempestKeep"
    endmethod    

    private method GiveTempestKeep takes player whichPlayer returns nothing
      local unit u

      //Transfer all Neutral Passive units in TempestKeep to one of the above factions
      set u = FirstOfGroup(udg_TempestKeep)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, whichPlayer)
        endif
        call GroupRemoveUnit(udg_TempestKeep, u)
        set u = FirstOfGroup(udg_TempestKeep)
      endloop

      //Cleanup
      call DestroyGroup(udg_TempestKeep)
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetUnitOwner(LEGEND_KAEL.Unit, Player(PLAYER_NEUTRAL_PASSIVE), true)
      call this.Holder.obliterate()
      call SetUnitOwner(LEGEND_KAEL.Unit, FACTION_QUELTHALAS.Player, true)
      call SetUnitPosition(LEGEND_KAEL.Unit, 4067, -21695)
      call this.GiveTempestKeep(this.Holder.Player)
      set this.Holder.Team = TEAM_NAGA
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Tempest Keep", "The Horde still needs to establish a strong strategic foothold into Kalimdor. There is an opportune TempestKeep nearby.", "ReplaceableTextures\\CommandButtons\\BTNBarracks.blp")
      call this.AddQuestItem(QuestItemCastSpell.create('A0IP', true))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_KAEL, true))
      return this
    endmethod
  endstruct

endlibrary