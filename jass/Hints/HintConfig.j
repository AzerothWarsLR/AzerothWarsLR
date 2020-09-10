library HintConfig initializer OnInit requires Hint

  private function OnInit takes nothing returns nothing
    call Hint.create("If your ally leaves the game, you might be able to select a Solo Path. This option is found at your Path Research building in the top-right corner.")
    call Hint.create("Masteries are unique researches that specialize your faction. They are found at the Mastery Research building in the top-right corner.")
    call Hint.create("Quests are unique objectives that grant rewards when completed. View the Quest Menu (F9) to see the quests available to your faction.")
    call Hint.create("Artifacts are unique items that can grant major advantages. You can find out where Artifacts are using the Artifact Menu at the top-left of your screen.")
    call Hint.create("Some heroes can't be revived, and some can only be revived if you control certain capitals when they die.")
    call Hint.create("You can ally and unally other players using commands. Type -ally to find out more.")
    call Hint.create("If you have low FPS, try turning off your health bars.")
    call Hint.create("We have a welcoming Discord community at https://discord.gg//4eGZn")
    call Hint.create("When a player leaves, their gold, lumber, units and hero experience are spread among their remaining allies.")
    call Hint.create("There are water passageways at the edge of the map you can use to instantly move to the other side of the map.")
    call Hint.create("If you have a misbehaving vassal, you can boot them by typing -boot followed by their faction name, e.g. -boot xavius.")
  endfunction

endlibrary