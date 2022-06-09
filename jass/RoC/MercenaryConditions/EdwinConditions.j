library EdwinConditions requires EdwinSetup

globals
  private constant integer EDWIN_RESEARCH = 'R076'
  private boolean ForsakenAreUnleashed
  private boolean ScarletCrusadeUnleashed
  private boolean StormwindIsGone
endglobals

struct EdwinConditions

  private method CheckConditions takes nothing returns nothing
    call DisableEdwin()
    if ForsakenAreUnleashed == true then
      call EnableEdwin()
    else
      if ScarletCrusadeUnleashed == true then
        call EnableEdwin()
      else 
        if StormwindIsGone == true then
          call EnableEdwin()
        endif
      endif
    endif
  endmethod
  
  private method EnableEdwin takes nothing returns nothing
    local integer i = 0
    loop
      exitwhen i > MAX_PLAYERS
        call SetPlayerTechResearched(Player(i), EDWIN_RESEARCH, 1)
        set i = i + 1
      endloop
  endmethod

  private method DisableEdwin takes nothing returns nothing
    local integer i = 0
    loop
      exitwhen i > MAX_PLAYERS
        call SetPlayerTechResearched(Player(i), EDWIN_RESEARCH, 0)
        set i = i + 1
      endloop
  endmethod


endstruct


endlibrary