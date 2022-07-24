library QuestTheramore requires QuestData

  globals
    private constant integer RESEARCH_ID = 'R06K'
  endglobals

  struct QuestTheramore extends QuestData
    private static group theramoreUnits = CreateGroup()

    private method operator CompletionPopup takes nothing returns string
      return "尘泥沼泽海岸边的一个相当大的岛屿已经被殖民并被称为塞拉摩，这标志着人类在卡利姆多建立的第一个定居点。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得塞拉摩内所有单位和建筑的控制权。"
    endmethod

    private static method GrantToPlayer takes player whichPlayer returns nothing
      local unit u
      loop
        set u = FirstOfGroup(theramoreUnits)
        exitwhen u == null
        call UnitRescue(u, whichPlayer)
        call GroupRemoveUnit(theramoreUnits, u)
      endloop
      call DestroyGroup(theramoreUnits)
      set u = null
      set theramoreUnits = null
    endmethod

    private method OnFail takes nothing returns nothing
      call thistype.GrantToPlayer(Player(PLAYER_NEUTRAL_AGGRESSIVE))
      call this.Holder.ModObjectLimit(RESEARCH_ID, -UNLIMITED)
    endmethod

    private method OnComplete takes nothing returns nothing
      call thistype.GrantToPlayer(this.Holder.Player)
      call this.Holder.ModObjectLimit(RESEARCH_ID, -UNLIMITED)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)  
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("塞拉摩", "遥远的卡利姆多大地上仍未受到人类文明的影响。如果第三次战争进展不佳，将有可能需要在这这里建立一个前线基地。", "ReplaceableTextures\\CommandButtons\\BTNHumanArcaneTower.blp")
      call this.AddQuestItem(QuestItemResearch.create(RESEARCH_ID, 'h076'))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      local group tempGroup
      local unit u
      set tempGroup = CreateGroup()
      set theramoreUnits = CreateGroup()
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Theramore, null)
      loop
        set u = FirstOfGroup(tempGroup)
        exitwhen u == null
        call SetUnitInvulnerable(u, true)
        call SetUnitOwner(u, Player(PLAYER_NEUTRAL_PASSIVE), true)
        call GroupAddUnit(theramoreUnits, u)
        call GroupRemoveUnit(tempGroup, u)
      endloop
      call DestroyGroup(tempGroup)
    endmethod
  endstruct

endlibrary