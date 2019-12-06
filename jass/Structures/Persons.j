library Persons initializer OnInit requires Math, GeneralHelpers, Event, Filters
  
  globals   
    Person array Persons    //Indexed by player ID number
    StringTable PersonsByName
    Table PersonsByFaction
    
    force Observers
    
    constant integer UNLIMITED = 200    //This is used in Persons, Faction and FactionMod for effectively unlimited unit production
    constant integer HERO_COST = 100    //For refunding

    private constant real REFUND_PERCENT = 0.75          //How much gold and lumber is refunded from units that get refunded on leav
    private constant real XP_TRANSFER_PERCENT = 0.75     //How much experience is transferred from heroes that leave the game

    Event OnPersonFactionChange
    Event OnPersonTeamLeave
    Event OnPersonTeamJoin
  endglobals

  struct Person
    readonly static thistype triggerPerson = 0         //Used in event response triggers
    readonly static Team triggerPersonPrevTeam = 0
    readonly static Faction prevFaction = 0            //Used in OnPersonFactionChange event response for the previous faction 
    //readonly static group allCapitals = null

    readonly string name = null
    readonly Faction faction                  //Controls name, available objects, color, and icon
    readonly FactionMod array factionMods[15] //A list of FactionMods, which contribute to the list of available objects for this player
    readonly Team team                        //The team this person is on
    readonly integer controlPoints = 0        //Count of control points
    readonly real income = 0                  //Gold per minute 
    readonly Table objectLimits               //A limit of how many objects of each type this person can build. Indexed by ID, value is limit               
    readonly player p                         //The player this struct is indexed to  
    readonly integer xp = 0                   //Stored by DistributeUnits and given out again by DistributeResources
     
    private real partialGold = 0              //Just used for income calculations
    private group cpGroup                     //Group of control points this person owns  
    private integer factionModCount = 0       //   

    method getObjectLimit takes integer i returns integer
      return this.objectLimits[i]
    endmethod

    method modObjectLimit takes integer id, integer limit returns nothing
      if this.objectLimits.exists(id) then
        set this.objectLimits[id] = this.objectLimits[id] + limit
      else
        set this.objectLimits[id] = limit                
      endif
      
      if this.objectLimits[id] < 0 then
        call SetPlayerTechMaxAllowed(this.p, id, 0) 
      else
        if this.objectLimits[id] >= UNLIMITED then
          call SetPlayerTechMaxAllowed(this.p, id, -1) 
        else
          call SetPlayerTechMaxAllowed(this.p, id, this.objectLimits[id]) 
        endif
      endif
      
      if this.objectLimits[id] == 0 then
        call this.objectLimits.flush(id)
      endif        
    endmethod
    
    method addGold takes real x returns nothing
      local real fullGold = floor(x)
      local real remainderGold = x - fullGold
      
      call SetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD) + R2I(fullGold))
      set this.partialGold = this.partialGold + remainderGold
      
      loop
      exitwhen this.partialGold < 1
        set this.partialGold = this.partialGold - 1
        call SetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD) + 1)
      endloop
    endmethod

    method getPlayerId takes nothing returns integer
      return GetPlayerId(this.p)
    endmethod

    method getPlayer takes nothing returns player
      return this.p
    endmethod
    
    method getcpGroup takes nothing returns group
      return this.cpGroup
    endmethod
    
    method modControlPoints takes integer mod returns nothing
      set this.controlPoints = this.controlPoints + mod
    endmethod
    
    method getControlPoints takes nothing returns integer
      return this.controlPoints
    endmethod
    
    method modIncome takes real mod returns nothing
      set this.income = this.income + mod
    endmethod
    
    method getIncome takes nothing returns real
      return this.income
    endmethod
    
    method getName takes nothing returns string
      return this.name
    endmethod

    method setName takes string s returns nothing
      if PersonsByName[s] == null then
        set PersonsByName[this.name] = 0     //Free up the existing name
        set PersonsByName[s] = this
        call SetPlayerName(this.p, s)
      else
        call DisplayTextToPlayer(this.p, 0, 0, "There is already a Person with name: " + s)
      endif         
    endmethod        
    
    method getTeam takes nothing returns Team
      return this.team
    endmethod
    
    method setTeam takes Team team returns nothing
      if this.team != 0 then
        set thistype.triggerPerson = this
        call this.team.removePlayer(this.p)
        set this.triggerPersonPrevTeam = this.team
        set this.team = 0
        call OnPersonTeamLeave.fire()
      endif  

      call team.addPlayer(this.p) 
      set this.team = team
      set thistype.triggerPerson = this
      call OnPersonTeamJoin.fire()
    endmethod
    
    method clearFactionMods takes nothing returns nothing
      local FactionMod mod = 0
      local integer i = 0
      local integer j = 0
      
      loop
      exitwhen i == this.factionModCount
        set mod = this.factionMods[i]
        call mod.removePlayer(this.p)
        set j = 0
        loop
        exitwhen j == mod.getObjectCount()
          call this.modObjectLimit( mod.getObjectList(j), -mod.getObjectLimit(mod.getObjectList(j)) )
          set j = j + 1
        endloop
        set this.factionMods[i] = 0
        set i = i + 1
      endloop
      set this.factionModCount = 0
    endmethod

    method applyFactionMod takes integer id returns nothing
      //Note that it is currently not possible to remove a specific FactionMod from a player; this should be rectified
      local FactionMod mod = FactionMod.getFactionModById(id)
      local integer i = 0
      
      if mod == 0 then
        call BJDebugMsg("ERORR: attempted to apply nonexistant FactionMod " + I2S(id) + " to player " + I2S(GetPlayerId(this.p)))
        return
      endif

      if not mod.containsPlayer(this.p) then  //The provided FactionMod is not already affecting this player
        loop
        exitwhen i > mod.getObjectCount()
          call this.modObjectLimit( mod.getObjectList(i), mod.getObjectLimit(mod.getObjectList(i)) )
          set i = i + 1
        endloop
        set this.factionMods[this.factionModCount] = mod
        set this.factionModCount = this.factionModCount + 1
        call mod.addPlayer(this.p)
      endif
    endmethod

    method getFaction takes nothing returns Faction
      return this.faction
    endmethod

    private method nullFaction takes nothing returns nothing
      local integer i = 0
      if this.faction != 0 then       //Unapply existing faction first
        loop //Unapply object limits
        exitwhen i > faction.getObjectCount()
          call this.modObjectLimit( this.faction.getObjectList(i), -this.faction.getObjectLimit(this.faction.getObjectList(i)) )
          set i = i + 1
        endloop                       
        set PersonsByFaction[this.faction] = 0     //Free up existing faction slot
        //Toggle absence and presence researches for this faction
        set i = 0
        loop
        exitwhen i > MAX_PLAYERS
          call SetPlayerTechResearched(Player(i), this.faction.getAbsenceResearch(), 1)
          call SetPlayerTechResearched(Player(i), this.faction.getPresenceResearch(), 0)
          set i = i + 1
        endloop
        //Run the exit trigger
        call this.faction.executeExitTrigger()
        set this.faction = 0 
        call this.clearFactionMods()    //Assuming that there are no faction mods that carry across faction change
      endif        
    endmethod

    method setFaction takes Faction newFaction returns nothing
      local integer i = 0

      set thistype.prevFaction = this.faction

      if this.faction != 0 then
        call this.nullFaction() 
      endif

      if newFaction != 0 then
        if PersonsByFaction[newFaction] == 0 then
          set i = 0
          loop //Apply object limits
          exitwhen i > newFaction.getObjectCount()
            call this.modObjectLimit( newFaction.getObjectList(i), newFaction.getObjectLimit(newFaction.getObjectList(i)) )
            set i = i + 1
          endloop             
          call SetPlayerColorBJ(this.p, newFaction.getPlayCol(), true)
          set PersonsByFaction[newFaction] = this   
          set this.faction = newFaction 
          //Toggle absence and presence researches for this faction
          set i = 0
          loop
          exitwhen i > MAX_PLAYERS
            if this.faction.getAbsenceResearch() != 0 then
              call SetPlayerTechResearched(Player(i), this.faction.getAbsenceResearch(), 0)
            endif
            if this.faction.getPresenceResearch() != 0 then
              call SetPlayerTechResearched(Player(i), this.faction.getPresenceResearch(), 1)
            endif
            set i = i + 1
          endloop 
          call this.faction.executeEnterTrigger()                    
        else
          call BJDebugMsg("Error: attempted to set Person " + this.name + " to already occupied faction with name " + newFaction.name)
        endif
      endif
      
      set thistype.triggerPerson = this
      call OnPersonFactionChange.fire()
    endmethod

    //Any time the player loses the game. E.g. Frozen Throne loss, Kil'jaeden loss
    method obliterate takes nothing returns nothing
      local group tempGroup = CreateGroup()
      local unit u = null
      local UnitType tempUnitType = 0

      //Take away resources
      call SetPlayerState(this.p, PLAYER_STATE_RESOURCE_GOLD, 0)
      call SetPlayerState(this.p, PLAYER_STATE_RESOURCE_LUMBER, 0)

      //Give all units to Neutral Victim
      call GroupEnumUnitsOfPlayer(tempGroup, this.p, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null 
        set tempUnitType = UnitTypes[GetUnitTypeId(u)]               
        if not tempUnitType.getMeta() then
          call SetUnitOwner(u, Player(bj_PLAYER_NEUTRAL_VICTIM), false)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop

      //Cleanup
      call DestroyGroup(tempGroup)
      set tempGroup = null
    endmethod

    private method distributeExperience takes nothing returns nothing
      local integer i = 0
      local group tempGroup = CreateGroup()
      local unit u = null
      local integer heroCount = 0

      loop
      exitwhen i == MAX_PLAYERS
        if this.p != this.team.playerArray[i] and this.team.playerArray[i] != null then
          //Identify all heroes for a given ally
          call GroupEnumUnitsOfPlayer(tempGroup, this.team.playerArray[i], function IsUnitHeroEnum)
          set heroCount = BlzGroupGetSize(tempGroup)
          loop
            set u = FirstOfGroup(tempGroup)
            exitwhen u == null
            call AddHeroXP(u, R2I((this.xp / (this.team.size-1) / heroCount) * XP_TRANSFER_PERCENT), true)
            call GroupRemoveUnit(tempGroup, u)
          endloop
        endif
        set i = i + 1
      endloop

      //Cleanup
      call DestroyGroup(tempGroup)
      set tempGroup = null
    endmethod

    private method distributeResources takes nothing returns nothing
      local integer i = 0
      local integer gold = GetPlayerState(this.p,PLAYER_STATE_RESOURCE_GOLD)
      local integer lumber = GetPlayerState(this.p,PLAYER_STATE_RESOURCE_LUMBER)
      local force eligiblePlayers = CreateForce()

      call ForceAddForce(this.team.players, eligiblePlayers)
      call ForceRemovePlayer(eligiblePlayers, this.p)

      loop
      exitwhen i == MAX_PLAYERS
        if this.team.playerArray[i] != null then
          call SetPlayerState(this.team.playerArray[i], PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(this.team.playerArray[i], PLAYER_STATE_RESOURCE_GOLD) + gold/(this.team.size-1))
          call SetPlayerState(this.team.playerArray[i], PLAYER_STATE_RESOURCE_LUMBER, GetPlayerState(this.team.playerArray[i], PLAYER_STATE_RESOURCE_LUMBER) + lumber/(this.team.size-1))
        endif
        set i = i + 1
      endloop
      
      call SetPlayerState(this.p, PLAYER_STATE_RESOURCE_GOLD, 0)
      call SetPlayerState(this.p, PLAYER_STATE_RESOURCE_LUMBER, 0)

      //Cleanup
      call DestroyForce(eligiblePlayers)
      set eligiblePlayers = null
    endmethod

    private method distributeUnits takes nothing returns nothing
      local group g = CreateGroup()
      local unit u = null
      local UnitType tempUnitType = 0
      local force eligiblePlayers = CreateForce()
      local player recipient = null

      call ForceAddForce(this.team.players, eligiblePlayers)
      call ForceRemovePlayer(eligiblePlayers, this.p)
      call GroupEnumUnitsOfPlayer(g, this.p, null)

      loop
        set u = FirstOfGroup(g) 
        exitwhen u == null
        set tempUnitType = UnitTypes[GetUnitTypeId(u)]
        if IsUnitType(u, UNIT_TYPE_HERO) == true then
          call SetPlayerState(this.p, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(this.p, PLAYER_STATE_RESOURCE_GOLD) + HERO_COST)
          set this.xp = this.xp + GetHeroXP(u)
          call UnitDropAllItems(u)  
          call RemoveUnit(u)
        elseif tempUnitType.refund == true then
          call SetPlayerState(this.p, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(this.p, PLAYER_STATE_RESOURCE_GOLD) +  R2I(tempUnitType.goldCost*REFUND_PERCENT))
          call SetPlayerState(this.p, PLAYER_STATE_RESOURCE_LUMBER, GetPlayerState(this.p, PLAYER_STATE_RESOURCE_LUMBER) + R2I(tempUnitType.lumberCost*REFUND_PERCENT))
          call UnitDropAllItems(u)  
          call RemoveUnit(u)
        elseif tempUnitType.meta == false or tempUnitType == 0 then
          set recipient = ForcePickRandomPlayer(eligiblePlayers)
          if recipient == null then
            set recipient = Player(bj_PLAYER_NEUTRAL_VICTIM)
          endif
          call SetUnitOwner(u, recipient, false)
        endif
        call GroupRemoveUnit(g, u)
      endloop

      //Cleanup
      call DestroyForce(eligiblePlayers)
      set eligiblePlayers = null
      call DestroyGroup(g)
      set g = null
      set recipient = null
    endmethod

    //This should get used any time a player exits the game without being defeated; IE they left, went afk, became an observer, or triggered an event that causes this
    method leave takes nothing returns nothing
      if this.team.size > 1 then
        call this.distributeUnits()
        call this.distributeResources()
        call this.distributeExperience()
      else
        call this.obliterate()
      endif
    endmethod                                   

    method destroy takes nothing returns nothing
      call DestroyGroup(this.cpGroup)
      call this.objectLimits.destroy()

      set Persons[GetPlayerId(this.p)] = 0
      set this.p = null
      set this.cpGroup = null 

      call this.deallocate()
    endmethod

    static method create takes player p returns Person
      local Person this = Person.allocate()
      
      set this.p = p
      set this.cpGroup = CreateGroup()
      set this.objectLimits = Table.create()
      //set this.capitals = CreateGroup()
      //set this.startingCapitals = CreateGroup()
      
      call this.setName(GetPlayerName(p))
      set Persons[GetPlayerId(p)] = this
      
      return this           
    endmethod

    static method onInit takes nothing returns nothing
      //set thistype.allCapitals = CreateGroup()
    endmethod
  endstruct

  function GetChangingPersonPrevFaction takes nothing returns Faction
    return Person.prevFaction
  endfunction

  function GetTriggerPersonPrevTeam takes nothing returns Team
    return Person.triggerPersonPrevTeam
  endfunction

  function GetTriggerPerson takes nothing returns Person
    return Person.triggerPerson
  endfunction

  private function OnInit takes nothing returns nothing
    set PersonsByName = StringTable.create()
    set PersonsByFaction = Table.create()
    set Observers = CreateForce()
    set OnPersonFactionChange = Event.create()
    set OnPersonTeamLeave = Event.create()
    set OnPersonTeamJoin = Event.create()
  endfunction

endlibrary
