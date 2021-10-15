library QuestSpiderWar requires QuestData, QuestItemKillUnit

  globals
    private constant integer QUEST_RESEARCH_ID = 'R03A'
  endglobals

  struct QuestSpiderWar extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Northrend and the Icecrown Citadel is now under full control of the Lich King and the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Access to the Plague Research at the Frozen Throne, Kel'tuzad and Rivendare trainable and a base in Icecrown"
    endmethod

    private method GrantIcecrown takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Icecrown
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Ice_Crown, null)
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
      call this.GrantIcecrown(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantIcecrown(this.Holder.Player)
      call SetPlayerTechResearched(Holder.Player, 'R03A', 1) 
      if GetLocalPlayer() == this.Holder.Player then
        call PlayThematicMusicBJ( "war3mapImported\\ScourgeTheme.mp3" )
      endif
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("War of the Spider", "The proud Nerubians have declared war on the newly formed Lich King, destroy them to secure the continent of Northrend.", "ReplaceableTextures\\CommandButtons\\BTNNerubianQueen.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n00I')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n08D')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n00G')))
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_n074_1565)) //Nezar'azret
      call this.AddQuestItem(QuestItemExpire.create(1480))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary