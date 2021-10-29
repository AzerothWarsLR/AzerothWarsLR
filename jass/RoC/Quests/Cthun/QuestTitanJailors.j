library QuestTitanJailors requires QuestData, CthunSetup, QuestItemKillUnit

  globals
    private constant integer QUEST_RESEARCH_ID = 'R07B'   //This research is given when the quest is completed
  endglobals

  struct QuestTitanJailors extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Unlocks the Inner Ahn'qiraj base and enables us to start awakening C'thun."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Ahn'qirak inner temple and unlock the awakening spell for C'thun"
    endmethod

    private method GrantAhnqiraj takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Ahnqiraj
      call GroupEnumUnitsInRect(tempGroup, gg_rct_TunnelUnlock, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) and GetUnitFoodUsed(u) != 10  then
          call UnitRescue(u, whichPlayer)
        else
          if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, Player(PLAYER_NEUTRAL_PASSIVE))
          endif
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null      
    endmethod

    private method OnFail takes nothing returns nothing
      call this.GrantAhnqiraj(Player(PLAYER_NEUTRAL_AGGRESSIVE))
      call WaygateActivateBJ( true, gg_unit_h03V_0591 )
      call WaygateSetDestinationLocBJ( gg_unit_h03V_0591, GetRectCenter(gg_rct_Silithus_Stone_Interior) )
    endmethod

    private method OnComplete takes nothing returns nothing
      call WaygateActivateBJ( true, gg_unit_h03V_0591 )
      call WaygateSetDestinationLocBJ( gg_unit_h03V_0591, GetRectCenter(gg_rct_Silithus_Stone_Interior) )
      call this.GrantAhnqiraj(this.Holder.Player)
    endmethod

    private method OnAdd takes nothing returns nothing
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Jailors of the Old God", "The Old God C'thun is imprisoned deep within the temple of Ahn'qiraj. Defeat the Jailors that guard him to start awakening him.", "ReplaceableTextures\\CommandButtons\\BTNArmorGolem.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_nsgg_1490)) //Golem
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n02K')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n078')))
      call this.AddQuestItem(QuestItemExpire.create(1428))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary