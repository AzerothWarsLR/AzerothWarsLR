library QuestSilvermoon requires QuestData, IronforgeSetup, QuestItemKillUnit

  globals
    private constant integer QUEST_RESEARCH_ID = 'R02U'
  endglobals

  struct QuestSilvermoon extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "银月城的围攻已经解除，它的军队现在可以自由地协助" + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得银月城所有单位和建筑，并在祭坛内解锁安纳斯特里亚"
    endmethod

    private method GrantSilvermoon takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Silvermoon
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
      call this.GrantSilvermoon(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, 'R02U', 1) 
      call this.GrantSilvermoon(this.Holder.Player)
      if UnitAlive(gg_unit_h00D_2122) == true then
        call SetUnitInvulnerable(LEGEND_SILVERMOON.Unit, true )
      endif
      call SetUnitInvulnerable(LEGEND_SUNWELL.Unit, true )
      if GetLocalPlayer() == this.Holder.Player then
        call PlayThematicMusicBJ( "war3mapImported\\SilvermoonTheme.mp3" )
      endif
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("银月城之围", "银月城被巨魔围困，清除他们，摧毁他们的祖阿曼城。", "ReplaceableTextures\\CommandButtons\\BTNForestTrollTrapper.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_O00O_1933)) //Zul'jin
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01V')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01L')))
      call this.AddQuestItem(QuestItemUpgrade.create('h03T', 'h033'))
      call this.AddQuestItem(QuestItemExpire.create(1480))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary