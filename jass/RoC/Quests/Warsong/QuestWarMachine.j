library QuestWarMachine requires QuestData, ScourgeSetup

  struct QuestWarMachine extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "对灰谷的大规模开发增强了整个部落的武器、装甲和防御。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "你和你所有的盟友可以研究" + GetObjectName('Rhme') + ", " + GetObjectName('Rhar') + ", " + GetObjectName('Rorb') + ", 和 " + GetObjectName('Rosp') + "。"
    endmethod

    private method BlessPlayer takes player whichPlayer returns nothing
      call SetPlayerTechResearched(whichPlayer, 'Rhme', GetPlayerTechCount(whichPlayer, 'Rhme', true) + 1)
      call SetPlayerTechResearched(whichPlayer, 'Rhar', GetPlayerTechCount(whichPlayer, 'Rhar', true) + 1)
      call SetPlayerTechResearched(whichPlayer, 'Rorb', 3)
      call SetPlayerTechResearched(whichPlayer, 'Rosp', 3)
    endmethod

    private method OnComplete takes nothing returns nothing
      local integer i = 0
      loop
        exitwhen i == MAX_PLAYERS
        if this.Holder.Team.ContainsPlayer(Player(i)) then
          call BlessPlayer(Player(i))
        endif
        set i = i + 1
      endloop
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit('R021', UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("战争机器", "部落现在可以进入灰谷那富饶的林地。现在是时候开始收割和武装了。", "ReplaceableTextures\\CommandButtons\\BTNBundleOfLumber.blp")
      call this.AddQuestItem(QuestItemResearch.create('R021', 'o01I'))
      return this
    endmethod
  endstruct

endlibrary