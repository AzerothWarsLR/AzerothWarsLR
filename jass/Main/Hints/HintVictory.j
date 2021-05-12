library HintVictory initializer OnInit requires Hint, ControlPointVictory, ControlPointAndLegendDefeat

  private function OnInit takes nothing returns nothing
    call Hint.create("Win the game by capturing " + I2S(GetControlPointsRequiredVictory()) + " Control Points. When that happens, each surviving team's final score is based on the number of Control Points they control.")
    call Hint.create("You're defeated if your team has no capitals and fewer than " + I2S(ControlPointAndLegendDefeat.CPThreshold) + " Control Points. If that happens, your final score is based on how long you survived.")
  endfunction

endlibrary