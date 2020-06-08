library IncompatibleTierConfig initializer OnInit

    private function OnInit takes nothing returns nothing
        local IncompatibleResearchSet researchSet = 0
                                   
        //Fel Horde Tier 1
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R02L')    //Shattered Hand Clan
            call researchSet.add('R03L')    //Shadow Council Reformed  
            
        //Fel Horde Tier 2
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R036')    //Dragonmaw Clan
            call researchSet.add('R047')    //Shadowmoon Clan Remnants

        //Stormwind Tier 0 (SI:7 & Champion Hall)
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R02U')    //SI:7 Headquarters
            call researchSet.add('R02V')    //Champion's Hall 
        
        //Stormwind Tier 0 (Wizard's Sanctum & Cathedral of Light)
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R02K')    //Wizard's Sanctum
            call researchSet.add('R02S')    //Cathedral of Light
                        
        //Stormwind Tier 1 (SI:7 & Champion Hall)
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R03E')    //Saboteur Training
            call researchSet.add('R038')    //Enforcer Training
            call researchSet.add('R02Y')    //Battle Tactics
            call researchSet.add('R03D')    //Veteran Guard
            
        //Stormwind Tier 1 (Wizard's Sanctum & Cathedral of Light)
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R03T')    //Electric Strike Ritual
            call researchSet.add('R03U')    //Solar Flare Ritual
            call researchSet.add('R03A')    //Focus In the Light
            call researchSet.add('R02W')    //Sanctuary of Light
            
        //Stormwind Tier 2 (SI:7 & Champion Hall)
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R03F')    //Assassin Training
            call researchSet.add('R03K')    //Skirmisher Training
            call researchSet.add('R03B')    //Exploit Weakness
            call researchSet.add('R02Z')    //Reflective Plating
            
        //Stormwind Tier 2 (Wizard's Sanctum & Cathedral of Light)
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R03V')    //Exploit Weakness
            call researchSet.add('R03W')    //Knowledge of Honor Hold
            call researchSet.add('R03C')    //Runic Constitution
            call researchSet.add('R02X')    //Holy Mending
            
        //Stormwind Tier 3 (SI:7 & Champion Hall)
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R032')    //SI:7 Elite
            call researchSet.add('R030')    //Code of Chivalry
            call researchSet.add('R031')    //Elven Refugees
            
        //Stormwind Tier 3 (Wizard's Sanctum & Cathedral of Light)
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R03P')    //Archbishop Benedictus Aid
            call researchSet.add('R03X')    //High Sorcerer Andromath Aid
            call researchSet.add('R03Y')    //Katrana Prestor Aid 
            call researchSet.add('R03R')    //Reginald Windsor Aid             
                             
    endfunction    
    
endlibrary
