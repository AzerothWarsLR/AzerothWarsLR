library SpellPreloader initializer OnInit requires DummyCaster

    //Ensures that certain abilities are loaded during the loading screen rather than at first use
    //Avoids some lag

    private function PreloadAbility takes integer abil returns nothing
        call UnitAddAbility(DUMMY, abil)
        call UnitRemoveAbility(DUMMY, abil)
    endfunction

    private function OnInit takes nothing returns nothing
        call PreloadAbility('A0WN')
    endfunction

endlibrary