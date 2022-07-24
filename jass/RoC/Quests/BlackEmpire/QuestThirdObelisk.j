library QuestThirdObelisk requires QuestData, BlackEmpirePortalSetup, Herald

  globals
    private constant integer QUEST_RESEARCH_ID = 'R07K'   //This research is given when the quest is completed
  endglobals

  struct QuestThirdObelisk extends QuestData
    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "现实的融合已经完成。通往风暴峭壁、北部高地和塔纳利斯的传送门将会永久开启"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "通往风暴峭壁、北部高地和塔纳利斯的传送门将会永久开启"
    endmethod

    //Opens the central portals in Nyalotha permanently.
    private method OpenPortals takes nothing returns nothing
      call this.Holder.ModObjectLimit('u02E', -UNLIMITED) //Herald
      call this.Holder.SetObjectLevel(QUEST_RESEARCH_ID, 1)
      set BLACKEMPIREPORTAL_TWILIGHTHIGHLANDS.PortalState = BLACKEMPIREPORTALSTATE_OPEN
      set BLACKEMPIREPORTAL_TANARIS.PortalState = BLACKEMPIREPORTALSTATE_OPEN
      set BLACKEMPIREPORTAL_NORTHREND.PortalState = BLACKEMPIREPORTALSTATE_OPEN
      call RemoveDestructable(gg_dest_ATg2_35871)
      call RemoveDestructable(gg_dest_ATg1_35873)
      call RemoveDestructable(gg_dest_ATg3_35869)
      call RemoveDestructable(gg_dest_ATg3_35872)
      call RemoveUnit(Herald.Instance.unit)
      call BlackEmpirePortal.GoToNext()
      if GetLocalPlayer() == this.Holder.Player then
        call SetCameraPosition(-25528, -1979)
      endif
    endmethod

    private method OnComplete takes nothing returns nothing
      call PlayThematicMusicBJ("war3mapImported\\BlackEmpireTheme.mp3")
      call this.OpenPortals()
      call SetPlayerStateBJ( this.Holder.Player, PLAYER_STATE_FOOD_CAP_CEILING, 150 )
    endmethod

    private method OnFail takes nothing returns nothing
      call this.OpenPortals()
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("现实的融合", "现实正在被疯狂渐渐吞噬。一旦在暮光高地的方尖碑被建立起来，艾泽拉斯的镜像世界和尼奥罗萨将终于合为一体而黑暗帝国将会被释放。", "ReplaceableTextures\\CommandButtons\\BTNHorrorSoul.blp")
      call this.AddQuestItem(QuestItemObelisk.create(ControlPoint.ByUnitType('n02S')))
      call this.AddQuestItem(QuestItemObelisk.create(ControlPoint.ByUnitType('n04V')))
      call this.AddQuestItem(QuestItemObelisk.create(ControlPoint.ByUnitType('n0BD')))
      call this.AddQuestItem(QuestItemExpire.create(1800))
      return this
    endmethod
  endstruct

endlibrary