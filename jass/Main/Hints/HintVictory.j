library HintVictory initializer OnInit requires Hint, ControlPointVictory

  private function OnInit takes nothing returns nothing
    call Hint.create("通过占领" + I2S(GetControlPointsRequiredVictory()) + "个控制点来获得胜利。")
  endfunction

endlibrary