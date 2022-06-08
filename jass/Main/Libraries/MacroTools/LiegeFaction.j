library LiegeFaction requires Faction, Set

  struct LiegeFaction extends Faction
    private Set mercs
    private force mercBannedPlayers

    //Apply object level changes to mercs too
    private method OnSetObjectLevel takes integer object, integer level returns nothing
      local integer i = 0
      local Faction mercFaction
      if not (object == 'Rhme' or object == 'Rhar') then //Probably shouldn't be hardcoded like this
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

    method AddMerc takes MercFaction merc returns nothing
      if (mercs.contains(merc)) then
        call BJDebugMsg("Attempted to add merc " + merc.Name + " to liege " + this.name + " but it is already present")
        return
      endif
      if merc.Liege != this and merc.Liege != 0 then
        call BJDebugMsg("Attempted to add merc " + merc.Name + " to liege " + this.name + " but it already has the liege " + merc.Liege.Name)
        return
      endif
      call mercs.add(merc)
      if merc.Liege != this then
        set merc.Liege = this
      endif
    endmethod

    method IsPlayerBannedFromBecomingMerc takes player whichPlayer returns boolean
      return IsPlayerInForce(whichPlayer, this.mercBannedPlayers)
    endmethod

    method BanPlayerFromBecomingMerc takes player whichPlayer returns nothing
      call ForceAddPlayer(this.mercBannedPlayers, whichPlayer)
    endmethod

    static method create takes string name, playercolor playCol, string prefixCol, string icon returns thistype
      local thistype this = thistype.allocate(name, playCol, prefixCol, icon)
      set this.mercs = Set.create(name +  "s mercenaries")
      set this.mercBannedPlayers = CreateForce()
      return this
    endmethod
  endstruct

endlibrary