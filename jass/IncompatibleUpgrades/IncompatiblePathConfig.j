library IncompatiblePathConfig initializer OnInit

  private function OnInit takes nothing returns nothing
    local IncompatibleResearchSet researchSet = 0

    //Frostwolf Paths
    set researchSet = IncompatibleResearchSet.create()
    call researchSet.add('R01O')    //Age of Prosperity
    call researchSet.add('R02T')    //Season of Thunder
    call researchSet.add('R02R')    //Voodic Command

    //Warsong Paths
    set researchSet = IncompatibleResearchSet.create()
    call researchSet.add('R02O')    //Rite of Blood
    call researchSet.add('R02Q')    //Rite of Strength     
  endfunction    
    
endlibrary