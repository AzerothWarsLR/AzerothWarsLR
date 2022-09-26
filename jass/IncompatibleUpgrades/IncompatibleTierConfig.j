library IncompatibleTierConfig initializer OnInit

  private function OnInit takes nothing returns nothing
    local IncompatibleResearchSet researchSet = 0
  
                    
    //Stormwind Tier 1 (Champion Hall)
    set researchSet = IncompatibleResearchSet.create()
    call researchSet.add('R02Y')    //Battle Tactics
    call researchSet.add('R03D')    //Veteran Guard
        
    //Stormwind Tier 1 (Wizard's Sanctum)
    set researchSet = IncompatibleResearchSet.create()
    call researchSet.add('R03T')    //Electric Strike Ritual
    call researchSet.add('R03U')    //Solar Flare Ritual
        
    //Stormwind Tier 2 ( Champion Hall)
    set researchSet = IncompatibleResearchSet.create()
    call researchSet.add('R03B')    //Exploit Weakness
    call researchSet.add('R02Z')    //Reflective Plating
        
    //Stormwind Tier 2 (Wizard's Sanctum)
    set researchSet = IncompatibleResearchSet.create()
    call researchSet.add('R03V')    //Stomrgrade
    call researchSet.add('R03W')    //Knowledge of Honor Hold
        
    //Stormwind Tier 3 (Champion Hall)
    set researchSet = IncompatibleResearchSet.create()
    call researchSet.add('R030')    //Code of Chivalry
    call researchSet.add('R031')    //Expedition Survivors
        
    //Stormwind Tier 3 (Wizard's Sanctum & Cathedral of Light)
    set researchSet = IncompatibleResearchSet.create()
    call researchSet.add('R03X')    //High Sorcerer Andromath Aid
    call researchSet.add('R03Y')    //Katrana Prestor Aid

    //Naga Path
    set researchSet = IncompatibleResearchSet.create()
    call researchSet.add('R062')   //Redemption path
    call researchSet.add('R063')   //Exile Path
    call researchSet.add('R065')   //Madness Path

    //Scarlet Path
    set researchSet = IncompatibleResearchSet.create()
    call researchSet.add('R088')   //Argent Dawn
    call researchSet.add('R03P')   //Unleash the Crusade

    //Lordaeron Path
    set researchSet = IncompatibleResearchSet.create()
    call researchSet.add('R08F')   //Mind Control
    call researchSet.add('R08E')   //Join Crusade

     //Twilight Path
    set researchSet = IncompatibleResearchSet.create()
    call researchSet.add('R08S')   //Twilight
    call researchSet.add('R08R')   //Dragonmaw

     //Dwarf Path
    set researchSet = IncompatibleResearchSet.create()
    call researchSet.add('R08U')   //Normal
    call researchSet.add('R08T')   //Ragnaros

  endfunction    
    
endlibrary
