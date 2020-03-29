library DemonGateConfig initializer OnInit requires DemonGate

  //DemonGateType parameters are: gate unit type, demon unit type, time between spawns
  //You must create DemonGateTypes before specifying which units are DemonGates

  private function OnInit takes nothing returns nothing
    call DemonGateType.create('n000', 'nfgu', 60)

    call DemonGate.create(gg_unit_n000_0717)
    call DemonGate.create(gg_unit_n000_1038)
    call DemonGate.create(gg_unit_n000_1585)
  endfunction

endlibrary