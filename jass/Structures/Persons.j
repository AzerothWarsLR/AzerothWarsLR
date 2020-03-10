library Persons initializer OnInit requires Math, GeneralHelpers, Event, Filters, QuestData

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

    readonly Faction faction                  //Controls name, available objects, color, and icon
    readonly Team team                        //The team this person is on
    readonly integer controlPoints = 0        //Count of control points
    readonly real income = 0                  //Gold per minute 
    readonly Table objectLimits               //A limit of how many objects of each type this person can build. Indexed by ID, value is limit               
    readonly player p                         //The player this struct is indexed to  
    readonly integer xp = 0                   //Stored by DistributeUnits and given out again by DistributeResources
     
    private real partialGold = 0              //Just used for income calculations
    readonly group cpGroup                    //Group of control point units this person owns  

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
    
    method modControlPoints takes integer mod returns nothing
      set this.controlPoints = this.controlPoints + mod
    endmethod
    
    method modIncome takes real mod returns nothing
      set this.income = this.income + mod
    endmethod    
    
    method setTeam takes Team team returns nothing
      if this.team > 0 then
        set thistype.triggerPerson = this
        call this.team.removePlayer(this.p)
        set this.triggerPersonPrevTeam = this.team
        set this.team = 0
        call OnPersonTeamLeave.fire()
      endif  

      if team > 0 then
        call team.addPlayer(this.p) 
        set this.team = team
        set thistype.triggerPerson = this
        call OnPersonTeamJoin.fire()
      endif
    endmethod

    private method nullFaction takes nothing returns nothing
      local integer i = 0
      local QuestData tempQuestData

      if this.faction == 0 then
        call BJDebugMsg("ERROR: attempted to null Faction of Person " + GetPlayerName(this.p) + " but they have no Faction")
        return
      endif

      //Unapply object limits
      loop 
      exitwhen i > faction.objectCount
        call this.modObjectLimit( this.faction.objectList[i], -this.faction.objectLimits[this.faction.objectList[i]] )
        set i = i + 1
      endloop       

      set PersonsByFaction[this.faction] = 0 //Free up existing faction slot
      call this.team.modWeight(-this.faction.weight) //Remove faction's weight from team

      //Toggle absence and presence researches for this faction
      set i = 0
      loop
      exitwhen i > MAX_PLAYERS
        call SetPlayerTechResearched(Player(i), this.faction.absenceResearch, 1)
        call SetPlayerTechResearched(Player(i), this.faction.presenceResearch, 0)
        set i = i + 1
      endloop

      //Hide completed and uncompleted quests for this faction
      if GetLocalPlayer() == p then   
        set i = 0
        loop
          exitwhen i == faction.quests.size
          set tempQuestData = faction.quests[i]
          set tempQuestData.Enabled = false
          set i = i + 1
        endloop
      endif

      //Run the exit trigger
      call this.faction.executeExitTrigger()
      set this.faction = 0 
    endmethod

    method setFaction takes Faction newFaction returns nothing
      local integer i = 0
      local QuestData tempQuestData
      local QuestItemData tempQuestItemData

      set thistype.prevFaction = this.faction

      if this.faction > 0 then
        call this.nullFaction() 
      endif

      if newFaction > 0 then
        if PersonsByFaction[newFaction] == 0 then
          set i = 0
          //Apply object limits
          loop
          exitwhen i > newFaction.objectCount
            call this.modObjectLimit( newFaction.objectList[i], newFaction.objectLimits[newFaction.objectList[i]] )
            set i = i + 1
          endloop             
          call SetPlayerColorBJ(this.p, newFaction.playCol, true)
          set PersonsByFaction[newFaction] = this   
          set this.faction = newFaction 
          //Add new faction's weight to current team
          if this.team > 0 then
            call this.team.modWeight(newFaction.weight)
          endif
          //Toggle absence and presence researches for this faction
          set i = 0
          loop
          exitwhen i > MAX_PLAYERS
            if this.faction.absenceResearch != 0 then
              call SetPlayerTechResearched(Player(i), this.faction.absenceResearch, 0)
            endif
            if this.faction.presenceResearch != 0 then
              call SetPlayerTechResearched(Player(i), this.faction.presenceResearch, 1)
            endif
            set i = i + 1
          endloop 
          call this.faction.executeEnterTrigger()                    
        else
          call BJDebugMsg("Error: attempted to set Person " + GetPlayerName(this.p) + " to already occupied faction with name " + newFaction.name)
        endif
      endif

      //Show completed and uncompleted quests for this faction
      if GetLocalPlayer() == p then   
        set i = 0
        loop
          exitwhen i == faction.quests.size
          set tempQuestData = faction.quests[i]
          set tempQuestData.Enabled = true
          set i = i + 1
        endloop

        set i = 0
        loop
          exitwhen i == faction.completedQuestItems.size
          set tempQuestItemData = faction.completedQuestItems[i]
          set tempQuestItemData.Completed = true
          set i = i + 1
        endloop
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
        if not tempUnitType.meta then
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
      if team.size > 1 then
        call distributeUnits()
        call distributeResources()
        call distributeExperience()
      else
        call obliterate()
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
      set Persons[GetPlayerId(p)] = this
      
      return this           
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
