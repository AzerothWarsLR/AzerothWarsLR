library Display

  function DisplayUnitTypeAcquired takes player whichPlayer, integer unitId, string flavor returns nothing
    call DisplayTextToPlayer(whichPlayer, 0, 0, "\n|cff00ff00NEW UNIT ACQUIRED|r - " + GetObjectName(unitId))
    call DisplayTextToPlayer(whichPlayer, 0, 0, flavor)
    if GetLocalPlayer() == whichPlayer then
      call StartSound(bj_questHintSound)
    endif
  endfunction

  function DisplaySoloPath takes Faction whichFaction, string flavour returns nothing
    local string display = "\n|cffffcc00SOLO PATH - " + whichFaction.prefixCol + whichFaction.name + "|r\n" + flavour + "\n"
    call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, display)
  endfunction

endlibrary