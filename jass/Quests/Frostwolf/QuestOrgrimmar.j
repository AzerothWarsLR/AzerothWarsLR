//If Thrall enters the Orgrimmar area, OR a time elapses, OR Frostwolf leaves, give Orgrimmar to a Horde player.
library QuestOrgrimmar initializer OnInit requires Persons, FrostwolfConfig, WarsongConfig, GeneralHelpers

  globals
    private constant integer GOLD = 100
    private constant integer LUMBER = 350

    private constant integer RESEARCH_ID = 'R06A'
  endglobals

  struct QuestOrgrimmar extends QuestData
    private Faction fallbackFaction = 0

    private method operator CompletionPopup takes nothing returns string
      return "At the northern edge of Durotar, the Horde has finally found a place to call home. They name it Orgrimmar in honour of Orgrim Doomhammer."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Gain control of Orgrimmar"
    endmethod   

    private method GiveOrgrimmar takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u
      //Transfer all Neutral Passive units in Orgrimmar to whichPlayer
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Orgrimmar, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call SetUnitInvulnerable(u, false)
          call SetUnitOwner(u, whichPlayer, true)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      //Give resources and display message
      call AdjustPlayerStateBJ(GOLD, whichPlayer, PLAYER_STATE_RESOURCE_GOLD)
      call AdjustPlayerStateBJ(LUMBER, whichPlayer, PLAYER_STATE_RESOURCE_LUMBER)
      call SetPlayerTechResearched(Holder.Player, RESEARCH_ID, 1)
      //Cleanup
      call DestroyGroup (tempGroup)
      set tempGroup = null
    endmethod

    private method OnFail takes nothing returns nothing
      if this.fallbackFaction != 0 then
        call this.GiveOrgrimmar(this.fallbackFaction.Player)
      else
        call this.GiveOrgrimmar(Player(PLAYER_NEUTRAL_AGGRESSIVE))
      endif
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GiveOrgrimmar(this.Holder.Player)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.modObjectLimit(RESEARCH_ID, 1)
    endmethod

    public static method create takes Faction fallbackFaction returns thistype
      local thistype this = thistype.allocate("To Tame a Land", "Since arriving on Azeroth, the Orcs have never had a place to call home. The uncharted lands of Kalimdor are ripe for colonization.", "ReplaceableTextures\\CommandButtons\\BTNFortress.blp")
      set this.fallbackFaction = fallbackFaction
      call this.AddQuestItem(QuestItemEitherOf.create(QuestItemTime.create(540), QuestItemAnyUnitInRect.create(gg_rct_Orgrimmar, "Orgrimmar", true)))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_FROSTWOLF.AddQuest(QuestOrgrimmar.create(FACTION_WARSONG))
  endfunction

endlibrary