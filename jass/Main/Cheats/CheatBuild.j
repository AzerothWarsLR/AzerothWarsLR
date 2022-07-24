
library CheatBuild initializer OnInit requires Persons, TestSafety, PlayerUnitEventFilterManager

  //**CONFIG
  globals
    private constant string COMMAND     = "-build "
    private boolean array BuildToggle
  endglobals
  //*ENDCONFIG

  private function Build takes nothing returns nothing
  if GetIssuedOrderId() == 851976 and BuildToggle[GetPlayerId(GetTriggerPlayer())] then
      call UnitSetConstructionProgress(GetTriggerUnit(), 100)
      call UnitSetUpgradeProgress(GetTriggerUnit(), 100)
    endif
  endfunction
  
  private function Actions takes nothing returns nothing
    local integer i = 0
    local string enteredString = GetEventPlayerChatString()
    local player p = GetTriggerPlayer()
    local integer pId = GetPlayerId(p)
    local string parameter = SubString(enteredString, StringLength(COMMAND), StringLength(enteredString))  
    
    if parameter == "on" then
      set BuildToggle[pId] = true
      call DisplayTextToPlayer(p, 0, 0, "|cffD27575CHEAT:|r 快速建造已激活。你的建筑在被取消后会立即建好。")
    elseif parameter == "off" then
      set BuildToggle[pId] = false
      call DisplayTextToPlayer(p, 0, 0, "|cffD27575CHEAT:|r 快速建造已关闭。你的建筑会正常建造。")
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    local integer i = 0

    loop
    exitwhen i > MAX_PLAYERS
      call TriggerRegisterPlayerChatEvent( trig, Player(i), COMMAND, false )
      set i = i + 1
    endloop   
    call TriggerAddCondition(trig, Condition(function CheatCondition))
    call TriggerAddAction(trig, function Actions)

    call PlayerUnitEventAddAction(EVENT_PLAYER_UNIT_ISSUED_ORDER, function Build)
  endfunction
  
endlibrary