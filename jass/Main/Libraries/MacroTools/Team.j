library Team initializer OnInit requires Table, Event, Persons, Set, ScoreStatus
  globals
    private integer DEFAULT_MAX_WEIGHT = 6  //All Teams have this much maximum weight

    Event OnTeamCreate = 0
    Event OnTeamSizeChange = 0
    Event OnTeamWeightChange = 0
    Event TeamScoreStatusChanged
  endglobals

  struct Team     
    readonly static StringTable teamsByName
    private static thistype array teamsByIndex
    private static integer teamCount = 0
    readonly static thistype triggerTeam = 0

    private string name = null
    private Set invitees //Factions invited to join this Team
    private Set factions
    private integer scoreStatus

    method operator ScoreStatus takes nothing returns integer
      return this.scoreStatus
    endmethod

    method operator CapitalCount takes nothing returns integer
      local integer total = 0
      local integer i = 0
      local Legend loopLegend
      loop
        exitwhen i == Legend.Count
        set loopLegend = Legend.ByIndex(i)
        if loopLegend != 0 and loopLegend.Unit != null and loopLegend.OwningFaction.Team == this and loopLegend.IsCapital == true and UnitAlive(loopLegend.Unit) then
          set total = total + 1
        endif
        set i = i + 1
      endloop
      return total
    endmethod

    method operator ControlPointCount takes nothing returns integer
      local integer total = 0
      local integer i = 0
      loop
        exitwhen i == this.FactionCount
        if this.GetFactionByIndex(i).Person != 0 then
          set total = total + this.GetFactionByIndex(i).Person.ControlPointCount
        endif
        set i = i + 1
      endloop
      return total
    endmethod

    //If a team's score status becomes victorious, they get Gold Gathered equal to their Control Point count plus seconds spent in game.
    //If they're defeated, they instead just get Gold Gathered equal to time spent in game.
    //Either way, they are removed from the game.
    method operator ScoreStatus= takes integer value returns nothing
      local integer i = 0
      local Faction loopFaction
      local integer cpCount = this.ControlPointCount
      set this.scoreStatus = value
      loop
        exitwhen i == this.factions.size
        set loopFaction = Faction(this.factions[i])
        if loopFaction.Person != 0 then
          if value == SCORESTATUS_VICTORIOUS then
            call SetPlayerState(loopFaction.Player, PLAYER_STATE_GOLD_GATHERED, R2I(GetGameTime()) + cpCount)
          elseif value == SCORESTATUS_DEFEATED then
            call SetPlayerState(loopFaction.Player, PLAYER_STATE_GOLD_GATHERED, R2I(GetGameTime()))
          endif
          if loopFaction.ScoreStatus != value then
            set loopFaction.ScoreStatus = value
          endif
        endif
        set i = i + 1 
      endloop
      call TeamScoreStatusChanged.fire()
    endmethod

    method operator Name takes nothing returns string
      return this.name
    endmethod

    method operator FactionCount takes nothing returns integer
      return this.factions.size
    endmethod

    //Only includes filled Factions
    method operator PlayerCount takes nothing returns integer
      local integer i = 0
      local integer total = 0
      local Faction loopFaction
      loop
        exitwhen i == factions.size
        set loopFaction = factions[i]
        if loopFaction.Person != 0 and loopFaction.ScoreStatus == SCORESTATUS_NORMAL then
          set total = total + 1
        endif
        set i = i + 1
      endloop
      return total
    endmethod

    method operator MaxWeight takes nothing returns integer
      return DEFAULT_MAX_WEIGHT
    endmethod

    method operator Weight takes nothing returns integer
      local integer i = 0
      local integer total = 0
      loop
        exitwhen i == factions.size
        if Faction(factions[i]).Person != 0 then
          set total = total + Faction(factions[i]).Weight
        endif
        set i = i + 1
      endloop
      return total
    endmethod

    method GetFactionByIndex takes integer index returns Faction
      return this.factions[index]
    endmethod

    method RemoveFaction takes Faction faction returns nothing
      local integer i = 0
      if not this.factions.contains(faction) then
        call BJDebugMsg("Attempted to remove non-present faction " + faction.Name + " from team " + this.name)
      endif
      call this.factions.remove(faction)
      //Make all present factions ally the new faction and visa-versa
      if faction.Person != 0 then
        call this.UnallyPlayer(faction.Player)
      endif
      //
      set thistype.triggerTeam = this
      call OnTeamSizeChange.fire()
    endmethod

    method AddFaction takes Faction faction returns nothing
      local integer i = 0
      if this.factions.contains(faction) then
        call BJDebugMsg("Attempted to add already present faction " + faction.Name + " to team " + this.name)
      endif
      call this.factions.add(faction)
      //Make all present factions ally the new faction and visa-versa
      if faction.Person != 0 then
        call this.AllyPlayer(faction.Player)
      endif
      //
      set thistype.triggerTeam = this
      call OnTeamSizeChange.fire()
    endmethod

    method AllyPlayer takes player whichPlayer returns nothing
      local integer i = 0
      loop
        exitwhen i == this.FactionCount
        call SetPlayerAllianceStateBJ(whichPlayer, this.GetFactionByIndex(i).Player, bj_ALLIANCE_ALLIED_VISION)
        call SetPlayerAllianceStateBJ(this.GetFactionByIndex(i).Player, whichPlayer, bj_ALLIANCE_ALLIED_VISION)
        set i = i + 1
      endloop
      set thistype.triggerTeam = this
    endmethod

    method UnallyPlayer takes player whichPlayer returns nothing
      local integer i = 0
      loop
        exitwhen i == this.FactionCount
        call SetPlayerAllianceStateBJ(whichPlayer, this.GetFactionByIndex(i).Player, bj_ALLIANCE_UNALLIED)
        call SetPlayerAllianceStateBJ(this.GetFactionByIndex(i).Player, whichPlayer, bj_ALLIANCE_UNALLIED)
        set i = i + 1
      endloop
      set thistype.triggerTeam = this
    endmethod

    //Revokes an invite sent to a player
    method Uninvite takes Faction whichFaction returns nothing
      if this.invitees.contains(whichFaction) then
        call this.DisplayText(whichFaction.prefixCol + whichFaction.name + "|r is no longer invited to join the " + this.name + ".")
        call DisplayTextToPlayer(whichFaction.Player, 0, 0, "You are no longer invited to join the " + this.name + ".")
        call this.invitees.remove(whichFaction)
      endif
    endmethod

    //Sends an invite to this team to a player, which they can choose to accept at a later date
    method Invite takes Faction whichFaction returns nothing
      if not this.factions.contains(whichFaction) and not this.invitees.contains(whichFaction) and whichFaction.CanBeInvited == true then
        if GetLocalPlayer() == whichFaction.Player or this.factions.contains(Person.ByHandle(GetLocalPlayer())) then
          call StartSound(gg_snd_ArrangedTeamInvitation)
        endif
        call this.DisplayText(whichFaction.prefixCol + whichFaction.name + "|r has been invited to join the " + this.name + ".")
        call DisplayTextToPlayer(whichFaction.Player, 0, 0, "You have been invited to join the " + this.name + ". Type -join " + this.name + " to accept.")
        call this.invitees.add(whichFaction)
      endif
    endmethod
    
    method DisplayText takes string text returns nothing
      local integer i = 0
      loop
      exitwhen i == factions.size
        call DisplayTextToPlayer(Faction(this.factions[i]).Player, 0, 0, text)
        set i = i + 1
      endloop
    endmethod

    method CreateForceFromPlayers takes nothing returns force
      local integer i = 0
      local force newForce = CreateForce()
      local Faction loopFaction
      loop
        exitwhen i == factions.size
        set loopFaction = factions[i]
        if loopFaction.Person != 0 and loopFaction.ScoreStatus == SCORESTATUS_NORMAL then
          call ForceAddPlayer(newForce, Faction(factions[i]).Player)
        endif
        set i = i + 1
      endloop
      return newForce
    endmethod

    method IsFactionInvited takes Faction whichFaction returns boolean
      return this.invitees.contains(whichFaction)
    endmethod

    method ContainsPlayer takes player whichPlayer returns boolean
      local integer i = 0
      loop
      exitwhen i == factions.size
        if Faction(this.factions[i]).Player == whichPlayer then
          return true
        endif
        set i = i + 1
      endloop
      return false
    endmethod

    method ContainsFaction takes Faction faction returns boolean
      return this.factions.contains(faction)
    endmethod

    static method operator Count takes nothing returns integer
      return thistype.teamCount
    endmethod

    static method ByName takes string name returns thistype
      return thistype.teamsByName[name]
    endmethod

    static method ByIndex takes integer index returns thistype
      return thistype.teamsByIndex[index]
    endmethod

    static method create takes string name returns Team
      local Team this = Team.allocate()
      
      set this.name = name
      set this.factions = Set.create()
      set this.invitees = Set.create()
      
      if thistype.teamsByName[StringCase(name, false)] == 0 then
        set thistype.teamsByName[StringCase(name, false)] = this
      else
        call BJDebugMsg("Error: created team that already exists with name " + name)
        return 0
      endif     

      set thistype.teamsByIndex[teamCount] = this
      set thistype.teamCount = thistype.teamCount + 1

      set thistype.triggerTeam = this
      call OnTeamCreate.fire()
      
      return this                
    endmethod
      
    private static method onInit takes nothing returns nothing
      set thistype.teamsByName = StringTable.create()
    endmethod     
  endstruct        
    
  function GetTriggerTeam takes nothing returns Team
    return Team.triggerTeam
  endfunction

  private function OnInit takes nothing returns nothing
    set OnTeamCreate = Event.create()
    set OnTeamSizeChange = Event.create()
    set OnTeamWeightChange = Event.create()
    set TeamScoreStatusChanged = Event.create()
  endfunction

endlibrary