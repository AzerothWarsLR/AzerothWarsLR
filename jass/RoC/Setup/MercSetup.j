library MercSetup requires MercFaction

  public function OnInit takes nothing returns nothing
    call EdwinSetup_OnInit()
    call SnarlmaneSetup_OnInit()

  endfunction

endlibrary