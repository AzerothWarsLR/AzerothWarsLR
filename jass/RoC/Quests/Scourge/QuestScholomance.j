library QuestScholomance requires QuestData, QuestItemKillUnit

  globals
    private constant integer RESEARCH_ID = 'R02X'
  endglobals

  struct QuestScholomance extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Scholomance has now been created under Caer Darrow and under the control of the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in the Scholomance and enable Kel'tuzad to be trained at the Altar"
    endmethod

    private method GrantScholomance takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Scholomance
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Scholo_Ships, null)
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
      call this.GrantScholomance(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantScholomance(this.Holder.Player)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Scholomance", "Caer Darrow is the perfect place to create the first bastion of the Scourge in Lordaeron and propagate the Plague.", "ReplaceableTextures\\CommandButtons\\BTNAffinityII.blp")
      call this.AddQuestItem(QuestItemResearch.create(RESEARCH_ID, 'u000'))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary