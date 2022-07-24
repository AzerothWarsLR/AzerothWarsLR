library QuestCataclysm requires QuestData, TwilightSetup

  globals
    private constant integer CATACLYSM_RESEARCH = 'R05E'
  endglobals

  struct QuestCataclysm extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod
    
    private method operator CompletionPopup takes nothing returns string
      return "死亡之翼已经到来，末日近在眼前，大灾变开始了！"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "世界各地的邪教徒们积极地加入你的事业，获得死亡之翼作为高级半英雄和两名元素升腾者英雄。"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(this.Holder.Player, CATACLYSM_RESEARCH, 1)
      call PlayThematicMusicBJ( "war3mapImported\\TwilightTheme.mp3" )
      call SetPlayerTechResearched(FACTION_CTHUN.Player, 'R07D', 1)
      call IssueImmediateOrderBJ( gg_unit_h02U_2413, "unrobogoblin" )
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(CATACLYSM_RESEARCH, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("大灾变", "古神的意志便是一切，你不被允许知道祂们的计划何时开始，但当时机来临时，你的崇拜者们将会准备好迎接祂。", "ReplaceableTextures\\CommandButtons\\BTNDeathwing.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_DEATHWING, false))
      return this
    endmethod
  endstruct

endlibrary