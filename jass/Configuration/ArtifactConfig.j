
library ArtifactConfig initializer OnInit requires Artifact, ArtifactMenu, PlayerConfig

  globals
      private constant real DUMMY_X = 22700
      private constant real DUMMY_Y = 23735

      Artifact ARTIFACT_GHANIR
      Artifact ARTIFACT_SKULLOFGULDAN
      Artifact ARTIFACT_CROWNLORDAERON
  endglobals

  private function OnInit takes nothing returns nothing
    local Artifact tempArtifact = 0

    set tempArtifact = Artifact.create(CreateItem('I002', DUMMY_X, DUMMY_Y))    //The Crown of Stormwind
    call UnitAddItem(gg_unit_H00R_1875, tempArtifact.item)                      //Variann

    set tempArtifact = Artifact.create(CreateItem('I003', DUMMY_X, DUMMY_Y))    //Eye of Sargeras
    call UnitAddAbility(gg_unit_n04O_1571, ARTIFACT_HOLDER_ABIL_ID)             //Doom Guard
    call UnitAddItem(gg_unit_n04O_1571, tempArtifact.item)  

    set tempArtifact = Artifact.create(CreateItem('I00H', DUMMY_X, DUMMY_Y))    //Sulfuras
    call UnitAddAbility(gg_unit_N00D_1457, ARTIFACT_HOLDER_ABIL_ID)             //Ragnaros
    call UnitAddItem(gg_unit_N00D_1457, tempArtifact.item)   

    set tempArtifact = Artifact.create(CreateItem('I00F', DUMMY_X, DUMMY_Y))    //Gloves of Ahn'qiraj
    call UnitAddAbility(gg_unit_n02F_1138, ARTIFACT_HOLDER_ABIL_ID)             //C'thun (creep)
    call UnitAddItem(gg_unit_n02F_1138, tempArtifact.item)  

    set tempArtifact = Artifact.create(CreateItem('I01Y', DUMMY_X, DUMMY_Y))    //Helm of Domination
    call UnitAddAbility(gg_unit_u000_0649, ARTIFACT_HOLDER_ABIL_ID)
    call UnitAddItem(gg_unit_u000_0649, tempArtifact.item)

    set ARTIFACT_CROWNLORDAERON = Artifact.create(CreateItem('I001', DUMMY_X, DUMMY_Y))
    call UnitAddAbility(gg_unit_h000_0406, ARTIFACT_HOLDER_ABIL_ID) //Capital Palace
    call UnitAddItem(gg_unit_h000_0406, ARTIFACT_CROWNLORDAERON.item)

    set tempArtifact = Artifact.create(CreateItem('I00D', DUMMY_X, DUMMY_Y))    //Shalamayne
    call UnitAddItem(gg_unit_H00R_1875, tempArtifact.item)                      //Variann

    set tempArtifact = Artifact.create(CreateItem('klmm', DUMMY_X, DUMMY_Y))    //Killmaim
    call UnitAddAbility(gg_unit_H00E_1728, ARTIFACT_HOLDER_ABIL_ID)             //Ramzes the Horror
    call UnitAddItem(gg_unit_H00E_1728, tempArtifact.item) 

    set tempArtifact = Artifact.create(CreateItem('I01V', DUMMY_X, DUMMY_Y))    //Gorehowl
    call UnitAddItem(gg_unit_Ogrh_0249, tempArtifact.item)                      //Grom

    set tempArtifact = Artifact.create(CreateItem('I01O', DUMMY_X, DUMMY_Y))    //Trol'kalar
    call UnitAddItem(gg_unit_H00Z_1936, tempArtifact.item)                      //Galen Trollbane

    set tempArtifact = Artifact.create(CreateItem('I00I', DUMMY_X, DUMMY_Y))    //Scepter of the Queen
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
    call UnitAddAbility(gg_unit_ndtw_0858, ARTIFACT_HOLDER_ABIL_ID)             //Dark Troll Warlord
    call UnitAddItem(gg_unit_ndtw_0858, tempArtifact.item)

    set tempArtifact = Artifact.create(CreateItem('I01L', DUMMY_X, DUMMY_Y))    //Black Demon Soul Fragment
    call UnitAddAbility(gg_unit_nitw_2437, ARTIFACT_HOLDER_ABIL_ID)             //Ice Troll Warlord
    call UnitAddItem(gg_unit_nitw_2437, tempArtifact.item)

    set tempArtifact = Artifact.create(CreateItem('I01J', DUMMY_X, DUMMY_Y))    //Red Demon Soul Fragment
    call UnitAddAbility(gg_unit_nfsh_3661, ARTIFACT_HOLDER_ABIL_ID)             //Forest Troll High Priest
    call UnitAddItem(gg_unit_nfsh_3661, tempArtifact.item)

    set tempArtifact = Artifact.create(CreateItem('I01I', DUMMY_X, DUMMY_Y))    //Blue Demon Soul Fragment
    call UnitAddAbility(gg_unit_n072_1423, ARTIFACT_HOLDER_ABIL_ID)             //Vile Priestess Hexx
    call UnitAddItem(gg_unit_n072_1423, tempArtifact.item)

    set tempArtifact = Artifact.create(CreateItem('I01K', DUMMY_X, DUMMY_Y))    //Green Demon Soul Fragment
    call UnitAddAbility(gg_unit_O00O_1933, ARTIFACT_HOLDER_ABIL_ID)             //Zul'jin
    call UnitAddItem(gg_unit_O00O_1933, tempArtifact.item)

    set tempArtifact = Artifact.create(CreateItem('I01T', DUMMY_X, DUMMY_Y))    //Fandral's Flamescythe
    call UnitAddItem(gg_unit_E00K_2993, tempArtifact.item)                      //Fandral

    set tempArtifact = Artifact.create(CreateItem('arsh', DUMMY_X, DUMMY_Y))    //Arcanite Shield
    call UnitAddAbility(gg_unit_nsll_1588, ARTIFACT_HOLDER_ABIL_ID)             //Salazarian Lizard
    call UnitAddItem(gg_unit_nsll_1588, tempArtifact.item)  

    set tempArtifact = Artifact.create(CreateItem('dtsb', DUMMY_X, DUMMY_Y))    //Drek'thar's Spellbook
    call tempArtifact.setStatus(ARTIFACT_STATUS_SPECIAL)
    set tempArtifact.falseX = -11643
    set tempArtifact.falseY = 7318 

    set tempArtifact = Artifact.create(CreateItem('ktrm', DUMMY_X, DUMMY_Y))    //Urn of Kings
    call UnitAddItem(gg_unit_Huth_1343, tempArtifact.item)                      //Uther

    set tempArtifact = Artifact.create(CreateItem('gsou', DUMMY_X, DUMMY_Y))    //Soul Gem
    call tempArtifact.setStatus(ARTIFACT_STATUS_SPECIAL)
    set tempArtifact.falseX = -14269
    set tempArtifact.falseY = 22281

    set ARTIFACT_GHANIR = Artifact.create(CreateItem('I00C', DUMMY_X, DUMMY_Y))    //G'hanir
    call UnitAddAbility(gg_unit_nbwd_0737, ARTIFACT_HOLDER_ABIL_ID)                //Barrow Den  
    call UnitAddItem(gg_unit_nbwd_0737, ARTIFACT_GHANIR.item)  

    set tempArtifact = Artifact.create(CreateItem('thdm', DUMMY_X, DUMMY_Y))    //Thunderlizard Diamond
    call UnitAddAbility(gg_unit_nstw_2078, ARTIFACT_HOLDER_ABIL_ID)             //Storm Wyrm
    call UnitAddItem(gg_unit_nstw_2078, tempArtifact.item)     

    set tempArtifact = Artifact.create(CreateItem('cnhn', DUMMY_X, DUMMY_Y))    //Horn of Cenarius
    call UnitAddAbility(gg_unit_nhcn_2597, ARTIFACT_HOLDER_ABIL_ID)             //Horn of Cenarius Pedestal
    call UnitAddItem(gg_unit_nhcn_2597, tempArtifact.item)

    set tempArtifact = Artifact.create(CreateItem('kgal', DUMMY_X, DUMMY_Y))    //Keg of Thunderwater
    call UnitAddItem(gg_unit_Hmbr_0628, tempArtifact.item)  

    set tempArtifact = Artifact.create(CreateItem('I000', DUMMY_X, DUMMY_Y))    //Verdant Sphere
    call UnitAddItem(gg_unit_Hkal_1946, tempArtifact.item)                      //Kael'thas
  endfunction

endlibrary