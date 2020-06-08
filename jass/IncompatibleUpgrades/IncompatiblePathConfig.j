library IncompatiblePathConfig initializer OnInit

    private function OnInit takes nothing returns nothing
        local IncompatibleResearchSet researchSet = 0
                                   
        //Lordaeron Paths
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R040')    //Order of the Scarlet Crusade
            call researchSet.add('R03Z')    //Order of the Silver Hand  
            
        //Dalaran Paths
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R03O')    //Path of Steel
            call researchSet.add('R03S')    //Path of Stone 

        //Frostwolf Paths
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R01O')    //Age of Prosperity
            call researchSet.add('R02T')    //Season of Thunder
            call researchSet.add('R02R')    //Voodic Command

        //Warsong Paths
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R02O')    //Rite of Blood
            call researchSet.add('R02Q')    //Rite of Strength  
            
        //Quel'thalas Paths
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R041')    //Blood Elves Path
            call researchSet.add('R046')    //Quel'thalas Full Mobilization
            call researchSet.add('R049')    //Unlock Naga Early
            
        //General Paths
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R04A')    //Old Gods
            call researchSet.add('R042')    //Rise from the Ashes
            call researchSet.add('R049')    //Unlock Naga Early   
            call researchSet.add('R001')    //Knights of the Ebon Blade                       
                             
    endfunction    
    
endlibrary
