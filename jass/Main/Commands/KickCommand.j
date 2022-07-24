library BootCommand initializer OnInit requires Faction

  globals
    private constant string COMMAND     = "-boot "
    private string parameter = null
  endglobals

  private function Actions takes nothing returns nothing
    local string enteredString = GetEventPlayerChatString()
    local string content = null
    local Faction targetFaction = 0
    local Person senderPerson = Person.ByHandle(GetTriggerPlayer())
  
  	if SubString( enteredString, 0, StringLength(COMMAND) ) == COMMAND then
    	set content = SubString(enteredString, StringLength(COMMAND), StringLength(enteredString))
      set content = StringCase(content, false)
      set targetFaction = Faction.factionsByName[content]

      if senderPerson.Faction != FACTION_NAGA then
        call DisplayTextToPlayer(senderPerson.Player, 0, 0, "这个指令只能被雇主势力使用")
        return
      endif

      if targetFaction == 0 then
        call DisplayTextToPlayer(senderPerson.Player, 0, 0, content + "势力不存在。")
        return
      endif

      if targetFaction != FACTION_FEL_HORDE then
        call DisplayTextToPlayer(senderPerson.Player, 0, 0, "这个势力不能被踢出。")
        return
      endif

      if senderPerson.Faction == targetFaction then
        call DisplayTextToPlayer(senderPerson.Player, 0, 0, "你不能将你自己踢出游戏。")
        return
      endif

      if targetFaction.Person == 0 then
        call DisplayTextToPlayer(senderPerson.Player, 0, 0, "在" + targetFaction.ColoredName + "势力中不存在玩家。")
        return
      endif

      if GetOwningPlayer(LEGEND_BLACKTEMPLE.Unit) == FACTION_NAGA.Player then
        call DisplayTextToPlayer(senderPerson.Player, 0, 0, " " + targetFaction.ColoredName + "不是你的附庸。")
        return
      endif

      if targetFaction.Person != 0 then
        call targetFaction.obliterate()
        set targetFaction.Person.Faction = 0
      endif
      
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
    call TriggerAddAction( trig, function Actions )
  endfunction

endlibrary