library QuestSecondObelisk requires QuestData, GeneralHelpers, BlackEmpirePortal, Herald

  struct QuestSecondObelisk extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "第二座方尖碑已经建成。尼奥罗萨与艾泽拉斯之间的链接更加紧密了。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "解锁尼奥罗萨的南部区域，而下一个先驱者将会打开一道通往暮光高地的临时传送门"
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueUnitsInGroup(udg_NyalothaGroup2, this.Holder.Player)
      call RescueUnitsInGroup(udg_NyalothaGroup3, this.Holder.Player)
      call RemoveDestructable(gg_dest_ATg2_35871)
      call RemoveDestructable(gg_dest_ATg3_35869)
      call RemoveUnit(Herald.Instance.unit)
      call BlackEmpirePortal.GoToNext()
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("第二座方尖碑", "现实的融合越来越紧密。必须在奥丹姆建筑另外一座方尖碑。", "ReplaceableTextures\\CommandButtons\\BTNIceCrownObelisk.blp")
      call this.AddQuestItem(QuestItemObelisk.create(ControlPoint.ByUnitType('n0BD')))
      return this
    endmethod
  endstruct

endlibrary