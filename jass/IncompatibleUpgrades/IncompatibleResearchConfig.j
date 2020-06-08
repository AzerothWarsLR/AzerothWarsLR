library IncompatibleMasteryConfig initializer OnInit requires IncompatibleResearchSet 
    private function OnInit takes nothing returns nothing
        local IncompatibleResearchSet researchSet = 0
        
        //Scourge Masteries
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R00Q')    //Frozen Death Mastery
            call researchSet.add('R00P')    //Necromantic Mastery
            call researchSet.add('R01X')    //Plague Engineering Mastery
            
        //Legion Masteries
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R020')    //Void Mastery
            call researchSet.add('R01N')    //Doom Mastery
            call researchSet.add('R01M')    //Inferno Mastery
            call researchSet.add('R01Y')    //Felsteel Mastery
            
        //Fel Horde Masteries
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R010')    //Demonic Mastery
            call researchSet.add('R011')    //Fel Blood Mastery
            call researchSet.add('R00Y')    //Fel Strength Mastery    
              
        //Lordaeron Masteries
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R01B')    //Dwarven Refugees
            call researchSet.add('R01Q')    //Empowerment Mastery
            call researchSet.add('R00B')    //Soldier Mastery        
        
        //Khaz Modan Masteries
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R033')    //Elemental Mastery
            call researchSet.add('R013')    //Fortification Mastery
            call researchSet.add('R012')    //Siege Mastery  
            
        //Dalaran Masteries
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R00L')    //Arcane Mastery
            call researchSet.add('R00N')    //Elemental Mastery
            call researchSet.add('R00J')    //Magical Wrath Mastery    
              
        //Quel'thalas Masteries
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R01A')    //Arcane Empowerment
            call researchSet.add('R00T')    //Archery Mastery
            call researchSet.add('R00H')    //Blood Elf Mastery
                    
        //Frostwolf Clan Masteries
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R00W')    //Tauren Mastery
            call researchSet.add('R017')    //Warrior Spirit Mastery
            call researchSet.add('R00R')    //Spiritual Mastery    
              
        //Warsong Clan Masteries
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R00X')    //Bloodfury Mastery
            call researchSet.add('R015')    //Ogre Might Mastery
            call researchSet.add('R016')    //Troll Combat Mastery
                       
        //Sentinels Masteries
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R00U')    //Aerial Expertise Mastery
            call researchSet.add('R007')    //Lost Heritage Mastery
            call researchSet.add('R03J')    //Wind Control Mastery     
            
        //Stormwind Masteries
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R01C')    //Arcane Mastery
            call researchSet.add('R01U')    //Foot Soldier Prowess Mastery
            call researchSet.add('R00Z')    //Shipwright Guild Mastery
                    
        //Druids Masteries
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R00V')    //Arcane Mastery
            call researchSet.add('R018')    //Bonding Mastery
            call researchSet.add('R019')    //Feral Mastery   
            
        //Naga Masteries
        set researchSet = IncompatibleResearchSet.create()
            call researchSet.add('R044')    //Monster Taming Mastery
            call researchSet.add('R043')    //Naga Mastery
            call researchSet.add('R00H')    //Blood Elf Mastery                 
    endfunction    
    
endlibrary
