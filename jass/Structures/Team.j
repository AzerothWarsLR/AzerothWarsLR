library Team initializer OnInit requires Table, Event, Persons
  globals
    private integer ALLY_LEFT_GAME_UPG = 'R04I'
    private integer DEFAULT_MAX_WEIGHT = 6  //All Teams have this much maximum weight

    Event OnTeamCreate = 0
    Event OnTeamSizeChange = 0
  endglobals

  struct Team     
    static StringTable teamsByName
    readonly static Table teamsByIndex
    readonly static integer teamCount = 0
    private static player enumPlayer
    readonly static thistype triggerTeam = 0
    
    readonly string name = null
    readonly string icon = null
    readonly force players = null
    readonly force invitees = null                    //Players that have been invited to join this Team
    readonly player array playerArray[MAX_PLAYERS]    //Just a different way of storing "players". Indexed by player number
    readonly integer size = 0
    readonly Faction array factions[10]       //These are the Factions that can join this team using a TeamButton
    readonly integer factionCount = 0
    readonly integer weight //The combined weight of all Factions in this Team
    readonly integer maxWeight //When the Faction has more weight than this, it begins to incur penalties

    //For allying everybody in a team when a player leaves, called by addPlayer
    private static method enumAlly takes nothing returns nothing
      call SetPlayerAllianceStateBJ( thistype.enumPlayer, GetEnumPlayer(), bj_ALLIANCE_ALLIED_VISION )
      call SetPlayerAllianceStateBJ( GetEnumPlayer(), thistype.enumPlayer, bj_ALLIANCE_ALLIED_VISION )    
    endmethod
    
    //For unallying everybody in a team when a player leaves, called by removePlayer
    private static method enumUnally takes nothing returns nothing
      call SetPlayerAllianceStateBJ( thistype.enumPlayer, GetEnumPlayer(), bj_ALLIANCE_UNALLIED )
      call SetPlayerAllianceStateBJ( GetEnumPlayer(), thistype.enumPlayer, bj_ALLIANCE_UNALLIED )            
    endmethod

    method addFaction takes Faction faction returns nothing
      set this.factions[factionCount] = faction
      set this.factionCount = this.factionCount + 1
    endmethod

    method getFactionBySlot takes integer slot returns Faction
      return this.factions[slot]
    endmethod

    method getFactionCount takes nothing returns integer
      return this.factionCount
    endmethod

    method getPersonById takes integer id returns Person
      if this.playerArray[id] != null then
        return Persons[GetPlayerId(this.playerArray[id])]
      else
        return 0
      endif
    endmethod
    
    method getPlayerById takes integer id returns player
      return this.playerArray[id]
    endmethod
    
    method refreshUpgrades takes nothing returns nothing
      local integer i = 0
      
      loop
      exitwhen i > MAX_PLAYERS   
        if this.containsPlayer(Player(i)) != null then
          if this.weight < this.maxWeight or this.size == 1 then
            call SetPlayerTechResearched(this.playerArray[i], ALLY_LEFT_GAME_UPG, 1)   
          else
            call SetPlayerTechResearched(this.playerArray[i], ALLY_LEFT_GAME_UPG, 0)    
          endif
        endif
        set i = i + 1
      endloop
    endmethod

    //Revokes an invite sent to a player
    method uninvite takes player whichPlayer returns nothing
      local Person whichPerson = Persons[GetPlayerId(whichPlayer)]
      if not IsPlayerInForce(whichPlayer, this.invitees) then
        call DisplayTextToForce(this.players, whichPerson.faction.prefixCol + whichPerson.faction.name + "|r is no longer invited to join the " + this.name + ".")
        call DisplayTextToPlayer(whichPerson.p, 0, 0, "You are no longer invited to join the " + this.name + ".")
        call ForceRemovePlayer(this.invitees, whichPlayer)
      endif
    endmethod

    //Sends an invite to this team to a player, which they can choose to accept at a later date
    method invite takes player whichPlayer returns nothing
      local Person whichPerson = Persons[GetPlayerId(whichPlayer)]
      if IsPlayerInForce(whichPlayer, this.invitees) == false and IsPlayerInForce(whichPlayer, this.players) == false then
        call DisplayTextToForce(this.players, whichPerson.faction.prefixCol + whichPerson.faction.name + "|r has been invited to join the " + this.name + ".")
        call DisplayTextToPlayer(whichPerson.p, 0, 0, "You have been invited to join the " + this.name + ". Type -join " + this.name + " to accept.")
        call ForceAddPlayer(this.invitees, whichPlayer)
      endif
    endmethod

    method addPlayer takes player p returns nothing
      local Person whichPerson = Persons[GetPlayerId(p)]
      set thistype.enumPlayer = p
      call ForForce(this.players, function thistype.enumAlly)    
      call ForceAddPlayer(this.players, p)
      set this.playerArray[GetPlayerId(p)] = p
      set this.size = this.size+1
      call this.refreshUpgrades()
      call ForceRemovePlayer(this.invitees, p)
      set this.weight = this.weight + whichPerson.faction.weight

      set triggerTeam = this
      call OnTeamSizeChange.fire()
    endmethod
    
    method removePlayer takes player p returns nothing
      local Person whichPerson = Persons[GetPlayerId(p)]
      set thistype.enumPlayer = p
      call ForForce(this.players, function thistype.enumUnally)        
      call ForceRemovePlayer(this.players, p)
      set this.playerArray[GetPlayerId(p)] = null
      set this.size = this.size-1
      call SetPlayerTechResearched(p, ALLY_LEFT_GAME_UPG, 1)      //If the player is not in a team they cerainly have no allies
      call this.refreshUpgrades()
      set this.weight = this.weight - whichPerson.faction.weight

      set triggerTeam = this
      call OnTeamSizeChange.fire()
    endmethod
    
    method containsPlayer takes player p returns boolean
      return IsPlayerInForce(p, this.players)
    endmethod        
    
    method getIcon takes nothing returns string
      return this.icon
    endmethod
    
    method getName takes nothing returns string
      return this.name
    endmethod

    method containsFaction takes Faction f returns boolean
      local integer i = 0
      loop 
      exitwhen i == this.factionCount
        if this.factions[i] == f then
          return true
        endif
      set i = i + 1
      endloop
      return false
    endmethod

    //When a Person inside this Team has their Faction changed, the Team's weight needs to be changed to accomodate
    private static method onPersonFactionChanged takes nothing returns nothing
      local Person triggerPerson = GetTriggerPerson()
      local Faction prevFaction = GetChangingPersonPrevFaction()
      set triggerPerson.team.weight = triggerPerson.team.weight - prevFaction.weight
      set triggerPerson.team.weight = triggerPerson.team.weight + triggerPerson.faction.weight
    endmethod

    static method create takes string name, string icon returns Team
      local Team this = Team.allocate()
      
      set this.name = name
      set this.icon = icon
      set this.weight = 0
      set this.maxWeight = DEFAULT_MAX_WEIGHT
      set this.players = CreateForce()
      
      if thistype.teamsByName[name] == 0 then
        set thistype.teamsByName[name] = this
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
      local trigger trig
      set thistype.teamsByName = StringTable.create()
      set thistype.teamsByIndex = Table.create()

      set trig = CreateTrigger()
      call OnPersonFactionChange.register(trig)
      call TriggerAddAction(trig, function Team.onPersonFactionChanged)
    endmethod     
  endstruct        
    
  function GetTriggerTeam takes nothing returns Team
    return Team.triggerTeam
  endfunction

  private function OnInit takes nothing returns nothing
    set OnTeamCreate = Event.create()
    set OnTeamSizeChange = Event.create()
  endfunction

endlibrary