library Team initializer OnInit requires Table, Event
  globals
    private integer ALLY_LEFT_GAME_UPG = 'R04I'

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
    readonly player array playerArray[MAX_PLAYERS]    //Just a different way of storing "players". Indexed by player number
    readonly integer maxSize = 0
    readonly integer size = 0
    readonly Faction array factions[10]       //These are the Factions that can join this team using a TeamButton
    readonly integer factionCount = 0

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
          if this.size < this.maxSize or this.maxSize == 1 then
            call SetPlayerTechResearched(this.playerArray[i], ALLY_LEFT_GAME_UPG, 1)   
          else
            call SetPlayerTechResearched(this.playerArray[i], ALLY_LEFT_GAME_UPG, 0)    
          endif
        endif
        set i = i + 1
      endloop
    endmethod

    method addPlayer takes player p returns nothing
      set thistype.enumPlayer = p
      call ForForce(this.players, function thistype.enumAlly)    
      call ForceAddPlayer(this.players, p)
      set this.playerArray[GetPlayerId(p)] = p
      set this.size = this.size+1
      call this.refreshUpgrades()
      
      if this.size < 0 then
        call BJDebugMsg("ERROR: Team " + this.name + " increased to size " + I2S(this.size))
      endif
      set triggerTeam = this
      call OnTeamSizeChange.fire()
    endmethod
    
    method removePlayer takes player p returns nothing
      set thistype.enumPlayer = p
      call ForForce(this.players, function thistype.enumUnally)        
      call ForceRemovePlayer(this.players, p)
      set this.playerArray[GetPlayerId(p)] = null
      set this.size = this.size-1
      call SetPlayerTechResearched(p, ALLY_LEFT_GAME_UPG, 1)      //If the player is not in a team they cerainly have no allies
      call this.refreshUpgrades()
      
      if this.size < 0 then
        call BJDebugMsg("ERROR: Team " + this.name + " reduced to size " + I2S(this.size))
      endif
      set triggerTeam = this
      call OnTeamSizeChange.fire()
    endmethod
    
    method containsPlayer takes player p returns boolean
      return IsPlayerInForce(p, this.players)
    endmethod        
    
    method setMaxSize takes integer i returns nothing
      set this.maxSize = i
      call this.refreshUpgrades()
    endmethod
    
    method getIcon takes nothing returns string
      return this.icon
    endmethod
    
    method getName takes nothing returns string
      return this.name
    endmethod
    
    method getMaxSize takes nothing returns integer
      return this.maxSize
    endmethod
    
    method getSize takes nothing returns integer
      return this.size
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
      
    static method create takes string name, string icon, integer maxSize returns Team
      local Team this = Team.allocate()
      
      set this.name = name
      set this.icon = icon
      set this.maxSize = maxSize
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
      set thistype.teamsByName = StringTable.create()
      set thistype.teamsByIndex = Table.create()
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