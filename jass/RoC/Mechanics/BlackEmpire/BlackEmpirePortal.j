library BlackEmpirePortal requires GameSetup

  struct BlackEmpirePortal
    private static thistype array byIndex
    private static integer count = 0
    private static thistype objective //The portal that needs to be opened now

    private unit interiorWaygate
    private unit exteriorWaygate
    private destructable interiorPortal
    private ControlPoint nearbyControlPoint //This Control Point is the closest one to the exterior Waygate

    private boolean isOpen = true
    private boolean isLocked = false
    private BlackEmpirePortal next //The portal that needs to be opened after this one.
    private string name

    public method operator NearbyControlPoint takes nothing returns ControlPoint
      return this.nearbyControlPoint
    endmethod

    public method operator NearbyControlPoint= takes ControlPoint value returns nothing
      set this.nearbyControlPoint = value
    endmethod

    public method operator Name takes nothing returns string
      return this.name
    endmethod

    public method operator IsOpen takes nothing returns boolean
      return this.isOpen
    endmethod

    public method operator IsLocked takes nothing returns boolean
      return this.isLocked
    endmethod

    public method operator IsLocked= takes boolean value returns nothing
      set this.isLocked = value
    endmethod

    public method Open takes nothing returns nothing
      if this.isOpen == true or this.isLocked == true then
        return
      endif
      set this.isOpen = true
      call WaygateActivate(interiorWaygate, true)
      call WaygateActivate(exteriorWaygate, true)
      call SetDestructableAnimation(this.interiorPortal, "birth")
      call SetUnitAnimation(this.exteriorWaygate, "birth")
      call SetUnitVertexColor(this.interiorWaygate, 255, 255, 255, 255)
    endmethod

    public method Close takes nothing returns nothing
      if this.isOpen == false or this.isLocked == true then
        return
      endif
      set this.isOpen = false
      call WaygateActivate(interiorWaygate, false)
      call WaygateActivate(exteriorWaygate, false)
      call SetDestructableAnimation(this.interiorPortal, "death")
      call SetUnitAnimation(this.exteriorWaygate, "death")
      call SetUnitVertexColor(this.interiorWaygate, 255, 50, 50, 255)
    endmethod

    private method SetupWaygateDestinations takes nothing returns nothing
      call WaygateSetDestination(interiorWaygate, GetUnitX(exteriorWaygate), GetUnitY(exteriorWaygate))
      call WaygateSetDestination(exteriorWaygate, GetUnitX(interiorWaygate), GetUnitY(interiorWaygate))
    endmethod

    public method operator Next= takes BlackEmpirePortal value returns nothing
      set this.next = value
    endmethod

    //Progresses the current Portal objective to the next one.
    public static method GoToNext takes nothing returns nothing
      set thistype.objective = thistype.objective.next
    endmethod

    public static method operator Objective= takes thistype value returns nothing
      set thistype.objective = value
    endmethod

    public static method operator Objective takes nothing returns thistype
      return thistype.objective
    endmethod

    public static method create takes unit interiorWaygate, destructable interiorPortal, unit exteriorWaygate, string name returns thistype
      local thistype this = thistype.allocate()
      set this.interiorWaygate = interiorWaygate
      set this.exteriorWaygate = exteriorWaygate
      set this.interiorPortal = interiorPortal
      set this.name = name
      call this.SetupWaygateDestinations()
      set thistype.byIndex[thistype.count] = this
      set thistype.count = thistype.count + 1

      call FogModifierStart(CreateFogModifierRadius(Player(14), FOG_OF_WAR_VISIBLE, GetUnitX(exteriorWaygate), GetUnitY(exteriorWaygate), 700, true, true))
      call this.Close()
      return this
    endmethod
  endstruct

endlibrary