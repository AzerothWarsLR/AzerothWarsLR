//Frostwolf kills the Sea Witch. Thrall gets some boats to leave the Darkspear Isles.
//Presently this ONLY deals with the final component of the event. The rest is done in GUI. 
library QuestSeaWitch initializer OnInit requires FrostwolfConfig, LegendSentinels, Display, QuestItemLegendDead

  globals
    private weathereffect Storm
  endglobals

  struct QuestSeaWitch extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The sea witch Zar'jira has been slain. Thrall and Vol'jin can now set sail."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Gain control of a few ships and all unrescued units on the Darkspear Isles"
    endmethod

    private method OnComplete takes nothing returns nothing
      local Person killingPerson = Person.ByHandle(GetOwningPlayer(GetKillingUnit()))
      local group tempGroup = CreateGroup()
      local unit u
      //Spawn escape ships
      call RemoveUnit(gg_unit_o02M_1463)
      call RemoveUnit(gg_unit_o02M_1374)
      call CreateUnit(this.Holder.Player, 'obot', GetRectCenterX(gg_rct_Thrall_Ship_1), GetRectCenterY(gg_rct_Thrall_Ship_1), 270)
      call CreateUnit(this.Holder.Player, 'obot', GetRectCenterX(gg_rct_Thrall_Ship_2), GetRectCenterY(gg_rct_Thrall_Ship_2), 270)
      //Transfer control of all passive units on island
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Darkspear_Island, null)
      loop
        set u = FirstOfGroup(tempGroup)
        exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, this.Holder.Player)
        endif
        call GroupRemoveUnit(tempGroup, u)
      endloop
      call DestroyGroup(tempGroup)
      call RemoveWeatherEffectBJ(Storm)
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