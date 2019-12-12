
library UnitTypeConfig initializer OnInit requires UnitType

    private function OnInit takes nothing returns nothing
        local UnitType unitType = 0
        
        set unitType = UnitType.create('n063')      //High Elven Magus
            call unitType.setGoldCost(30)
            call unitType.setRefund(true)
            
        set unitType = UnitType.create('n086')      //Death Knight (Fel Horde)
            call unitType.setGoldCost(75)
            call unitType.setRefund(true)    
            
        set unitType = UnitType.create('h00H')      //Death Knight (Scourge)
            call unitType.setGoldCost(75)
            call unitType.setRefund(true)    
            
        set unitType = UnitType.create('u01A')      //Dreadlord Insurgent
            call unitType.setGoldCost(75)
            call unitType.setRefund(true)    
            
        set unitType = UnitType.create('u007')      //Dreadlord
            call unitType.setGoldCost(75)
            call unitType.setRefund(true)   
            call unitType.setIconPath("ReplaceableTextures\\CommandButtons\\BTNTichondrius.tga")   
            
        set unitType = UnitType.create('n04O')      //Doom Guard
            call unitType.setGoldCost(75)
            call unitType.setRefund(true)   
            call unitType.setIconPath("ReplaceableTextures\\CommandButtons\\BTNDoomGuard.tga")   
            
        set unitType = UnitType.create('o01H')      //Burning Bladelord
            call unitType.setGoldCost(75)
            call unitType.setRefund(true)                
            
        set unitType = UnitType.create('o00H')      //Burning Blademaster
            call unitType.setGoldCost(75)
            call unitType.setRefund(true)         
            
        set unitType = UnitType.create('o01L')      //Shattered Hand Executioner
            call unitType.setGoldCost(75)
            call unitType.setRefund(true)     
            
        set unitType = UnitType.create('h00F')      //Lordaeron Paladin
            call unitType.setGoldCost(75)
            call unitType.setRefund(true)  
            
        set unitType = UnitType.create('h06B')      //Grand Crusader
            call unitType.setGoldCost(75)
            call unitType.setRefund(true)       
            
        set unitType = UnitType.create('h06D')      //Silver Hand Veteran Paladin
            call unitType.setGoldCost(75)
            call unitType.setRefund(true)      
            
        set unitType = UnitType.create('n00A')      //Farstrider
            call unitType.setGoldCost(75)
            call unitType.setRefund(true)      
            
        set unitType = UnitType.create('n048')      //Blood Mage
            call unitType.setGoldCost(75)
            call unitType.setRefund(true)   
            
        set unitType = UnitType.create('n007')      //Kirin Tor
            call unitType.setGoldCost(75)
            call unitType.setRefund(true) 
            
        set unitType = UnitType.create('e00O')      //Shadowleaf Sentinel
            call unitType.setGoldCost(75)
            call unitType.setRefund(true)      
            
        set unitType = UnitType.create('e00N')      //Keeper of the Grove
            call unitType.setGoldCost(75)
            call unitType.setRefund(true)       
            
        set unitType = UnitType.create('n09E')      //Orc Champion (Bloodpact)
            call unitType.setGoldCost(75)
            call unitType.setRefund(true)                     
            
        set unitType = UnitType.create('noga')      //Orc Champion
            call unitType.setGoldCost(75)
            call unitType.setRefund(true)   
            
        set unitType = UnitType.create('o00A')      //Far Seer
            call unitType.setGoldCost(75)
            call unitType.setRefund(true)        
            
        set unitType = UnitType.create('o024')      //Stormreaver Warlock
            call unitType.setGoldCost(75)
            call unitType.setRefund(true)       
            
        set unitType = UnitType.create('h05F')      //Stormwind Champion
            call unitType.setGoldCost(75)
            call unitType.setRefund(true)       
            
        set unitType = UnitType.create('h01L')      //Thane
            call unitType.setGoldCost(75)
            call unitType.setRefund(true)      
            
        set unitType = UnitType.create('nnrg')      //Royal Guard
            call unitType.setGoldCost(75)
            call unitType.setLumberCost(100)
            call unitType.setRefund(true)         
            
        set unitType = UnitType.create('h05V')      //Thane
            call unitType.setGoldCost(75)
            call unitType.setRefund(true)               
            
        set unitType = UnitType.create('nsgb')      //Sea Giant Behemoth
            call unitType.setGoldCost(100)
            call unitType.setRefund(true) 
            
        set unitType = UnitType.create('nahy')      //Ancient Hydra
            call unitType.setGoldCost(120)
            call unitType.setRefund(true)         
            
        set unitType = UnitType.create('h01H')      //Fleet Commander
            call unitType.setGoldCost(60)
            call unitType.setRefund(true)     
            
        set unitType = UnitType.create('nfgl')      //Ancient Hydra
            call unitType.setGoldCost(95)
            call unitType.setRefund(true)         
            
        set unitType = UnitType.create('n09T')      //Steel Titan
            call unitType.setGoldCost(400)
            call unitType.setRefund(true)          
            
        set unitType = UnitType.create('n09S')      //Stone Titan
            call unitType.setGoldCost(400)
            call unitType.setRefund(true)     
            
        set unitType = UnitType.create('n04N')      //Lady Deathwhisper
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)    
            
        set unitType = UnitType.create('uswb')      //Sylvanas (Ghost)
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)           
            
        set unitType = UnitType.create('o00B')      //Jubei'thos
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)   
            
        set unitType = UnitType.create('o02N')      //Bloodgrin
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)               
            
        set unitType = UnitType.create('o02I')      //Bonethirst
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)       
            
        set unitType = UnitType.create('n064')      //War Master Voone
            call unitType.setGoldCost(100)
            call unitType.setRefund(true) 
            
        set unitType = UnitType.create('n05T')      //Kazzak the Supreme
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)    
            
        set unitType = UnitType.create('h012')      //Captain Falric
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)     
            
        set unitType = UnitType.create('h04J')      //Darius Crowley (Undead)
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)        
            
        set unitType = UnitType.create('h04J')      //Darius Crowley
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)  
            
        set unitType = UnitType.create('n075')      //Vereesa Windrunner
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)    
            
        set unitType = UnitType.create('njks')      //Jailor Kassan
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)   
            
        set unitType = UnitType.create('h01M')      //Baelgun
            call unitType.setGoldCost(100)
            call unitType.setRefund(true) 
            
        set unitType = UnitType.create('h03W')      //Danath Trollbane
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)          
            
        set unitType = UnitType.create('h05W')      //Archbishop Benedictus
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)   
            
        set unitType = UnitType.create('h05X')      //High Sorcerer Andromath
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)      
            
        set unitType = UnitType.create('n065')      //Katrana Prestor
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)          
            
        set unitType = UnitType.create('h03F')      //Reginald Windsor
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)  
            
        set unitType = UnitType.create('h05Y')      //Bolvar Fordragon
            call unitType.setGoldCost(100)
            call unitType.setRefund(true) 
            
        set unitType = UnitType.create('h03W')      //Danath Trollbane
            call unitType.setGoldCost(100)
            call unitType.setRefund(true) 
            
        set unitType = UnitType.create('h05X')      //High Sorcerer Andromath
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)     
            
        set unitType = UnitType.create('n065')      //Draz'Zilb
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)                   
            
        set unitType = UnitType.create('o025')      //Nazgrel (Bloodpact)
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)  
            
        set unitType = UnitType.create('o01R')      //Nazgrel
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)        
            
        set unitType = UnitType.create('h04E')      //Chen Stormstout
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)      
            
        set unitType = UnitType.create('h00C')      //Drek'thar
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)   
            
        set unitType = UnitType.create('h02F')      //Moon Priestess Amara
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)           
            
        set unitType = UnitType.create('ensh')      //Naisha
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)        
            
        set unitType = UnitType.create('e015')      //Broll Bearmantle
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)          
            
        set unitType = UnitType.create('h052')      //Dar'Khan Drathir
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)
            
        set unitType = UnitType.create('ubdd')      //Sapphiron
            call unitType.setGoldCost(100)
            call unitType.setRefund(true)   

        set unitType = UnitType.create('h03Q')      //Hall of Explorers
            call unitType.setGoldCost(0)
            call unitType.setRefund(true)               
            
        set unitType = UnitType.create('h03V')      //Path Research
            call unitType.setMeta(true)       
            
        set unitType = UnitType.create('h023')      //Mastery Research
            call unitType.setMeta(true)         
            
        set unitType = UnitType.create('h06M')      //Alliance Center
            call unitType.setMeta(true)     

        set unitType = UnitType.create('u008')      //Peasant converter
            call unitType.setRefund(true)         
            
        set unitType = UnitType.create('o01C')      //Throne of Kil'jaeden
            call unitType.setRefund(true)          

        set unitType = UnitType.create('uktg')      //Kel'thuzad (Ghost)
            call unitType.setRefund(true)         
            call unitType.setGoldCost(100)                            

        set unitType = UnitType.create('ninf')      //Infernal
            call unitType.setIconPath("ReplaceableTextures\\CommandButtons\\BTNInfernal.tga")      

        set unitType = UnitType.create('nvdw')      //Voidwalker
            call unitType.setIconPath("ReplaceableTextures\\CommandButtons\\BTNVoidWalker.tga")      
                
        set unitType = UnitType.create('n04H')      //Felguard
            call unitType.setIconPath("ReplaceableTextures\\CommandButtons\\BTNFelGuard.tga")    

        set unitType = UnitType.create('n04J')      //Fel Stalker
            call unitType.setIconPath("ReplaceableTextures\\CommandButtons\\BTNFelHound.tga") 

        set unitType = UnitType.create('ninc')      //Infernal Contraption
            call unitType.setIconPath("ReplaceableTextures\\CommandButtons\\BTNInfernalCannon.tga") 

        set unitType = UnitType.create('n070')      //Nether Drake
            call unitType.setIconPath("ReplaceableTextures\\CommandButtons\\BTNNetherDragon.tga") 

        set unitType = UnitType.create('n04U')      //Nether Dragon
            call unitType.setIconPath("ReplaceableTextures\\CommandButtons\\BTNNetherDragon.tga")   

        set unitType = UnitType.create('n04L')      //Infernal Juggernaut
            call unitType.setIconPath("ReplaceableTextures\\CommandButtons\\BTNInfernalFlameCannon.tga")   

        set unitType = UnitType.create('n04P')      //Warlock
            call unitType.setIconPath("ReplaceableTextures\\CommandButtons\\BTNEredarWarlockPurple.tga")   

        set unitType = UnitType.create('n04K')      //Succubus
            call unitType.setIconPath("ReplaceableTextures\\CommandButtons\\BTNBlueDemoness.tga")      

        set unitType = UnitType.create('u00K')      //Fel Reaver
            call unitType.setIconPath("ReplaceableTextures\\CommandButtons\\BTNInfernal2.tga")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    endfunction    



endlibrary