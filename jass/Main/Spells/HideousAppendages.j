
library HideousAppendages initializer OnInit requires T32

    globals
        private constant integer ABIL_ID = 'A10K'
        private constant integer SPELL_MAX_LEVEL = 5

        private constant integer TENTACLE_COUNT_BASE = 2
        private constant integer TENTACLE_COUNT_LEVEL = 2     
        private constant integer TENTACLE_ID = 'n04Q'
        private constant real RADIUS_OFFSET = 200.  //How far away from the caster to position the tentacles
    endglobals    

    struct HideousAppendageSet
        readonly static Table appendageSetsByCasterHandleId
        readonly unit caster = null
        readonly unit array tentaclesByIndex[30]
        readonly integer tentacleCount = 0
        readonly integer level = 0
        private integer tick = 0

        method destroy takes nothing returns nothing
            set thistype.appendageSetsByCasterHandleId[GetHandleId(this.caster)] = 0
            call this.stopPeriodic()
            call this.kill()
            call this.deallocate()
        endmethod

        method kill takes nothing returns nothing
            local integer i = 0
            loop
            exitwhen i > this.tentacleCount
                call KillUnit(this.tentaclesByIndex[i])
                set this.tentaclesByIndex[i] = null
                set i = i + 1
            endloop
        endmethod

        method spawnTentacle takes real x, real y, integer index returns nothing
            local unit tempUnit = CreateUnit(GetOwningPlayer(this.caster), TENTACLE_ID, x, y, 0)
            call SetUnitAnimation(tempUnit, "birth")
            call QueueUnitAnimation(tempUnit, "stand")
            call SetUnitVertexColor(tempUnit, 100, 100, 255, 255)
            call UnitAddAbility(tempUnit, 'Aloc')
            call SetUnitPathing(tempUnit, false)
            set this.tentaclesByIndex[index] = tempUnit
        endmethod

        method reposition takes nothing returns nothing
            local integer i = 0
            local real offsetAngle = 0
            local real offsetX = 0
            local real offsetY = 0
            set this.tentacleCount = TENTACLE_COUNT_BASE + TENTACLE_COUNT_LEVEL*level
            loop
            exitwhen i > this.tentacleCount
                set offsetAngle = ((bj_PI*2)/this.tentacleCount)*i
                set offsetX = GetUnitX(caster) + RADIUS_OFFSET*Cos(offsetAngle)
                set offsetY = GetUnitY(caster) + RADIUS_OFFSET*Sin(offsetAngle)
                if GetDistanceBetweenPoints(GetUnitX(this.tentaclesByIndex[i]), GetUnitY(this.tentaclesByIndex[i]), offsetX, offsetY) > 0 then
                    if this.tentaclesByIndex[i] != null then
                        call SetUnitPosition(this.tentaclesByIndex[i], offsetX, offsetY)
                    else
                        call this.spawnTentacle(offsetX, offsetY, i)
                    endif
                endif
                set i = i + 1
            endloop            
        endmethod

        method updateStats takes nothing returns nothing
            local integer i = 0
            loop
            exitwhen i > this.tentacleCount
                call BlzSetUnitBaseDamage(this.tentaclesByIndex[i], BlzGetUnitBaseDamage(this.caster, 0), 0)
                call BlzSetUnitDiceNumber(this.tentaclesByIndex[i], BlzGetUnitDiceNumber(this.caster, 0), 0)
                call BlzSetUnitDiceSides(this.tentaclesByIndex[i], BlzGetUnitDiceSides(this.caster, 0), 0)
                set i = i + 1
            endloop            
        endmethod

        method periodic takes nothing returns nothing
            if this.caster == null then
                call this.destroy()
                return
            endif
            if not IsUnitAliveBJ(this.caster) then
                call this.kill()
                return
            endif
            call this.reposition()
            set this.tick = this.tick + 1
            if this.tick/T32_FPS == 1 then
                call this.updateStats()
                set this.tick = 0
            endif
        endmethod

        implement T32x

        method setLevel takes integer level returns nothing
            local real offsetAngle = 0
            local real offsetX = 0
            local real offsetY = 0
            local integer i = this.tentacleCount+1
            set this.tentacleCount = TENTACLE_COUNT_BASE + TENTACLE_COUNT_LEVEL*level
            loop
            exitwhen i > this.tentacleCount
                set offsetAngle = ((bj_PI*2)/this.tentacleCount)*i
                set offsetX = GetUnitX(caster) + RADIUS_OFFSET*Cos(offsetAngle)
                set offsetY = GetUnitY(caster) + RADIUS_OFFSET*Sin(offsetAngle)
                call this.spawnTentacle(offsetX, offsetY, i)
                set i = i + 1
            endloop
            set this.level = level
            call this.reposition()
            call this.updateStats()
        endmethod

        static method onInit takes nothing returns nothing
            set thistype.appendageSetsByCasterHandleId = Table.create()
        endmethod

        static method create takes unit caster returns thistype
            local thistype this = thistype.allocate()
            set this.caster = caster
            set thistype.appendageSetsByCasterHandleId[GetHandleId(this.caster)] = this

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
            set tempHideousAppendageSet = HideousAppendageSet.appendageSetsByCasterHandleId[triggerUnitHandleId]
            if tempHideousAppendageSet == 0 then
                set tempHideousAppendageSet = HideousAppendageSet.create(triggerUnit)
                set HideousAppendageSet.appendageSetsByCasterHandleId[triggerUnitHandleId] = tempHideousAppendageSet
            endif
            call tempHideousAppendageSet.setLevel(GetUnitAbilityLevel(triggerUnit, ABIL_ID))
            set triggerUnit = null
        endif
    endfunction

    private function OnInit takes nothing returns nothing
        local trigger trig = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_HERO_SKILL )
        call TriggerAddCondition( trig, Condition(function Learn))
    endfunction 

endlibrary