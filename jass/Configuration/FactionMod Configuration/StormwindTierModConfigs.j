library StormwindTierModConfigs initializer OnInit requires FactionMod
  //All of these are used in Stormwind's extravagent tier system

  globals
    FactionMod FACTIONMOD_WIZARDSSANCTUM
    FactionMod FACTIONMOD_CATHEDRALOFLIGHT
    FactionMod FACTIONMOD_SI7HEADQUARTERS
    FactionMod FACTIONMOD_CHAMPIONSHALL
    FactionMod FACTIONMOD_BATTLETACTICS
    FactionMod FACTIONMOD_VETERANGUARD
    FactionMod FACTIONMOD_EXPLOITWEAKNESS
    FactionMod FACTIONMOD_REFLECTIVEPLATING
    FactionMod FACTIONMOD_CODEOFCHIVALRY
    FactionMod FACTIONMOD_ELVENREFUGEES
    FactionMod FACTIONMOD_SABOTEURTRAINING
    FactionMod FACTIONMOD_ENFORCERTRAINING
    FactionMod FACTIONMOD_ASSASSINTRAINING
    FactionMod FACTIONMOD_SKIRMISHERTRAINING
    FactionMod FACTIONMOD_SI7ELITE
    FactionMod FACTIONMOD_FOCUSINTHELIGHT
    FactionMod FACTIONMOD_SANCTUARYOFLIGHT
    FactionMod FACTIONMOD_RUNICCONSTITUTION
    FactionMod FACTIONMOD_HOLYMENDING
    FactionMod FACTIONMOD_ARCHBISHOPBENEDICTUS
    FactionMod FACTIONMOD_REGINALDWINDSOR
    FactionMod FACTIONMOD_ELECTRICSTRIKERITUAL
    FactionMod FACTIONMOD_SOLARFLARERITUAL
    FactionMod FACTIONMOD_MAGESOFSTROMGARDE
    FactionMod FACTIONMOD_KNOWLEDGEOFHONORHOLD
    FactionMod FACTIONMOD_HIGHSORCERERANDROMATH
    FactionMod FACTIONMOD_KATRANAPRESTOR
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_WIZARDSSANCTUM = FactionMod.create()
    call FACTIONMOD_WIZARDSSANCTUM.registerObjectLimit('R03T', UNLIMITED)      //Electric Strike Ritual
    call FACTIONMOD_WIZARDSSANCTUM.registerObjectLimit('R03U', UNLIMITED)      //Solar Flare Ritual
          
    set FACTIONMOD_CATHEDRALOFLIGHT = FactionMod.create()
    call FACTIONMOD_CATHEDRALOFLIGHT.registerObjectLimit('R03A', UNLIMITED)       //Focus In the Light
    call FACTIONMOD_CATHEDRALOFLIGHT.registerObjectLimit('R02W', UNLIMITED)       //Sanctuary of Light
          
    set FACTIONMOD_SI7HEADQUARTERS = FactionMod.create()
    call FACTIONMOD_SI7HEADQUARTERS.registerObjectLimit('R03E', UNLIMITED)       //Sabo Training
    call FACTIONMOD_SI7HEADQUARTERS.registerObjectLimit('R038', UNLIMITED)       //Enforcer Training
          
    set FACTIONMOD_CHAMPIONSHALL = FactionMod.create()
    call FACTIONMOD_CHAMPIONSHALL.registerObjectLimit('R02Y', UNLIMITED)       //Battle Tactics
    call FACTIONMOD_CHAMPIONSHALL.registerObjectLimit('R03D', UNLIMITED)       //Veteran Guard                               
    
    set FACTIONMOD_BATTLETACTICS = FactionMod.create()
    call FACTIONMOD_BATTLETACTICS.registerObjectLimit('h03K', -UNLIMITED)      //Marshal
    call FACTIONMOD_BATTLETACTICS.registerObjectLimit('h014', 12)              //Marshal (Offensive)
    call FACTIONMOD_BATTLETACTICS.registerObjectLimit('R03B', 1)               //Exploit Weakness
    call FACTIONMOD_BATTLETACTICS.registerObjectLimit('R02Z', 1)               //Reflective Plating             

    set FACTIONMOD_VETERANGUARD = FactionMod.create()
    call FACTIONMOD_VETERANGUARD.registerObjectLimit('h03K', -UNLIMITED)      //Marshal
    call FACTIONMOD_VETERANGUARD.registerObjectLimit('h03U', 12)              //Marshal (Offensive)
    call FACTIONMOD_VETERANGUARD.registerObjectLimit('R03B', UNLIMITED)       //Exploit Weakness
    call FACTIONMOD_VETERANGUARD.registerObjectLimit('R02Z', UNLIMITED)       //Reflective Plating   
          
    set FACTIONMOD_EXPLOITWEAKNESS = FactionMod.create()
    call FACTIONMOD_EXPLOITWEAKNESS.registerObjectLimit('h04C',UNLIMITED)        //Swordsman
    call FACTIONMOD_EXPLOITWEAKNESS.registerObjectLimit('h02O',-UNLIMITED)       //Militia
    call FACTIONMOD_EXPLOITWEAKNESS.registerObjectLimit('R030', UNLIMITED)       //Code of Chivalry
    call FACTIONMOD_EXPLOITWEAKNESS.registerObjectLimit('R031', UNLIMITED)       //Elven Refugees             
          
    set FACTIONMOD_REFLECTIVEPLATING = FactionMod.create()
    call FACTIONMOD_REFLECTIVEPLATING.registerObjectLimit('h04C',UNLIMITED)        //Swordsman
    call FACTIONMOD_REFLECTIVEPLATING.registerObjectLimit('h02O',-UNLIMITED)       //Militia
    call FACTIONMOD_REFLECTIVEPLATING.registerObjectLimit('R030', UNLIMITED)       //Code of Chivalry
    call FACTIONMOD_REFLECTIVEPLATING.registerObjectLimit('R031', UNLIMITED)       //Elven Refugees             
          
    set FACTIONMOD_CODEOFCHIVALRY = FactionMod.create()
    call FACTIONMOD_CODEOFCHIVALRY.registerObjectLimit('h01B', UNLIMITED)      //Outrider
    call FACTIONMOD_CODEOFCHIVALRY.registerObjectLimit('h054', -UNLIMITED)     //Stormwind Knight                
          
    set FACTIONMOD_ELVENREFUGEES = FactionMod.create()
    call FACTIONMOD_ELVENREFUGEES.registerObjectLimit('h00A', -UNLIMITED)     //Spearman
    call FACTIONMOD_ELVENREFUGEES.registerObjectLimit('h05N', UNLIMITED)      //Marksman       
          
    set FACTIONMOD_SABOTEURTRAINING = FactionMod.create()  
    call FACTIONMOD_SABOTEURTRAINING.registerObjectLimit('h009', -12)             //Brigadier
    call FACTIONMOD_SABOTEURTRAINING.registerObjectLimit('h03Z', 12)              //Saboteur      
    call FACTIONMOD_SABOTEURTRAINING.registerObjectLimit('R03F', UNLIMITED)       //Assassin Training
    call FACTIONMOD_SABOTEURTRAINING.registerObjectLimit('R03K', UNLIMITED)       //Skirmisher Training
          
    set FACTIONMOD_ENFORCERTRAINING = FactionMod.create()
    call FACTIONMOD_ENFORCERTRAINING.registerObjectLimit('h009', -12)             //Brigadier
    call FACTIONMOD_ENFORCERTRAINING.registerObjectLimit('h05M', 12)              //Enforcer
    call FACTIONMOD_ENFORCERTRAINING.registerObjectLimit('R03F', UNLIMITED)       //Assassin Training
    call FACTIONMOD_ENFORCERTRAINING.registerObjectLimit('R03K', UNLIMITED)       //Skirmisher Training 
          
    set FACTIONMOD_ASSASSINTRAINING = FactionMod.create()
    call FACTIONMOD_ASSASSINTRAINING.registerObjectLimit('h00A', -UNLIMITED)      //Spearman
    call FACTIONMOD_ASSASSINTRAINING.registerObjectLimit('h05T', UNLIMITED)       //Assassin
    call FACTIONMOD_ASSASSINTRAINING.registerObjectLimit('R032', UNLIMITED)       //SI:7 Elite Training
          
    set FACTIONMOD_SKIRMISHERTRAINING = FactionMod.create()
    call FACTIONMOD_SKIRMISHERTRAINING.registerObjectLimit('h00A', -UNLIMITED)    //Spearman
    call FACTIONMOD_SKIRMISHERTRAINING.registerObjectLimit('h05U', UNLIMITED)     //Skirmisher       
    call FACTIONMOD_SKIRMISHERTRAINING.registerObjectLimit('R032', UNLIMITED)     //SI:7 Elite Training
        
    set FACTIONMOD_SI7ELITE = FactionMod.create()
    call FACTIONMOD_SI7ELITE.registerObjectLimit('h05V', 6)                       //SI:7 Agent  
            
    set FACTIONMOD_FOCUSINTHELIGHT = FactionMod.create()
    call FACTIONMOD_FOCUSINTHELIGHT.registerObjectLimit('R02X', UNLIMITED)        //Holy Mending   
    call FACTIONMOD_FOCUSINTHELIGHT.registerObjectLimit('R03C', UNLIMITED)        //Runic Constitution  
          
    set FACTIONMOD_SANCTUARYOFLIGHT = FactionMod.create()
    call FACTIONMOD_SANCTUARYOFLIGHT.registerObjectLimit('R02X', UNLIMITED)       //Holy Mending   
    call FACTIONMOD_SANCTUARYOFLIGHT.registerObjectLimit('R03C', UNLIMITED)       //Runic Constitution  
          
    set FACTIONMOD_RUNICCONSTITUTION = FactionMod.create()
    call FACTIONMOD_RUNICCONSTITUTION.registerObjectLimit('R03R', UNLIMITED)       //Reginald Windsor 
    call FACTIONMOD_RUNICCONSTITUTION.registerObjectLimit('R03P', UNLIMITED)       //Archbishop Benedictus    
        
    set FACTIONMOD_HOLYMENDING = FactionMod.create()
    call FACTIONMOD_HOLYMENDING.registerObjectLimit('R03R', UNLIMITED)       //Reginald Windsor 
    call FACTIONMOD_HOLYMENDING.registerObjectLimit('R03P', UNLIMITED)       //Archbishop Benedictus                
          
    set FACTIONMOD_ARCHBISHOPBENEDICTUS = FactionMod.create()
    call FACTIONMOD_ARCHBISHOPBENEDICTUS.registerObjectLimit('n09N', 6)               //Bishop of Light
                                                                  
    set FACTIONMOD_REGINALDWINDSOR = FactionMod.create()
    call FACTIONMOD_REGINALDWINDSOR.registerObjectLimit('n09N', 6)               //Bishop of Light
              
    set FACTIONMOD_ELECTRICSTRIKERITUAL = FactionMod.create()
    call FACTIONMOD_ELECTRICSTRIKERITUAL.registerObjectLimit('R03V', UNLIMITED)       //Stromgarde
    call FACTIONMOD_ELECTRICSTRIKERITUAL.registerObjectLimit('R03W', UNLIMITED)       //Honor Hold            
          
    set FACTIONMOD_SOLARFLARERITUAL = FactionMod.create()
    call FACTIONMOD_SOLARFLARERITUAL.registerObjectLimit('R03V', UNLIMITED)       //Stromgarde
    call FACTIONMOD_SOLARFLARERITUAL.registerObjectLimit('R03W', UNLIMITED)       //Honor Hold         
          
    set FACTIONMOD_MAGESOFSTROMGARDE = FactionMod.create()
    call FACTIONMOD_MAGESOFSTROMGARDE.registerObjectLimit('R03X', UNLIMITED)       //High Sorcerer Andromath
    call FACTIONMOD_MAGESOFSTROMGARDE.registerObjectLimit('R03Y', UNLIMITED)       //Katrana Prestor     
          
    set FACTIONMOD_KNOWLEDGEOFHONORHOLD = FactionMod.create()
    call FACTIONMOD_KNOWLEDGEOFHONORHOLD.registerObjectLimit('R03X', UNLIMITED)       //High Sorcerer Andromath
    call FACTIONMOD_KNOWLEDGEOFHONORHOLD.registerObjectLimit('R03Y', UNLIMITED)       //Katrana Prestor     
          
    set FACTIONMOD_HIGHSORCERERANDROMATH = FactionMod.create()
    call FACTIONMOD_HIGHSORCERERANDROMATH.registerObjectLimit('n05L', 6)               //Conjurer
          
    set FACTIONMOD_KATRANAPRESTOR = FactionMod.create()
    call FACTIONMOD_KATRANAPRESTOR.registerObjectLimit('n05L', 6)               //Conjurer                                                                                                                        
          
  endfunction
    
endlibrary
