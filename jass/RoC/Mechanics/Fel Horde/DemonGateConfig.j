library DemonGateConfig initializer OnInit requires DemonGate

  //DemonGateType parameters are: gate unit type, demon unit type, time between spawns
  //You must create DemonGateTypes before specifying which units are DemonGates

  private function OnInit takes nothing returns nothing
    call DemonGateType.create('n000', 'n059', 40, 2)  //T1 Hounds
    call DemonGateType.create('n04I', 'ndqn', 60, 2)  //T1 succ
    call DemonGateType.create('n05F', 'nvdl', 30, 1)  //T1 void
    call DemonGateType.create('n05I', 'n059', 55, 6)  //T2 Hounds
    call DemonGateType.create('n05R', 'n05B', 85, 4)  //T2 felguard
    call DemonGateType.create('n05S', 'ndqt', 70, 2)  //T2 Succ
    call DemonGateType.create('n05W', 'ners', 75, 2)  //T2 Eredar
    call DemonGateType.create('n06G', 'n08C', 30, 1)  //T2 Void
    call DemonGateType.create('n06H', 'o015', 90, 1)  //T2 Pitfiend
    call DemonGateType.create('n06Q', 'n04O', 150, 2) //T3 Doomguard
    call DemonGateType.create('n06R', 'npfm', 60, 4)  //T3 Ravager
    call DemonGateType.create('n06V', 'nfgb', 140, 3) //T3 Bloodfiend
    call DemonGateType.create('n06Z', 'n05A', 130, 2) //T3 Overseer
    call DemonGateType.create('n07B', 'ndqs', 120, 1) //T3 Queen
    call DemonGateType.create('n07D', 'ndqp', 100, 2) //T3 Maiden
    call DemonGateType.create('n07G', 'n05D', 90, 3)  //T3 Infernal
    call DemonGateType.create('n07H', 'o01V', 120, 2) //T3 Eredar
    call DemonGateType.create('n07M', 'n089', 160, 2) //T3 Voidcaller
    call DemonGateType.create('n07N', 'n088', 120, 1) //T3 Voidlord
    call DemonGateType.create('n07O', 'o014', 240, 1) //T3 Void Hunter
    call DemonGateType.create('n087', 'o01B', 140, 1) //T3 Pit Lord
    
    call DemonGate.create(gg_unit_n000_0717)
    call DemonGate.create(gg_unit_n05F_3538)
    call DemonGate.create(gg_unit_n04I_1038)
  endfunction

endlibrary