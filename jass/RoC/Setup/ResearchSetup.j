library ResearchSetup requires TierArchbishopBenedictus, TierHighSorcererAndromath, TierKatranaPrestor, TierReginaldWindsor

  public function OnInit takes nothing returns nothing
    call TierArchbishopBenedictus_OnInit()
    call TierHighSorcererAndromath_OnInit()
    call TierKatranaPrestor_OnInit()
    call TierReginaldWindsor_OnInit()
  endfunction

endlibrary