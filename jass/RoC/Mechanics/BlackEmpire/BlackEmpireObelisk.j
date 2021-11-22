library BlackEmpireObelisk initializer OnInit requires ControlPoint

  globals
    private constant integer ABIL_ID = 'A06Z'
    private constant real DURATION = 10.
    private constant integer OBELISK_ID = 'n0BA'

    Event BlackEmpireObeliskSummoned
  endglobals

  private struct BlackEmpireObelisk
    private static thistype array byCaster
    private unit caster
    private real tick = 0.
    private real maxDuration = 0.
    private real elapsedDuration = 0.
    private ControlPoint controlPoint
    private unit obeliskUnit
    static thistype triggerObelisk

    method operator X takes nothing returns real
      return GetUnitX(controlPoint.Unit)
    endmethod

    method operator Y takes nothing returns real
      return GetUnitY(controlPoint.Unit)
    endmethod

    public method operator ControlPoint takes nothing returns ControlPoint
      return this.controlPoint
    endmethod

    private method End takes boolean finished returns nothing
      if this.elapsedDuration >= this.maxDuration then
        set thistype.triggerObelisk = this
        call BlackEmpireObeliskSummoned.fire()
      else
        call RemoveUnit(this.obeliskUnit)
      endif
      set this.obeliskUnit = null
      call this.stopPeriodic()
      call this.destroy()
    endmethod

    public static method OnAnyStopChannel takes nothing returns nothing
      call thistype.byCaster[GetUnitId(GetTriggerUnit())].End(false)
    endmethod

    public static method OnAnyStartChannel takes nothing returns nothing
      local unit caster = GetTriggerUnit()
      local ControlPoint controlPoint = ControlPoint.ByHandle(GetSpellTargetUnit())
      if controlPoint != 0 and controlPoint == BlackEmpirePortal.Objective.NearbyControlPoint then
        set thistype.byCaster[GetUnitId(caster)] = thistype.create(caster, controlPoint, DURATION)
        call SetUnitInvulnerable(caster, false)
        call SetUnitOwner(this.obeliskUnit, GetOwningPlayer(this.caster), true)
      else
        call IssueImmediateOrder(caster, "stop")
      endif
    endmethod

    private method periodic takes nothing returns nothing    
      set this.tick = this.tick+1
      set this.elapsedDuration = this.elapsedDuration + 1./T32_FPS
    endmethod

    implement T32x

    static method create takes unit caster, ControlPoint controlPoint, real duration returns thistype
      local thistype this = thistype.allocate()
      set this.caster = caster
      set this.controlPoint = controlPoint
      set this.elapsedDuration = 0
      set this.maxDuration = duration
      set this.obeliskUnit = CreateUnit(GetOwningPlayer(caster), OBELISK_ID, GetUnitX(controlPoint.u), GetUnitY(controlPoint.u), 270)
      call this.startPeriodic()      
      return this
    endmethod
  endstruct

  function GetTriggerBlackEmpireObelisk takes nothing returns BlackEmpireObelisk
    return BlackEmpireObelisk.triggerObelisk
  endfunction

  private function OnInit takes nothing returns nothing  
    call RegisterSpellChannelAction(ABIL_ID, function BlackEmpireObelisk.OnAnyStartChannel)
    call RegisterSpellEndcastAction(ABIL_ID, function BlackEmpireObelisk.OnAnyStopChannel)  
    set BlackEmpireObeliskSummoned = Event.create()
  endfunction 

endlibrary