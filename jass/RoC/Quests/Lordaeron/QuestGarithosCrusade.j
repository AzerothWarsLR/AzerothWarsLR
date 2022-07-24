//If Quel'thalas destroys the Legion Nexus, they can train GARITHOS'thas and Blood Mages.
//If they instead lose the Sunwell, they lose everything. If that doesn't defeat them, they get GARITHOS'thalas, Lorthemar, and some free units at Dalaran Dungeons.
library QuestGarithosCrusade requires LordaeronSetup, LegendLordaeron, Display

  struct QuestGarithosCrusade extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "一直以来加瑟里斯都不喜欢其他种族。他的自豪感和对权力的渴望促使洛丹伦的残余势力加入了血色十字军"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "你将失去一切，但会在提尔之手生成加瑟里斯和一小支部队"
    endmethod

    private method OnComplete takes nothing returns nothing
      local player holderPlayer = this.Holder.Person.Player
      call FACTION_LORDAERON.ModObjectLimit('h00F', -UNLIMITED)           //Paladin 
      call FACTION_LORDAERON.ModObjectLimit('R06Q', -UNLIMITED)   //Paladin Adept Training
      call FACTION_LORDAERON.ModObjectLimit('h012', -UNLIMITED)           //Falric
      call FACTION_LORDAERON.ModObjectLimit('Hart', -UNLIMITED)           //Arthas
      call FACTION_LORDAERON.ModObjectLimit('Huth', -UNLIMITED)           //Uther
      call FACTION_LORDAERON.ModObjectLimit('H01J', -UNLIMITED)           //Mograine
      call FACTION_LORDAERON.ModObjectLimit('Harf', -UNLIMITED)           //Arthas

      call FACTION_LORDAERON.ModObjectLimit('h009', 6)           //Dark Knight
      call FACTION_LORDAERON.ModObjectLimit('Hlgr', 1)        //Garithos
      call FACTION_LORDAERON.ModObjectLimit('E00O', 1)        //Goodchild

      set this.Holder.Team = TEAM_SCARLET
      set this.Holder.Name = "|cff800000Garithos|r"
      set this.Holder.Icon = "ReplaceableTextures\\CommandButtons\\BTNGarithos.blp"
      call SetPlayerColor(this.Holder.Player, PLAYER_COLOR_MAROON )
      
      set LEGEND_GARITHOS.StartingXP = GetHeroXP(LEGEND_ARTHAS.Unit)
      call this.Holder.obliterate()
      call LEGEND_GARITHOS.Spawn(this.Holder.Player, 19410, 7975, 110)
      call LEGEND_GOODCHILD.Spawn(this.Holder.Player, 19410, 7975, 110)
      call CreateUnits(this.Holder.Player, 'hkni', GetRectCenterX(gg_rct_GarithosCrusadeSpawn), GetRectCenterY(gg_rct_GarithosCrusadeSpawn), 270, 12)
      call CreateUnits(this.Holder.Player, 'hpea', GetRectCenterX(gg_rct_GarithosCrusadeSpawn), GetRectCenterY(gg_rct_GarithosCrusadeSpawn), 270, 6)
      call CreateUnits(this.Holder.Player, 'hfoo', GetRectCenterX(gg_rct_GarithosCrusadeSpawn), GetRectCenterY(gg_rct_GarithosCrusadeSpawn), 270, 12)
      call CreateUnits(this.Holder.Player, 'h009', GetRectCenterX(gg_rct_GarithosCrusadeSpawn), GetRectCenterY(gg_rct_GarithosCrusadeSpawn), 270, 2)
      call AdjustPlayerStateBJ( 2000, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
      call AdjustPlayerStateBJ( 900, this.Holder.Player, PLAYER_STATE_RESOURCE_LUMBER )
      if GetLocalPlayer() == this.Holder.Player then
        call SetCameraPosition(GetRectCenterX(gg_rct_GarithosCrusadeSpawn), GetRectCenterY(gg_rct_GarithosCrusadeSpawn))
      endif
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("加瑟里斯的十字军", "加瑟里斯一直不信任其他种族，他可能会被诱惑加入血色十字军", "ReplaceableTextures\\CommandButtons\\BTNGarithos.blp")
      call this.AddQuestItem(QuestItemResearch.create('R08E', 'hbla'))
      return this
    endmethod
  endstruct

endlibrary