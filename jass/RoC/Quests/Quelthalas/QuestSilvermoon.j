library QuestSilvermoon requires QuestData, IronforgeSetup, QuestItemKillUnit

  globals
    private constant integer QUEST_RESEARCH_ID = 'R02U'
  endglobals

  struct QuestSilvermoon extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Silvermoon siege has been lifted, and its military is now free to assist the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Silvermoon"
    endmethod

    private method GrantStormwind takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Stormwind
      call GroupEnumUnitsInRect(tempGroup, gg_rct_SunwellAmbient, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, whichPlayer)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null      
    endmethod

    private method OnFail takes nothing returns nothing
      call this.GrantStormwind(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, 'R02U', 1) 
      call this.GrantStormwind(this.Holder.Player)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Siege of Silvermoon", "Silvermoon has been besieged by Trolls, clear them out and destroy their city of Zul'aman", "ReplaceableTextures\\CommandButtons\\BTNForestTrollTrapper.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_O00O_1933)) //Zul'jin
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01V')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01L')))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary