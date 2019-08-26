
library FactionMod requires Table

    struct FactionMod
        static integer array      factionModifiersById
        
        private integer           id = 0
        private force             players = null
        
        private Table             objectLimits         //This is how many units, researches or structures of a given type this faction can build
        private integer array     objectList[100]      //An index for objectLimits
        private integer           objectCount = 0


        method registerObjectLimit takes integer id, integer limit returns nothing
            if this.objectLimits[id] == 0 then
                set this.objectLimits[id] = limit
                set objectList[objectCount] = id
                set this.objectCount = this.objectCount + 1
            else
                call BJDebugMsg("Error: attempted to register already existing id " + GetObjectName(id) + " to FactionMod " + I2S(this.id))
            endif       
        endmethod

        method getObjectCount takes nothing returns integer
            return objectCount
        endmethod
        
        method getObjectLimit takes integer index returns integer
            return objectLimits[index]
        endmethod
        
        method getObjectList takes integer index returns integer
            return objectList[index]
        endmethod
        
        method getId takes nothing returns integer
            return this.id
        endmethod

        method removePlayer takes player p returns nothing
            call ForceRemovePlayer(this.players, p)
        endmethod

        method addPlayer takes player p returns nothing
            call ForceAddPlayer(this.players, p)
        endmethod

        method containsPlayer takes player p returns boolean
            return IsPlayerInForce(p, this.players)
        endmethod
        
        static method getFactionModById takes integer id returns FactionMod
            return thistype.factionModifiersById[id]
        endmethod
        
        static method create takes integer id returns FactionMod
            local FactionMod this = FactionMod.allocate()

            if factionModifiersById[id] == 0 then
                set factionModifiersById[id] = this
            else
                call BJDebugMsg("Error: created faction modifier that already exists with id " + I2S(id))
            endif

            set this.id = id
            set this.objectLimits = Table.create()
            set this.players = CreateForce()
            
            return this                
        endmethod         
    endstruct

endlibrary