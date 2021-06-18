library SacrificeHero initializer OnInit requires DummyCast, Legend

  globals
    private constant integer ABIL_ID = 'A0LR'
  endglobals

  private function Cast takes nothing returns nothing
    local unit targetUnit = GetSpellAbilityUnit()
    local Legend targetLegend = Legend.ByHandle(targetUnit)
    if targetLegend != 0 and targetLegend.Essential == false then
      set targetLegend.EnableMessages = false
      call targetLegend.PermaDeath()
      set targetLegend.EnableMessages = true
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    call RegisterSpellEffectAction(ABIL_ID, function Cast)
  endfunction 

endlibrary