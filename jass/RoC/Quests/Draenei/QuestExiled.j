library QuestExiled requires QuestData, DraeneiSetup

  globals
    private constant integer QUESTRESEARCH_ID = 'R081'   //This research is given when the quest is completed
    private constant integer RESEARCH_ID = 'R080'   //This research is required to complete
  endglobals

  struct QuestExiled extends QuestData

    private method Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "The Draenei have landed on Azuremyst after escaping Outland"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Azuremyst and teleports all your units away from Outland"
    endmethod

    private method GrantExiled takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Exiled
      call GroupEnumUnitsInRect(tempGroup, gg_rct_DraeneiEvacuation, null)
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

    private method EscapeOutland takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Exiled
      call GroupEnumUnitsInRect(tempGroup, gg_rct_InstanceOutland, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == this.Holder.Player then
          if IsUnitType(u, UNIT_TYPE_STRUCTURE) and not IsUnitType(u, UNIT_TYPE_ANCIENT) then
            call KillUnit(u)
          elseif not IsUnitType(u, UNIT_TYPE_ANCIENT) then
            call SetUnitPosition(u, -21185, 8000)
          endif
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null      
    endmethod

    private method OnFail takes nothing returns nothing
      call this.GrantExiled(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantExiled(this.Holder.Player)
      call this.EscapeOutland(this.Holder.Player)
      call KillUnit(gg_unit_h09W_3303)
      if GetLocalPlayer() == this.Holder.Player then
        call PlayThematicMusicBJ( "war3mapImported\\DraeneiTheme.mp3" )
      endif
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Exile from Outland", "The Draenei need to escape Outland through the Exodar ship. We will need to power it up with a Divine Citadel first. The longer you hold out, the better the rewards will be", "ReplaceableTextures\\CommandButtons\\BTNUndeadAirBarge.blp")
      call this.AddQuestItem(QuestItemUpgrade.create('o051', 'o050'))
      call this.AddQuestItem(QuestItemEitherOf.create(QuestItemResearch.create(RESEARCH_ID, 'h09W'), QuestItemTime.create(900)))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUESTRESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary