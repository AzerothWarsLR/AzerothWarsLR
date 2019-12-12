library LordaeronMasteryConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_SOLDIERMASTERY
    FactionMod FACTIONMOD_EMPOWERMENTMASTERY
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_SOLDIERMASTERY = FactionMod.create()
    call FACTIONMOD_SOLDIERMASTERY.registerObjectLimit('hfoo', -UNLIMITED)  //Footman
    call FACTIONMOD_SOLDIERMASTERY.registerObjectLimit('h029', UNLIMITED)   //Veteran Footman
        
    set FACTIONMOD_EMPOWERMENTMASTERY = FactionMod.create()
    call FACTIONMOD_EMPOWERMENTMASTERY.registerObjectLimit('h00F', 2)           //Lordaeron Paladin
    call FACTIONMOD_EMPOWERMENTMASTERY.registerObjectLimit('h06B', 2)           //Grand Crusader
    call FACTIONMOD_EMPOWERMENTMASTERY.registerObjectLimit('h06D', 2)           //Silver Hand Veteran Paladin        
  endfunction
    
endlibrary                                         
