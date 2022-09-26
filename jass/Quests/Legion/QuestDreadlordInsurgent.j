//If Quel'thalas destroys the Legion Nexus, they can train GARITHOS'thas and Blood Mages.
//If they instead lose the Sunwell, they lose everything. If that doesn't defeat them, they get GARITHOS'thalas, Lorthemar, and some free units at Dalaran Dungeons.
library QuestDreadlordInsurgent requires LegionSetup, LegendLegion, Display

  struct QuestDreadlordInsurgent extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "The Dreadlord has quickly fallen to Sylvanas and forced to join the Forsaken "
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "You lose everything, but will spawn with a small army, Varimathras and Lilian Voss near Capital City"
    endmethod

    private method OnComplete takes nothing returns nothing
      local player holderPlayer = this.Holder.Person.Player

      call FACTION_LEGION.ModObjectLimit('Utic', -UNLIMITED)           //Tichondrius
      call FACTION_LEGION.ModObjectLimit('Umal', -UNLIMITED)           //maglanis
      call FACTION_LEGION.ModObjectLimit('U00L', -UNLIMITED)           //Anatheron

      call FACTION_LEGION.ModObjectLimit('E01O', 1)        //Lilian
      call FACTION_LEGION.ModObjectLimit('Uvar', 1)        //Vari

      set this.Holder.Team = TEAM_FORSAKEN
      set this.Holder.Name = "|cff8080ffInsurgents|r"
      set this.Holder.Icon = "ReplaceableTextures\\CommandButtons\\BTNHeroDreadLord.blp"
      call SetPlayerColor(this.Holder.Player, PLAYER_COLOR_LIGHT_BLUE )
      
      set LEGEND_VARIMATHRAS.StartingXP = GetHeroXP(LEGEND_TICHONDRIUS.Unit)
      set LEGEND_LILIAN.StartingXP = GetHeroXP(LEGEND_MALGANIS.Unit)
      call this.Holder.obliterate()
      call LEGEND_LILIAN.Spawn(this.Holder.Player, 7254, 7833, 110)
      call LEGEND_VARIMATHRAS.Spawn(this.Holder.Player, 7254, 7833, 110)
      call CreateUnits(this.Holder.Player, 'n04J', GetRectCenterX(gg_rct_Vandermar_Village), GetRectCenterY(gg_rct_Vandermar_Village), 270, 12)
      call CreateUnits(this.Holder.Player, 'u00D', GetRectCenterX(gg_rct_Vandermar_Village), GetRectCenterY(gg_rct_Vandermar_Village), 270, 6)
      call CreateUnits(this.Holder.Player, 'ninc', GetRectCenterX(gg_rct_Vandermar_Village), GetRectCenterY(gg_rct_Vandermar_Village), 270, 12)
      call CreateUnits(this.Holder.Player, 'u007', GetRectCenterX(gg_rct_Vandermar_Village), GetRectCenterY(gg_rct_Vandermar_Village), 270, 2)
      call AdjustPlayerStateBJ( 2000, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
      call AdjustPlayerStateBJ( 900, this.Holder.Player, PLAYER_STATE_RESOURCE_LUMBER )
      if GetLocalPlayer() == this.Holder.Player then
        call SetCameraPosition(GetRectCenterX(gg_rct_Vandermar_Village), GetRectCenterY(gg_rct_Vandermar_Village))
      endif
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Dreadlord Insurgent", "Varimathras has branched out and tried to take control of the Plaguelands, Sylvanas will try and make him join her cause", "ReplaceableTextures\\CommandButtons\\BTNHeroDreadLord.blp")
      call this.AddQuestItem(QuestItemResearch.create('R08H', 'n040'))
      return this
    endmethod
  endstruct

endlibrary