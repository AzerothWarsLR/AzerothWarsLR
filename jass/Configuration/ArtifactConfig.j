library ArtifactConfig initializer OnInit requires Artifact, ArtifactMenu, PlayerConfig

  globals
      private constant real DUMMY_X = 20195
      private constant real DUMMY_Y = 24177

      Artifact ARTIFACT_GHANIR
      Artifact ARTIFACT_SKULLOFGULDAN
      Artifact ARTIFACT_CROWNLORDAERON
      Artifact ARTIFACT_CROWNSTORMWIND
      Artifact ARTIFACT_BELTOFGIANTSTRENGTH
      Artifact ARTIFACT_HELMOFDOMINATION
      Artifact ARTIFACT_DREKTHARSSPELLBOOK
      Artifact ARTIFACT_SCEPTEROFTHEQUEEN
      Artifact ARTIFACT_CROWNEASTERNKINGDOMS
  endglobals

  private function OnInit takes nothing returns nothing
    local Artifact tempArtifact = 0

    set ARTIFACT_CROWNSTORMWIND = Artifact.create(CreateItem('I002', DUMMY_X, DUMMY_Y))
    call UnitAddItem(gg_unit_H00R_1875, ARTIFACT_CROWNSTORMWIND.item)                      //Variann

    set tempArtifact = Artifact.create(CreateItem('I003', DUMMY_X, DUMMY_Y))    //Eye of Sargeras
    call UnitAddAbility(gg_unit_n04O_1571, ARTIFACT_HOLDER_ABIL_ID)             //Doom Guard
    call UnitAddItem(gg_unit_n04O_1571, tempArtifact.item)  

    set tempArtifact = Artifact.create(CreateItem('I00H', DUMMY_X, DUMMY_Y))    //Sulfuras
    call UnitAddAbility(gg_unit_N00D_1457, ARTIFACT_HOLDER_ABIL_ID)             //Ragnaros
    call UnitAddItem(gg_unit_N00D_1457, tempArtifact.item)   

    set ARTIFACT_HELMOFDOMINATION = Artifact.create(CreateItem('I01Y', DUMMY_X, DUMMY_Y))    //Helm of Domination
    call UnitAddAbility(gg_unit_u000_0649, ARTIFACT_HOLDER_ABIL_ID)                          //Frozen Throne  
    call UnitAddItem(gg_unit_u000_0649, ARTIFACT_HELMOFDOMINATION.item)                            

    set ARTIFACT_CROWNLORDAERON = Artifact.create(CreateItem('I001', DUMMY_X, DUMMY_Y))//Crown of Lordaeron
    call UnitAddAbility(gg_unit_nemi_0019, ARTIFACT_HOLDER_ABIL_ID)                    //King Terenas
    call UnitAddItem(gg_unit_nemi_0019, ARTIFACT_CROWNLORDAERON.item)           

    set tempArtifact = Artifact.create(CreateItem('I00D', DUMMY_X, DUMMY_Y))    //Shalamayne
    call UnitAddItem(gg_unit_H00R_1875, tempArtifact.item)                      //Variann

    set tempArtifact = Artifact.create(CreateItem('klmm', DUMMY_X, DUMMY_Y))    //Killmaim
    call UnitAddAbility(gg_unit_H00E_1728, ARTIFACT_HOLDER_ABIL_ID)             //Ramzes the Horror
    call UnitAddItem(gg_unit_H00E_1728, tempArtifact.item) 

    set tempArtifact = Artifact.create(CreateItem('I01V', DUMMY_X, DUMMY_Y))    //Gorehowl
    call UnitAddItem(gg_unit_Ogrh_0249, tempArtifact.item)                      //Grom

    set tempArtifact = Artifact.create(CreateItem('I01O', DUMMY_X, DUMMY_Y))    //Trol'kalar
    call UnitAddItem(gg_unit_H00Z_1936, tempArtifact.item)                      //Galen Trollbane

    set ARTIFACT_SCEPTEROFTHEQUEEN = Artifact.create(CreateItem('I00I', DUMMY_X, DUMMY_Y))
    call UnitAddAbility(gg_unit_n085_2846, ARTIFACT_HOLDER_ABIL_ID)             //The Atheneum
    call UnitAddItem(gg_unit_n085_2846, tempArtifact.item)    

    set tempArtifact = Artifact.create(CreateItem('I006', DUMMY_X, DUMMY_Y))    //Book of Medivh
    call UnitAddAbility(gg_unit_nbsm_1188, ARTIFACT_HOLDER_ABIL_ID)             //Book of Medivh Pedestal
    call UnitAddItem(gg_unit_nbsm_1188, tempArtifact.item) 

    set ARTIFACT_SKULLOFGULDAN = Artifact.create(CreateItem('I007', DUMMY_X, DUMMY_Y))    //Skull of Gul'dan
    call ARTIFACT_SKULLOFGULDAN.setStatus(ARTIFACT_STATUS_HIDDEN)
    call ARTIFACT_SKULLOFGULDAN.setDescription("In a far away land")

    set tempArtifact = Artifact.create(CreateItem('I004', DUMMY_X, DUMMY_Y))    //The Doomhammer
    call UnitAddItem(gg_unit_Othr_1598, tempArtifact.item)                      //Thrall

    set tempArtifact = Artifact.create(CreateItem('I01A', DUMMY_X, DUMMY_Y))    //Demon Soul
    call tempArtifact.setStatus(ARTIFACT_STATUS_HIDDEN)
    call tempArtifact.setDescription("Assembled from its fragments")

    set tempArtifact = Artifact.create(CreateItem('I01M', DUMMY_X, DUMMY_Y))    //Bronze Demon Soul Fragment
    call UnitAddAbility(gg_unit_O024_0567, ARTIFACT_HOLDER_ABIL_ID)             //Ukorz
    call UnitAddItem(gg_unit_O024_0567, tempArtifact.item)

    set tempArtifact = Artifact.create(CreateItem('I01L', DUMMY_X, DUMMY_Y))    //Black Demon Soul Fragment
    call UnitAddAbility(gg_unit_O026_1705, ARTIFACT_HOLDER_ABIL_ID)             //Rastakhan
    call UnitAddItem(gg_unit_O026_1705, tempArtifact.item)

    set tempArtifact = Artifact.create(CreateItem('I01J', DUMMY_X, DUMMY_Y))    //Red Demon Soul Fragment
    call UnitAddAbility(gg_unit_O023_0517, ARTIFACT_HOLDER_ABIL_ID)             //Jin'do
    call UnitAddItem(gg_unit_O023_0517, tempArtifact.item)

    set tempArtifact = Artifact.create(CreateItem('I01I', DUMMY_X, DUMMY_Y))    //Blue Demon Soul Fragment
    call UnitAddAbility(gg_unit_O02C_2437, ARTIFACT_HOLDER_ABIL_ID)             //Gal'darah
    call UnitAddItem(gg_unit_O02C_2437, tempArtifact.item)

    set tempArtifact = Artifact.create(CreateItem('I01K', DUMMY_X, DUMMY_Y))    //Green Demon Soul Fragment
    call UnitAddAbility(gg_unit_O00O_1933, ARTIFACT_HOLDER_ABIL_ID)             //Zul'jin
    call UnitAddItem(gg_unit_O00O_1933, tempArtifact.item)


    set tempArtifact = Artifact.create(CreateItem('arsh', DUMMY_X, DUMMY_Y))    //Shroud of Nozdormuru
    call UnitAddAbility(gg_unit_O025_3426, ARTIFACT_HOLDER_ABIL_ID)             //Occulus
    call UnitAddItem(gg_unit_O025_3426, tempArtifact.item)  

    set ARTIFACT_DREKTHARSSPELLBOOK = Artifact.create(CreateItem('dtsb', DUMMY_X, DUMMY_Y))    //Drek'thar's Spellbook
    call ARTIFACT_DREKTHARSSPELLBOOK.setStatus(ARTIFACT_STATUS_HIDDEN)
    call ARTIFACT_DREKTHARSSPELLBOOK.setDescription("Frostwolf Quest")

    set tempArtifact = Artifact.create(CreateItem('ktrm', DUMMY_X, DUMMY_Y))    //Urn of Kings
    call UnitAddItem(gg_unit_Huth_1343, tempArtifact.item)                      //Uther

    set tempArtifact = Artifact.create(CreateItem('gsou', DUMMY_X, DUMMY_Y))    //Soul Gem
    call tempArtifact.setStatus(ARTIFACT_STATUS_SPECIAL)
    set tempArtifact.falseX = -14269
    set tempArtifact.falseY = 22281

    set ARTIFACT_GHANIR = Artifact.create(CreateItem('I00C', DUMMY_X, DUMMY_Y))    //G'hanir
    call UnitAddAbility(gg_unit_nbwd_0737, ARTIFACT_HOLDER_ABIL_ID)                //Barrow Den  
    call UnitAddItem(gg_unit_nbwd_0737, ARTIFACT_GHANIR.item)     

    set tempArtifact = Artifact.create(CreateItem('cnhn', DUMMY_X, DUMMY_Y))    //Horn of Cenarius
    call UnitAddAbility(gg_unit_nhcn_2597, ARTIFACT_HOLDER_ABIL_ID)             //Horn of Cenarius Pedestal
    call UnitAddItem(gg_unit_nhcn_2597, tempArtifact.item)

    set tempArtifact = Artifact.create(CreateItem('kgal', DUMMY_X, DUMMY_Y))    //Keg of Thunderwater
    call UnitAddItem(gg_unit_Hmbr_0628, tempArtifact.item)  

    set tempArtifact = Artifact.create(CreateItem('I00J', DUMMY_X, DUMMY_Y))    //Felo'melorn
    call UnitAddItem(gg_unit_H00Q_0630, tempArtifact.item)                      //Anasterian

    set tempArtifact = Artifact.create(CreateItem('I00K', DUMMY_X, DUMMY_Y))    //Essence
    call UnitAddItem(gg_unit_n03T_0555, tempArtifact.item)                      //Murmur

    set ARTIFACT_BELTOFGIANTSTRENGTH = Artifact.create(CreateItem('I00R', DUMMY_X, DUMMY_Y))    //Belt of Giant Strength
    call ARTIFACT_BELTOFGIANTSTRENGTH.setStatus(ARTIFACT_STATUS_HIDDEN)
    call ARTIFACT_BELTOFGIANTSTRENGTH.setDescription("Fel Horde Quest")

    set ARTIFACT_CROWNEASTERNKINGDOMS = Artifact.create(CreateItem('I00U', DUMMY_X, DUMMY_Y))
    call ARTIFACT_CROWNEASTERNKINGDOMS.setStatus(ARTIFACT_STATUS_HIDDEN)
    call ARTIFACT_CROWNEASTERNKINGDOMS.setDescription("Stormwind and Lordaeron Quest")
  endfunction

endlibrary