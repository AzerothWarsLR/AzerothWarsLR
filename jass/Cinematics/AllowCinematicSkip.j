library AllowCinematicSkip initializer OnInit requires TestSafety

  private function OnInit takes nothing returns nothing
    if AreCheatsActive then
      call EnableTrigger(gg_trg_CinematicSkip)
    else
      set bj_cineSceneBeingSkipped = CreateTrigger()
      call DisableTrigger(gg_trg_CinematicSkip)
    endif
  endfunction

endlibrary