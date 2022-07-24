library LiegeFaction requires Faction, Set

  globals
    private constant integer ATTACK_UPGRADE = 'Rhme'
    private constant integer ARMOR_UPGRADE = 'Rhar'
  endglobals

  struct LiegeFaction extends Faction
    private Set mercs

    private method OnSetObjectLevel takes integer object, integer level returns nothing
      call CopyObjectLevelToMercenaries(object, level)
    endmethod

    //Apply object level changes to mercs too
    private method CopyObjectLevelToMercenaries takes integer object, integer level returns nothing
      local integer i = 0
      local Faction mercFaction
      if not (object == ATTACK_UPGRADE or object == ARMOR_UPGRADE) then //Probably shouldn't be hardcoded like this
        return
      endif
      loop
        exitwhen i == mercs.size
        if mercs[i] != 0 then
          set mercFaction = mercs[i]
          call mercFaction.ModObjectLimit(object, level - mercFaction.objectLimits[object]) //Should be using Faction.SetObjectLimit, ideally
          call mercFaction.SetObjectLevel(object, level)
        endif
        set i = i + 1
      endloop
    endmethod

    private method OnTeamChange takes nothing returns nothing
      local integer i = 0
      //Change team of mercs too
      loop
        exitwhen i == mercs.size
        set MercFaction(mercs[i]).Team = this.Team
        set i = i + 1
      endloop
    endmethod

    //Make mercs leave too
    private method OnPreLeave takes nothing returns nothing
      local integer i = 0
      loop
        exitwhen i == mercs.size
        if mercs[i] != 0 then
          call MercFaction(mercs[i]).Leave()
          set MercFaction(mercs[i]).Person.Faction = 0
        endif
        set i = i + 1
      endloop
    endmethod

    method AddMerc takes MercFaction mercToAdd returns nothing
      if (mercs.contains(mercToAdd)) then
        call BJDebugMsg("Attempted to add merc " + mercToAdd.Name + " to liege " + this.name + " but it is already present")
        return
      endif
      if mercToAdd.Liege != this and mercToAdd.Liege != 0 then
        call BJDebugMsg("Attempted to add merc " + mercToAdd.Name + " to liege " + this.name + " but it already has the liege " + mercToAdd.Liege.Name)
        return
      endif
      call CopyObjectLevelToMercenaries(ARMOR_UPGRADE, GetObjectLevel(ARMOR_UPGRADE))
      call CopyObjectLevelToMercenaries(ARMOR_UPGRADE, GetObjectLevel(ARMOR_UPGRADE))
      call mercs.add(mercToAdd)
    endmethod

    method RemoveMerc takes MercFaction mercToRemove returns nothing
        call this.mercs.remove(mercToRemove)
    endmethod


    static method create takes string name, playercolor playCol, string prefixCol, string icon returns thistype
      local thistype this = thistype.allocate(name, playCol, prefixCol, icon)
      set this.mercs = Set.create(name +  "s mercenaries")
      return this
    endmethod
  endstruct

endlibrary