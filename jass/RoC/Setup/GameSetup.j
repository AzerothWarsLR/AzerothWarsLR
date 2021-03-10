library GameSetup initializer OnInit requires ArtifactSetup, InstanceSetup, PersonSetup, TeamSetup, QuestSetup, ShoreSetup, ControlPointSetup, FactionSetup, VassalSetup

  public function OnInit takes nothing returns nothing
    call ShoreSetup_OnInit()
    call InstanceSetup_OnInit()
    call TeamSetup_OnInit()
    call FactionSetup_OnInit()
    call VassalSetup_OnInit()
    call PersonSetup_OnInit()
    call ArtifactSetup_OnInit()
    call ControlPointSetup_OnInit()
    call QuestSetup_OnInit()
  endfunction

endlibrary