library LiegeFaction requires Faction, Set

  struct LiegeFaction extends Faction
    private Set vassals
    private integer vassalCount = 0
    private force vassalBannedPlayers

    private method OnTeamChange takes nothing returns nothing
      local integer i = 0
      //Change team of vassals too
      loop
        exitwhen i == vassals.size
        set VassalFaction(vassals[i]).Team = this.Team
        set i = i + 1
      endloop
    endmethod

    //Make vassals leave too
    private method OnLeave takes nothing returns nothing
      local integer i = 0
      loop
        exitwhen i == vassals.size
        if vassals[i] != 0 then
          call VassalFaction(vassals[i]).Leave()
          set VassalFaction(vassals[i]).Person = 0
        endif
        set i = i + 1
      endloop
    endmethod

    method AddVassal takes VassalFaction vassal returns nothing
      if (vassals.contains(vassal)) then
        call BJDebugMsg("Attempted to add vassal " + vassal.Name + " to liege " + this.name + " but it is already present")
        return
      endif
      if vassal.Liege != this and vassal.Liege != 0 then
        call BJDebugMsg("Attempted to add vassal " + vassal.Name + " to liege " + this.name + " but it already has the liege " + vassal.Liege.Name)
        return
      endif
      call vassals.add(vassal)
      if vassal.Liege != this then
        set vassal.Liege = this
      endif
    endmethod

    method IsPlayerBannedFromBecomingVassal takes player whichPlayer returns boolean
      return IsPlayerInForce(whichPlayer, this.vassalBannedPlayers)
    endmethod

    method BanPlayerFromBecomingVassal takes player whichPlayer returns nothing
      call ForceAddPlayer(this.vassalBannedPlayers, whichPlayer)
    endmethod

    static method create takes string name, playercolor playCol, string prefixCol, string icon, integer weight returns thistype
      local thistype this = thistype.allocate(name, playCol, prefixCol, icon, weight)
      set this.vassals = Set.create()
      set this.vassalBannedPlayers = CreateForce()
      return this
    endmethod
  endstruct

endlibrary