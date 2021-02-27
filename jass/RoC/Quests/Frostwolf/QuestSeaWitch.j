//Frostwolf kills the Sea Witch. Thrall gets some boats to leave the Darkspear Isles.
//Presently this ONLY deals with the final component of the event. The rest is done in GUI. 
library QuestSeaWitch initializer OnInit requires FrostwolfConfig, LegendNeutral, Display, QuestItemLegendDead

  globals
    private weathereffect Storm
  endglobals

  struct QuestSeaWitch extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The sea witch Zar'jira has been slain. Thrall and Vol'jin can now set sail."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Gain control of all neutral units on the Darkspear Isles and teleport to shore"
    endmethod

    private method OnComplete takes nothing returns nothing
      local Person killingPerson = Person.ByHandle(GetOwningPlayer(GetKillingUnit()))
      local group tempGroup = CreateGroup()
      local unit u
      //Transfer control of all passive units on island and teleport all Frostwolf units to shore
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Darkspear_Island, null)
      loop
        set u = FirstOfGroup(tempGroup)
        exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, this.Holder.Player)
        endif
        if GetOwningPlayer(u) == FACTION_FROSTWOLF.Player and IsUnitType(u, UNIT_TYPE_STRUCTURE) == false then
          call SetUnitPosition(u, GetRandomReal(GetRectMinX(gg_rct_ThrallLanding), GetRectMaxX(gg_rct_ThrallLanding)), GetRandomReal(GetRectMinY(gg_rct_ThrallLanding), GetRectMaxY(gg_rct_ThrallLanding)))
        endif
        call GroupRemoveUnit(tempGroup, u)
      endloop
      call DestroyGroup(tempGroup)
      call RemoveWeatherEffectBJ(Storm)
      call CreateUnits(this.Holder.Player, 'opeo', -1818, -2070, 270, 3)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Riders on the Storm", "Warchief Thrall and his forces have been shipwrecked on the Darkspear Isles. Kill the Sea Witch there to give them a chance to rebuild their fleet and escape.", "ReplaceableTextures\\CommandButtons\\BTNGhost.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(LEGEND_SEAWITCH.Unit))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      set Storm = AddWeatherEffect(gg_rct_Darkspear_Island, 'RAhr')
      call EnableWeatherEffect(Storm, true)
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    local QuestData newQuest = FACTION_FROSTWOLF.AddQuest(QuestSeaWitch.create())
    set FACTION_FROSTWOLF.StartingQuest = newQuest
  endfunction

endlibrary