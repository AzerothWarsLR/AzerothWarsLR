library Display

  function DisplaySoloPath takes Faction whichFaction, string flavour returns nothing
    local string display = "|cffffcc00SOLO PATH - " + whichFaction.prefixCol + whichFaction.name + "|r\n" + flavour + "\n"
    call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, display)
  endfunction

endlibrary