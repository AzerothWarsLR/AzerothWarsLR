library QuestFirstObelisk requires QuestData, GeneralHelpers, BlackEmpirePortal, Herald

  struct QuestFirstObelisk extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "第一座方尖碑已经被召唤，但尼奥罗萨与艾泽拉斯的链接尚未稳定。更多的方尖碑需要被建立。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "解锁尼奥罗萨的北部区域，下一位传令官将会开启一道通往奥丹姆的临时传送门"
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueUnitsInGroup(udg_NyalothaGroup1, this.Holder.Player)
      call RemoveDestructable(gg_dest_ATg1_35873)
      call RemoveDestructable(gg_dest_ATg3_35872)
      call RemoveUnit(Herald.Instance.unit)
      call BlackEmpirePortal.GoToNext()
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("第一座方尖碑", "尼奥罗萨的扭曲现实只是艾泽拉斯的影子，但这很快就会被改变。融合这两个现实的第一步是在诺森德建立第一座方尖碑。", "ReplaceableTextures\\CommandButtons\\BTNIceCrownObelisk.blp")
      call this.AddQuestItem(QuestItemObelisk.create(ControlPoint.ByUnitType('n02S')))
      return this
    endmethod
  endstruct

endlibrary