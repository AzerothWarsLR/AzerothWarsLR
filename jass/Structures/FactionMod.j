
library FactionMod requires Table

  struct FactionMod
    readonly Table             objectLimits         //This is how many units, researches or structures of a given type this faction can build
    readonly integer array     objectList[100]      //An index for objectLimits
    readonly integer           objectCount = 0

    method registerObjectLimit takes integer id, integer limit returns nothing
      if this.objectLimits[id] == 0 then
        set this.objectLimits[id] = limit
        set objectList[objectCount] = id
        set this.objectCount = this.objectCount + 1
      else
        call BJDebugMsg("Error: attempted to register already existing id " + GetObjectName(id) + " to FactionMod " + I2S(this))
      endif       
    endmethod
    
    static method create takes nothing returns FactionMod
      local FactionMod this = FactionMod.allocate()

      set this.objectLimits = Table.create()
      
      return this                
    endmethod         
  endstruct

endlibrary