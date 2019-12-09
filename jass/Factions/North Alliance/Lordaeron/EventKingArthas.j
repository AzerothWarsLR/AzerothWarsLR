//Prince Arthas goes to the Frozen Throne after it's destroyed. He becomes King Arthas, gets the Crown of Lordaeron, and Terenas dies.
library EventKingArthas initializer OnInit requires Artifact, GeneralHelpers
  globals
    private constant integer CROWN_ID = 'I001'
  endglobals

  private function EntersRegion takes nothing returns nothing
    local unit triggerUnit = GetTriggerUnit()
    local unit kingArthas = null
    local real x = 0
    local real y = 0
    local Artifact tempArtifact = 0

    if GetUnitTypeId(triggerUnit) == 'Hart' then     //Prince Arthas
      if not IsUnitDeadBJ(gg_unit_h000_0406) and IsUnitDeadBJ(gg_unit_u000_0649) then
        //Replace Arthas with King Arthas
        set x = GetUnitX(triggerUnit)
        set y = GetUnitY(triggerUnit)
        set kingArthas = CreateUnit(GetOwningPlayer(triggerUnit), 'Harf', x, y, GetUnitFacing(triggerUnit))
        call SetHeroXP(kingArthas, GetHeroXP(triggerUnit), true)
        call UnitTransferItems(triggerUnit, kingArthas)
        call RemoveUnit(triggerUnit)
        call SetUnitPosition(kingArthas, x, y)
        call SetUnitColor(kingArthas, PLAYER_COLOR_BLUE)

        //Give Crown of Lordaeron
        set tempArtifact = Artifact.artifactsByType[CROWN_ID]
        if tempArtifact != 0 then
          call SetItemPosition(tempArtifact.item, x, y)
          call UnitAddItem(kingArthas, tempArtifact.item)
        endif

        //Display message
        call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "In the wake of the tragic passing of King Terenas Menethil, his son Arthas has been crowned the King of Lordaeron. He has married Lady Jaina Proudmoore in a lavish ceremony, and been forged a new weapon of light by Uther the Lightbringer.")
        
        //Kill Terenas
        call KillUnit(gg_unit_nemi_0019)

        //Cleanup
        call DestroyTrigger(GetTriggeringTrigger())
        set kingArthas = null
      endif
    endif

    set triggerUnit = null
  endfunction    

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterEnterRectSimple( trig, gg_rct_LichKing )
    call TriggerAddCondition( trig, Condition( function EntersRegion ) )        
  endfunction

endlibrary
