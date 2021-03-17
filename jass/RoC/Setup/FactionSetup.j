library FactionSetup requires DalaranSetup, DruidsSetup, FelHordeSetup, FrostwolfSetup, IronforgeSetup, LegionSetup, LordaeronSetup, QuelthalasSetup, ScourgeSetup, SentinelsSetup, StormwindSetup, WarsongSetup

  public function OnInit takes nothing returns nothing
    call ScourgeSetup_OnInit()
    call LegionSetup_OnInit()
    call LordaeronSetup_OnInit()
    call DalaranSetup_OnInit()
    call QuelthalasSetup_OnInit()
    call SentinelsSetup_OnInit()
    call DruidsSetup_OnInit()
    call FelHordeSetup_OnInit()
    call FrostwolfSetup_OnInit()
    call WarsongSetup_OnInit()
    call StormwindSetup_OnInit()
    call IronforgeSetup_OnInit()
    call KultirasSetup_OnInit()
  endfunction

endlibrary