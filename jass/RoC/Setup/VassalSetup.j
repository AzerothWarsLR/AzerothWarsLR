library VassalSetup requires BrannSetup, ChogallSetup, EdwinSetup, JarodSetup, LorthemarSetup, NathanosSetup, NekroshSetup, RhoninSetup, RoanaukSetup, SaurfangSetup, SylvanasSetup, TortolaSetup, XaviusSetup

  public function OnInit takes nothing returns nothing
    call BrannSetup_OnInit()
    call ChogallSetup_OnInit()
    call EdwinSetup_OnInit()
    call JarodSetup_OnInit()
    call LorthemarSetup_OnInit()
    call NathanosSetup_OnInit()
    call NekroshSetup_OnInit()
    call RhoninSetup_OnInit()
    call RoanaukSetup_OnInit()
    call SaurfangSetup_OnInit()
    call SylvanasSetup_OnInit()
    call TortolaSetup_OnInit()
    call XaviusSetup_OnInit()
  endfunction

endlibrary