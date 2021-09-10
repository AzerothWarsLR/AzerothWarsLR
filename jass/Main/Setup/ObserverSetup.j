library ObserverSetup requires ObserverSlots

  public function OnInit takes nothing returns nothing
    call MakeObserver(Player(13))
    call MakeObserver(Player(14))
  endfunction

endlibrary