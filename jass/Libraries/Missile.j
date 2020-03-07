/* //Objects that simulate normal Warcraft 3 projectiles.

library Missile requires T32, GeneralHelpers

  struct Missile
    private effect sfx

    method operator X= takes real r returns nothing
      call BlzSetSpecialEffectX(sfx, r)
      call BlzSetSpecialEffectZ(sfx, GetPositionZ(x, y))
    endmethod

    method operator X takes nothing returns real
      return x
    endmethod

    method operator Y= takes real r returns nothing
      call BlzSetSpecialEffectY(sfx, r)
      call BlzSetSpecialEffectZ(sfx, GetPositionZ(x, y))
    endmethod

    method operator Y takes nothing returns real
      return y
    endmethod

    method operator Facing= takes real r returns nothing
      call BlzSetSpecialEffectYaw(sfx, r*bj_DEGTORAD)
    endmethod

    method operator Facing takes nothing returns real
      return face
    endmethod

    private method periodic takes nothing returns nothing

    endmethod

    implement T32x

    private method destroy takes nothing returns nothing
      call stopPeriodic()
      call deallocate()
    endmethod

    static method create takes string effect, real x, real y, real facing returns thistype
      local thistype this = thistype.allocate()
      set sfx = AddSpecialEffect(effect, x, y)
      call startPeriodic()
      return this
    endmethod
  endstruct

endlibrary */