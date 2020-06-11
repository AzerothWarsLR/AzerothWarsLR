library RewardConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_THANEREWARD
    FactionMod FACTIONMOD_WYVERNREWARD
    FactionMod FACTIONMOD_PRIESTESSREWARD
    FactionMod FACTIONMOD_OBSIDIANREWARD
  endglobals
      
  
  private function OnInit takes nothing returns nothing  
    local FactionMod f

    set FACTIONMOD_THANEREWARD = FactionMod.create()
    call FACTIONMOD_THANEREWARD.registerObjectLimit('h01L', 2) //Thanes

    //Wyvern Reward
    set FACTIONMOD_WYVERNREWARD = FactionMod.create()
    call FACTIONMOD_WYVERNREWARD.registerObjectLimit('owyv', 4) //Wyverns

    //Priestess Reward
    set FACTIONMOD_PRIESTESSREWARD = FactionMod.create()
    call FACTIONMOD_PRIESTESSREWARD.registerObjectLimit('h04L', 2) //Priestess of the Moon

    // obsidian Reward
    set FACTIONMOD_OBSIDIANREWARD = FactionMod.create()
    call FACTIONMOD_OBSIDIANREWARD.registerObjectLimit('uobs', 2) //Obsidian Statue
  endfunction
    
endlibrary                                         