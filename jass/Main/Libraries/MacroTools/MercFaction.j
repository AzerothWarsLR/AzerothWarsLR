library MercFaction requires Faction

  globals
    private constant real MERC_INCOME_PER_MINUTE = 60
    private constant real MERC_STARTING_GOLD = 450
  endglobals

  struct MercFaction extends Faction
    private static thistype array byIndex
    private static integer count = 0
    private LiegeFaction liege
    private integer research
    private Legend legend
    private integer teleportItemType = 0

    method operator TeleportItemType= takes integer itemType returns nothing
      set this.teleportItemType = itemType
    endmethod

    method operator ControlPointCountAsString takes nothing returns string
      return " "
    endmethod

    method operator Income takes nothing returns real
      return MERC_INCOME_PER_MINUTE
    endmethod

    method operator Liege takes nothing returns LiegeFaction
      return liege
    endmethod

    method operator CanBeInvited takes nothing returns boolean
      return false
    endmethod

    stub method DetermineLiege takes nothing returns LiegeFaction
      return 0
    endmethod

    method operator Liege= takes LiegeFaction liege returns nothing
      if this.liege != 0 then 
        call this.liege.RemoveMerc(this)
      endif
      set this.liege = liege
      if liege != 0 then
        call liege.AddMerc(this)
        set this.Team = this.Liege.Team
      else
        set this.Team = 0
      endif
    endmethod

    private method Unally takes nothing returns nothing

    endmethod

    private method OnTeamChange takes nothing returns nothing
      if this.Team != liege.Team then
        call BJDebugMsg("错误：佣兵" + this.name + "现在" + this.Team.Name + "阵营并应该效忠于" + liege.Name + "的阵营" + liege.Team.Name)
      endif
    endmethod

    static method create takes string name, playercolor playCol, string prefixCol, string icon, Legend legend returns thistype
      local thistype this = thistype.allocate(name, playCol, prefixCol, icon)
      set this.legend = legend
      set thistype.byIndex[thistype.count] = this
      set thistype.count = thistype.count + 1
      return this
    endmethod

    private method operator SelectionMessage takes nothing returns string
      return this.prefixCol + this.name + "|r 现在效忠于" + Liege.prefixCol + liege.Name + "|r。"
    endmethod

    private method DisplaySelection takes nothing returns nothing
      call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, "\n|cffffcc00佣兵已选择|r\n" + this.SelectionMessage)
    endmethod

    private method SelectForPerson takes Person whichPerson returns nothing
      local ControlPoint highestValueCP
      local LiegeFaction liegeCandidate = this.DetermineLiege()
          
          if liegeCandidate != 0 then
            set this.Liege = liegeCandidate
          else
            call DisplayTextToPlayer(whichPerson.Player, 0, 0,"该佣兵目前没有可以效忠的雇主。")
            return
          endif
    
      if whichPerson.Faction == this.Liege then
        call DisplayTextToPlayer(whichPerson.Player, 0, 0, "你不能成为你自己的佣兵。")
        return
      endif
      if whichPerson.Faction!= 0 and whichPerson.Faction.getType() == MercFaction.typeid or whichPerson.Faction.getType() == MmmrrrggglllMercFaction.typeid or whichPerson.Faction.getType() == SnarlmaneMercFaction.typeid or whichPerson.Faction.getType() == EdwinMercFaction.typeid then
        call DisplayTextToPlayer(whichPerson.Player, 0, 0, "你已经是一个佣兵了。")
        return
      endif
      set highestValueCP = ControlPoint.GetHighestValueCP(this.Liege.Person)
      if highestValueCP == 0 then
        call DisplayTextToPlayer(whichPerson.Player, 0, 0, "这个势力没有控制点。")
        return
      endif
      call whichPerson.Faction.Leave()
      set whichPerson.Faction = this
      if GetLocalPlayer() == whichPerson.Player then
        call ClearTextMessages()
      endif
      call DisplaySelection()
      call this.legend.Spawn(whichPerson.Player, highestValueCP.X, highestValueCP.Y, 0)
      set this.legend.StartingXP = GetHeroXP(this.legend.Unit)
      call UnitAddItemById(this.legend.Unit, this.teleportItemType)
      if GetLocalPlayer() == whichPerson.Player then
        call PanCameraToTimed(GetUnitX(this.legend.Unit), GetUnitY(this.legend.Unit), 0)
        call ClearSelection()
        call SelectUnit(this.legend.Unit, true)
      endif
      call whichPerson.addGold(MERC_STARTING_GOLD)
    endmethod

    private static method OnResearch takes nothing returns nothing
      local integer i = 0
      local integer soldUnitId = GetUnitTypeId(GetSoldUnit())
      loop
        exitwhen i == thistype.count
        if thistype.byIndex[i].legend.UnitType == soldUnitId then
          call thistype.byIndex[i].SelectForPerson(Person.ByHandle(GetOwningPlayer(GetSoldUnit())))
          call RemoveUnit(GetSoldUnit())
        endif
        set i = i + 1
      endloop
    endmethod

    private static method onInit takes nothing returns nothing
      local trigger trig = CreateTrigger()
      call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_SELL)
      call TriggerAddAction(trig, function thistype.OnResearch)
    endmethod
  endstruct

endlibrary