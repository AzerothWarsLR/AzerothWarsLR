//If Quel'thalas destroys the Legion Nexus, they can train GARITHOS'thas and Blood Mages.
//If they instead lose the Sunwell, they lose everything. If that doesn't defeat them, they get GARITHOS'thalas, Lorthemar, and some free units at Dalaran Dungeons.
library QuestGarithosMindControl requires LordaeronSetup, LegendLordaeron, Display

  struct QuestGarithosMindControl extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "Garithos weak mind is an easy pray to Sylvanas mind control, "
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "You lose everything, but will spawn with Garithos and a small army in Capital City"
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
      call FACTION_LORDAERON.ModObjectLimit('H049', 1)        //Nathanos
      call FACTION_LORDAERON.ModObjectLimit('Hlgr', 1)        //Garithos

      set this.Holder.Team = TEAM_FORSAKEN
      set this.Holder.Name = "|cff8080ffGarithos|r"
      set this.Holder.Icon = "ReplaceableTextures\\CommandButtons\\BTNGarithos.blp"
      call SetPlayerColor(this.Holder.Player, PLAYER_COLOR_LIGHT_BLUE )
      
      set LEGEND_GARITHOS.StartingXP = GetHeroXP(LEGEND_ARTHAS.Unit)
      call this.Holder.obliterate()
      call LEGEND_GARITHOS.Spawn(this.Holder.Player, 9090, 8743, 110)
      call LEGEND_NATHANOS.Spawn(this.Holder.Player, 9090, 8743, 110)
      call CreateUnits(this.Holder.Player, 'hkni', GetRectCenterX(gg_rct_Terenas), GetRectCenterY(gg_rct_Terenas), 270, 12)
      call CreateUnits(this.Holder.Player, 'hpea', GetRectCenterX(gg_rct_Terenas), GetRectCenterY(gg_rct_Terenas), 270, 6)
      call CreateUnits(this.Holder.Player, 'hfoo', GetRectCenterX(gg_rct_Terenas), GetRectCenterY(gg_rct_Terenas), 270, 12)
      call CreateUnits(this.Holder.Player, 'h009', GetRectCenterX(gg_rct_Terenas), GetRectCenterY(gg_rct_Terenas), 270, 2)
      call AdjustPlayerStateBJ( 2000, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
      call AdjustPlayerStateBJ( 900, this.Holder.Player, PLAYER_STATE_RESOURCE_LUMBER )
      if GetLocalPlayer() == this.Holder.Player then
        call SetCameraPosition(GetRectCenterX(gg_rct_Terenas), GetRectCenterY(gg_rct_Terenas))
      endif
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Garithos' Mind-Control", "Garithos has always had a distrust of other races, he might be tempted to join the Scarlet MindControl.", "ReplaceableTextures\\CommandButtons\\BTNGarithos.blp")
      call this.AddQuestItem(QuestItemResearch.create('R08F', 'hbla'))
      return this
    endmethod
  endstruct

endlibrary