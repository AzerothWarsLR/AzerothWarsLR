
library Faction initializer OnInit requires Persons, Event

  globals
    Event OnFactionCreate = 0
  endglobals

  struct Faction
    readonly static StringTable factionsByName
    readonly static thistype triggerFaction = 0
    
    readonly string name = null
    readonly playercolor playCol = null
    readonly string prefixCol = null
    readonly string icon = null
    readonly integer weight //An estimation of this Faction's tech-tree strength. Used to calculate how many Factions can fit in a team before they incur penalties
    
    readonly integer absenceResearch = 0  //This upgrade is researched for all players only if this Faction slot is unoccupied
    readonly integer presenceResearch = 0 //This upgrade is researched for all players only if this Faction slot is occupied

    readonly trigger enterTrigger = null  //Commenced when this faction is added to any player
    readonly trigger exitTrigger = null   //Commenced when this faction is removed from any player
    
    readonly Table objectLimits //This is how many units, researches or structures of a given type this faction can build
    readonly integer array objectList[100] //An index for objectLimits
    readonly integer objectCount = 0

    method modWeight takes integer mod returns nothing
      local Person affectedPerson = 0
      if this.weight + mod < 0 then
        call BJDebugMsg("Attempted to reduce weight of Faction " + this.name + " to " + I2S(this.weight + mod)) 
        return
      endif
      set this.weight = this.weight + mod
      if PersonsByFaction[this] != 0 then
        set affectedPerson = PersonsByFaction[this]
      endif
      call affectedPerson.team.modWeight(mod)
    endmethod

    method modObjectLimit takes integer id, integer limit returns nothing
      local Person affectedPerson = 0

      if this.objectLimits.exists(id) then
        set this.objectLimits[id] = this.objectLimits[id] + limit
      else
        set this.objectLimits[id] = limit         
        set this.objectList[this.objectCount] = id
        set this.objectCount = this.objectCount + 1       
      endif

      //If a Person has this Faction, adjust their techtree as well
      if PersonsByFaction[this] != 0 then
        set affectedPerson = PersonsByFaction[this]
        call affectedPerson.modObjectLimit(id, limit)
      endif

      if this.objectLimits[id] == 0 then
        call this.objectLimits.flush(id)
      endif        
    endmethod

    //Permanently adds all of a FactionMod's objects to this Faction
    method applyFactionMod takes FactionMod whichMod returns nothing
      local integer i = 0
      loop
      exitwhen i > whichMod.objectCount
        call this.modObjectLimit( whichMod.objectList[i], whichMod.objectLimits[whichMod.objectList[i]] )
        set i = i + 1
      endloop
      call this.modWeight(whichMod.weight)
    endmethod

    method setPresenceResearch takes integer research returns nothing
      local integer i = 0
      if this.presenceResearch == 0 then
        set this.presenceResearch = research
        loop
        exitwhen i > MAX_PLAYERS
          call SetPlayerTechResearched(Player(i), this.presenceResearch, 0)
          set i = i + 1
        endloop                
      else
        call BJDebugMsg("ERROR: attempted to set presence research for faction " + this.name + " but one is already set")
      endif
    endmethod

    method setAbsenceResearch takes integer research returns nothing
      local integer i = 0
      if this.absenceResearch == 0 then
        set this.absenceResearch = research
        loop
        exitwhen i > MAX_PLAYERS
          call SetPlayerTechResearched(Player(i), this.absenceResearch, 1)
          set i = i + 1
        endloop
      else
        call BJDebugMsg("ERROR: attempted to set absence research for faction " + this.name + " but one is already set")
      endif
    endmethod

    method setEnterTrigger takes trigger trig returns nothing
      if this.enterTrigger == null then
        set this.enterTrigger = trig
      else
        call BJDebugMsg("Attempted to set enter trigger for faction " + this.name + " but one is already set.")
      endif
    endmethod

    method setExitTrigger takes trigger trig returns nothing
      if this.exitTrigger == null then
        set this.exitTrigger = trig
      else
        call BJDebugMsg("Attempted to set exit trigger for faction " + this.name + " but one is already set.")
      endif
    endmethod

    method executeEnterTrigger takes nothing returns nothing
      if this.enterTrigger != null then
        call TriggerEvaluate(this.enterTrigger)
      endif
    endmethod

    method executeExitTrigger takes nothing returns nothing
      if this.exitTrigger != null then
        call TriggerEvaluate(this.exitTrigger)
      endif
    endmethod                        

    method registerObjectLimit takes integer id, integer limit returns nothing
      if not this.objectLimits.exists(id) then
        set this.objectLimits[id] = limit
        set objectList[objectCount] = id
        set this.objectCount = this.objectCount + 1
      else
        call BJDebugMsg("Error: attempted to register already existing id " + I2S(id) + " to faction " + this.name)
      endif       
    endmethod
    
    static method create takes string name, playercolor playCol, string prefixCol, string icon, integer weight returns Faction
      local Faction this = Faction.allocate()
    
      set this.name = name
      set this.playCol = playCol
      set this.prefixCol = prefixCol
      set this.icon = icon
      set this.weight = weight
      set this.objectLimits = Table.create()
      
      if not factionsByName.exists(StringCase(name,false)) then
        set factionsByName[StringCase(name,false)] = this
      else
        call BJDebugMsg("Error: created faction that already exists with name " + name)
      endif 

      set thistype.triggerFaction = this
      call OnFactionCreate.fire()   
      
      return this                
    endmethod        

    private static method onInit takes nothing returns nothing
      set Faction.factionsByName = StringTable.create()
    endmethod 
  endstruct

  function GetTriggerFaction takes nothing returns Faction
    return Faction.triggerFaction
  endfunction

  private function OnInit takes nothing returns nothing
    set OnFactionCreate = Event.create()
  endfunction

endlibrary
