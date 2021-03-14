library ObserverSetup requires ObserverSlots

  public function OnInit takes nothing returns nothing
    call MakeObserver(Player(12))
    call MakeObserver(Player(13))
  endfunction

endlibrary