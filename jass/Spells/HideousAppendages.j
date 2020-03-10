library HideousAppendages initializer OnInit requires T32, Environment, Table, Math

  globals
    private constant integer ABIL_ID = 'A10K'         //Change this to the ID of the passive in your map

    private constant integer TENTACLE_COUNT_BASE = 2  //How many tentacles to spawn at level 0
    private constant integer TENTACLE_COUNT_LEVEL = 2 //Number of tentacles gained per level
    private constant integer TENTACLE_ID = 'n04Q'     //ID for tentacles; these should be immobile
    private constant real RADIUS_OFFSET = 200.        //How far away from the caster to position the tentacles
  endglobals    

  struct HideousAppendageSet
    readonly static Table byHandle
    private unit caster = null
    private unit array tentaclesByIndex[30]
    private integer tentacleCount = 0
    private integer level = 0
    private integer tick = 0

    method destroy takes nothing returns nothing
      set thistype.byHandle[GetHandleId(this.caster)] = 0
      call stopPeriodic()
      call kill()
      call deallocate()
    endmethod

    method kill takes nothing returns nothing
      local integer i = 0
      loop
      exitwhen i > tentacleCount
        call KillUnit(tentaclesByIndex[i])
        set tentaclesByIndex[i] = null
        set i = i + 1
      endloop
    endmethod

    method spawnTentacle takes real x, real y, integer index returns nothing
      local unit tempUnit = CreateUnit(GetOwningPlayer(caster), TENTACLE_ID, x, y, 0)
      call SetUnitAnimation(tempUnit, "birth")
      call QueueUnitAnimation(tempUnit, "stand")
      call SetUnitVertexColor(tempUnit, 100, 100, 255, 255)
      call UnitAddAbility(tempUnit, 'Aloc')
      call SetUnitPathing(tempUnit, false)
      set tentaclesByIndex[index] = tempUnit
    endmethod

    method reposition takes nothing returns nothing
      local integer i = 0
      local real offsetAngle = 0
      local real offsetX = 0
      local real offsetY = 0
      set tentacleCount = TENTACLE_COUNT_BASE + TENTACLE_COUNT_LEVEL*level
      loop
      exitwhen i == tentacleCount
        set offsetAngle = ((bj_PI*2)/tentacleCount)*i
        set offsetX = GetUnitX(caster) + RADIUS_OFFSET*Cos(offsetAngle)
        set offsetY = GetUnitY(caster) + RADIUS_OFFSET*Sin(offsetAngle)
        if GetDistanceBetweenPoints(GetUnitX(tentaclesByIndex[i]), GetUnitY(tentaclesByIndex[i]), offsetX, offsetY) > 0 then
          if tentaclesByIndex[i] != null then
            call SetUnitPosition(tentaclesByIndex[i], offsetX, offsetY)
          else
            call spawnTentacle(offsetX, offsetY, i)
          endif
        endif
        set i = i + 1
      endloop            
    endmethod

    method updateStats takes nothing returns nothing
      local integer i = 0
      loop
      exitwhen i > tentacleCount
        call BlzSetUnitBaseDamage(tentaclesByIndex[i], BlzGetUnitBaseDamage(caster, 0), 0)
        call BlzSetUnitDiceNumber(tentaclesByIndex[i], BlzGetUnitDiceNumber(caster, 0), 0)
        call BlzSetUnitDiceSides(tentaclesByIndex[i], BlzGetUnitDiceSides(caster, 0), 0)
        set i = i + 1
      endloop            
    endmethod

    method periodic takes nothing returns nothing
      if caster == null then
        call destroy()
        return
      endif
      if not UnitAlive(caster) then
        call kill()
        return
      endif
      call reposition()
      set tick = tick + 1
      if tick/T32_FPS == 1 then
        call updateStats()
        set tick = 0
      endif
    endmethod

    implement T32x

    method operator Level= takes integer newLevel returns nothing
      local real offsetAngle = 0
      local real offsetX = 0
      local real offsetY = 0
      local integer i = tentacleCount
      set tentacleCount = TENTACLE_COUNT_BASE + TENTACLE_COUNT_LEVEL*level
      loop
      exitwhen i == tentacleCount
        set offsetAngle = ((bj_PI*2)/this.tentacleCount)*i
        set offsetX = GetUnitX(caster) + RADIUS_OFFSET*Cos(offsetAngle)
        set offsetY = GetUnitY(caster) + RADIUS_OFFSET*Sin(offsetAngle)
        call spawnTentacle(offsetX, offsetY, i)
        set i = i + 1
      endloop
      set level = newLevel
      call reposition()
      call updateStats()
    endmethod

    static method onInit takes nothing returns nothing
      set thistype.byHandle = Table.create()
    endmethod

    static method create takes unit caster, integer level returns thistype
      local thistype this = thistype.allocate()
      set this.caster = caster
      set this.Level = level
      set thistype.byHandle[GetHandleId(caster)] = this
      call this.startPeriodic()
      return this
    endmethod
  endstruct

  private function Learn takes nothing returns nothing
    local HideousAppendageSet tempHideousAppendageSet = 0
    local unit triggerUnit = null
    local integer triggerUnitHandleId = 0
    if GetLearnedSkill() == ABIL_ID then
      set triggerUnit = GetLearningUnit()
      set triggerUnitHandleId = GetHandleId(triggerUnit)
      set tempHideousAppendageSet = HideousAppendageSet.byHandle[triggerUnitHandleId]
      if tempHideousAppendageSet == 0 then
        set tempHideousAppendageSet = HideousAppendageSet.create(triggerUnit, GetUnitAbilityLevel(triggerUnit, ABIL_ID))
      else
        set tempHideousAppendageSet.Level = GetUnitAbilityLevel(triggerUnit, ABIL_ID)
      endif
      set triggerUnit = null
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_HERO_SKILL )
    call TriggerAddCondition( trig, Condition(function Learn))
  endfunction 

endlibrary