library QuestGuldansLegacy requires QuestData, FelHordeSetup

  globals
    private integer RESEARCH_ID = 'R041'
  endglobals

  struct QuestGuldansLegacy extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "古尔丹的遗体在萨格拉斯之墓内被发现了。他的骇人知识可以为我们所用了"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "解锁鲜血符文和战争磨坊中的恶魔构造研究"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerAbilityAvailableBJ(true, 'A0MZ', FACTION_FEL_HORDE.Player)  //Demonic Construction
      call SetPlayerTechResearched(Holder.Player, RESEARCH_ID, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("古尔丹的遗产", "尽管古尔丹已经死去多时，但邪兽人的出现也有他的间接助力，而他那邪恶的知识仍可以从他的尸体内提取出来", "ReplaceableTextures\\CommandButtons\\BTNGuldan.blp")
      call this.AddQuestItem(QuestItemAnyUnitInRect.create(gg_rct_Guldan, "萨格拉斯之墓内的古尔丹尸体", true))
      return this
    endmethod
  endstruct
  
endlibrary