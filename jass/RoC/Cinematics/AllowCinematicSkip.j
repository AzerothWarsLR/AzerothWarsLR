library AllowCinematicSkip initializer OnInit requires TestSafety

  private function OnInit takes nothing returns nothing
    call TriggerSleepAction(0) //Just to make it load after GUI
    if AreCheatsActive then
      call EnableTrigger(gg_trg_CinematicSkip)
      call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, "|cffD27575CHEAT:|r CinematicSkip enabled.")
    else
      set bj_cineSceneBeingSkipped = CreateTrigger()
      call DisableTrigger(gg_trg_CinematicSkip)
    endif
  endfunction

endlibrary