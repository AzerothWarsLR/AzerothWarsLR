library Persons initializer OnInit requires Math, GeneralHelpers, Event, Filters

  globals   
    force Observers

    Event OnPersonFactionChange
  endglobals

  struct Person
    private static thistype array byId
    readonly static thistype triggerPerson = 0         //Used in event response triggers
    readonly static Faction prevFaction = 0            //Used in OnPersonFactionChange event response for the previous faction 

    private Faction faction                  //Controls name, available objects, color, and icon
    private integer controlPointCount = 0
    private real controlPointValue = 0        //Gold per minute           
    private player p                         //The player this struct is indexed to  
     
    private real partialGold = 0              //Just used for income calculations
    readonly group cpGroup                    //Group of control point units this person owns  

    method operator Player takes nothing returns player
      return this.p
    endmethod

    method operator Faction takes nothing returns Faction
      return this.faction
    endmethod

    method operator Faction= takes Faction newFaction returns nothing
      local integer i = 0
      local Faction prevFaction

      set this.prevFaction = this.faction
      set thistype.prevFaction = this.faction

      //Unapply old faction if necessary
      if this.faction != 0 then
        if this.faction == 0 then
          call BJDebugMsg("ERROR: attempted to null Faction of Person " + GetPlayerName(this.p) + " but they have no Faction")
          return
        endif
        //Unapply object limits
        loop 
        exitwhen i > faction.objectCount
          call this.ModObjectLimit(this.faction.objectList[i], -this.faction.objectLimits[this.faction.objectList[i]])
          set i = i + 1
        endloop       
        //Toggle absence and presence researches for this faction
        set i = 0
        loop
        exitwhen i > MAX_PLAYERS
          call SetPlayerTechResearched(Player(i), this.faction.absenceResearch, 1)
          call SetPlayerTechResearched(Player(i), this.faction.presenceResearch, 0)
          set i = i + 1
        endloop
        set this.faction = 0 
        if this.prevFaction != 0 then
          set this.prevFaction.Person = 0 //Referential integrity
        endif
      endif

      //Apply new faction if necessary
      if newFaction != 0 then
        if newFaction.Person == 0 then
          set i = 0
          //Apply object limits
          loop
          exitwhen i > newFaction.objectCount
            call this.ModObjectLimit(newFaction.objectList[i], newFaction.objectLimits[newFaction.objectList[i]])
            set i = i + 1
          endloop             
          call SetPlayerColorBJ(this.p, newFaction.playCol, true)
          set this.faction = newFaction 
          //Enforce referential integrity
          if newFaction.Person != this then
            set newFaction.Person = this 
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
          
        else
          call BJDebugMsg("Error: attempted to set Person " + GetPlayerName(this.p) + " to already occupied faction with name " + newFaction.name)
          call BJDebugMsg(I2S(newFaction.Person))
        endif
      endif
      set thistype.triggerPerson = this
      call OnPersonFactionChange.fire()
    endmethod

    method operator ControlPointValue takes nothing returns real
      return this.controlPointValue
    endmethod

    method operator ControlPointValue= takes real value returns nothing
      if (value < 0) then
        call BJDebugMsg("ERROR: Tried to assign a negative ControlPointValue value to " + GetPlayerName(this.p))
      endif
      set this.controlPointValue = value
    endmethod

    method operator ControlPointCount takes nothing returns integer
      return this.controlPointCount
    endmethod

    method operator ControlPointCount= takes integer value returns nothing
      if (value < 0) then
        call BJDebugMsg("ERROR: Tried to assign a negative ControlPoint counter to " + GetPlayerName(this.p))
      endif
      set this.controlPointCount = value
    endmethod

    method GetObjectLimit takes integer id returns integer
      local integer blizzardLimit = GetPlayerTechMaxAllowed(this.Player, id)
      if blizzardLimit == -1 then
        return UNLIMITED
      endif
      return blizzardLimit
    endmethod

    method SetObjectLimit takes integer id, integer limit returns nothing
      if limit >= UNLIMITED then
        call SetPlayerTechMaxAllowed(this.Player, id, -1)
      elseif limit < 0 then
        call SetPlayerTechMaxAllowed(this.Player, id, 0)
      else
        call SetPlayerTechMaxAllowed(this.Player, id, limit)
      endif
    endmethod

    method ModObjectLimit takes integer id, integer limit returns nothing
      call SetObjectLimit(id, GetObjectLimit(id) + limit)     
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

    private method nullFaction takes nothing returns nothing
      
    endmethod

    method destroy takes nothing returns nothing
      call DestroyGroup(this.cpGroup)

      set thistype.byId[GetPlayerId(this.p)] = 0
      set this.p = null
      set this.cpGroup = null 

      call this.deallocate()
    endmethod

    static method ById takes integer id returns thistype
      return thistype.byId[id]
    endmethod

    static method ByHandle takes player whichPlayer returns thistype
      return thistype.byId[GetPlayerId(whichPlayer)]
    endmethod

    static method create takes player p returns Person
      local Person this = Person.allocate()
      
      set this.p = p
      set this.cpGroup = CreateGroup()
      set thistype.byId[GetPlayerId(p)] = this
      
      return this           
    endmethod

  endstruct

  function GetChangingPersonPrevFaction takes nothing returns Faction
    return Person.prevFaction
  endfunction

  function GetTriggerPerson takes nothing returns Person
    if Person.triggerPerson == 0 then
      call BJDebugMsg("ERROR: GetTriggerPerson() returning 0")
      return 0
    endif
    return Person.triggerPerson
  endfunction

  private function OnInit takes nothing returns nothing
    set Observers = CreateForce()
    set OnPersonFactionChange = Event.create()
  endfunction

endlibrary