library QuestSummonLegion requires QuestData, ScourgeSetup, LegionSetup

  globals
    private constant integer RITUAL_ID = 'A00J'
  endglobals

  struct QuestSummonLegion extends QuestData
    private method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "颤抖吧凡人！绝望吧！末日已经降临于这个世界！"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得阿克蒙德、扭曲虚空中所有建筑和单位并学会训练更强大的恶魔单位"
    endmethod

    private method OnAdd takes nothing returns nothing
      if Holder.PresenceResearch == 0 then
        call BJDebugMsg("ERROR: " + Holder.Name + " has no presence research. QuestSummonLegion won't work")
      endif
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("燃烧的天空之下", "燃烧军团更强大的部队在广阔的扭曲虚空中等待着。使用麦迪文之书在时空中撕开一道口子让世界见识一下燃烧军团的全部力量。", "ReplaceableTextures\\CommandButtons\\BTNArchimonde.blp")
      call this.AddQuestItem(QuestItemCastSpell.create(RITUAL_ID, false))
      set this.ResearchId = 'R04B'
      return this
    endmethod
  endstruct

endlibrary