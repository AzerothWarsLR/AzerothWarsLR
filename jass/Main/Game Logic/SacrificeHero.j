library SacrificeHero initializer OnInit requires DummyCast, Legend

  globals
    private constant integer ABIL_ID = 'A0LR'
  endglobals

  private function Cast takes nothing returns nothing
    local unit targetUnit = GetSpellTargetUnit()
    local Legend targetLegend = Legend.ByHandle(targetUnit)
    local Faction triggerFaction = Faction.ByHandle(GetTriggerPlayer())
    if targetLegend != 0 and targetLegend.Essential == false then
      set triggerFaction.StoredExperience = triggerFaction.StoredExperience + (IMaxBJ(GetHeroXP(targetLegend.Unit) - targetLegend.StartingXP, 0))
      set targetLegend.EnableMessages = false
      call targetLegend.PermaDeath()
      set targetLegend.EnableMessages = true
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    call RegisterSpellEffectAction(ABIL_ID, function Cast)
  endfunction 

endlibrary