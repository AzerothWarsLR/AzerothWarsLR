//------------------------------------------------------------------------------------\\
//                            Linked List Module [v3.0.0]                             \\
//                               By Kenny & Jesus4Lyf.                                \\
//                              Constructed using vJASS.                              \\
//                                Requires: NewGen WE.                                \\
//------------------------------------------------------------------------------------\\
//                                                                                    \\
//------------------------------------------------------------------------------------\\
//  DESCRIPTION:                                                                      \\
// ¯¯¯¯¯¯¯¯¯¯¯¯¯                                                                      \\
//    This module is a very powerful tool for structs. It enables users to create a   \\
//    linked list using a struct instance as the list itself, allowing for multiple   \\
//    lists in the one struct. It is simple to use and generates a very intuitive and \\
//    basic interface that is easy to follow and understand. A linked list can be     \\
//    used to store struct instances instead of using the 'struct stack' method, and  \\
//    can also be used to attached a list to units and so on. When used appropriately \\
//    it can give great functionality to users.                                       \\
//                                                                                    \\
//  METHODS:                                                                          \\
// ¯¯¯¯¯¯¯¯¯                                                                          \\
//    There are several methods available to you when you use this module, they       \\
//    include:                                                                        \\
//                                                                                    \\
//      Static methods:                                                               \\
//     ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯                                                               \\
//        - .createList()   - Creates a list using a struct instance as its 'base'.   \\
//                          - Returns thistype. Retuns the list itself.               \\
//                                                                                    \\
//      Non-static methods:                                                           \\
//     ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯                                                           \\
//        - .searchList()   - Searches a list for a given instance of a struct type.  \\
//                          - Returns thistype.                                       \\
//                                                                                    \\
//        - .destroyList()  - Destroys each link in the list, as well as the list.    \\
//                          - Returns nothing.                                        \\
//                                                                                    \\
//        - .addToStart()   - Adds a struct instance to the start of the list.        \\
//                          - Returns thistype. Returns the parameter.                \\
//                                                                                    \\
//        - .addToEnd()     - Adds a struct instance to the end of the list.          \\
//                          - Returns thistype. Returns the parameter.                \\
//                                                                                    \\
//        - .detachHead()   - Removes the first link from the list.                   \\
//                          - Returns thistype. Returns the first link.               \\
//                                                                                    \\
//        - .detachTail()   - Removes the last link from the list.                    \\
//                          - Returns thistype. Returns the last link.                \\
//                                                                                    \\
//        - .detachThis()   - Removes the current link from the list.                 \\
//                          - Returns thistype. Returns the current link.             \\
//                                                                                    \\
//        - .destroyHead()  - Removes the first link from the list and calls the      \\
//                            .destroy() method.                                      \\
//                          - Returns nothing.                                        \\
//                                                                                    \\
//        - .destroyTail()  - Removes the last link from the list and calls the       \\
//                            .destroy() method.                                      \\
//                          - Returns nothing.                                        \\
//                                                                                    \\
//        - .destroyThis()  - Removes the current link from the list and call the     \\
//                            .destroy() method.                                      \\
//                          - Returns nothing.                                        \\
//                                                                                    \\
//  MEMBERS:                                                                          \\
// ¯¯¯¯¯¯¯¯¯                                                                          \\
//    There are several members that users can access using this module, these        \\
//    include:                                                                        \\
//                                                                                    \\
//      Readonly members:                                                             \\
//     ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯                                                             \\
//        - .head           - Retrieves the first link in the list and returns it.    \\ 
//                          - Returns thistype.                                       \\
//                                                                                    \\
//        - .next           - Retrieves the next link in the list and returns it.     \\
//                          - Returns thistype. Returns the next link.                \\
//                                                                                    \\
//        - .hasNext        - Checks to see if the current link has a next link.      \\
//                          - Returns boolean. Returns true is next link is there.    \\
//                                                                                    \\
//        - .tail           - Retrieves the last link in the list and returns it.     \\
//                          - Returns thistype. Returns the last link.                \\
//                                                                                    \\
//        - .prev           - Retrieves the prev link in the list and returns it.     \\
//                          - Returns thistype. Returns the previous link.            \\
//                                                                                    \\
//        - .hasPrev        - Checks to see if the current link has a next link.      \\
//                          - Returns boolean. Returns true if prev link is there.    \\ 
//                                                                                    \\
//        - .size           - Retrieves the current size of a list (Number of links). \\
//                          - Returns integer. Returns the number of current links.   \\
//                                                                                    \\
//        - .empty          - Checks to see if a given list is empty or not.          \\
//                          - Returns boolean. Returns true if list is empty.         \\
//                                                                                    \\
//        - .isList         - Checks to see if a given struct instance is a list.     \\
//                          - Returns boolean. Returns true if an instance is a list. \\ 
//                                                                                    \\
//  USAGE/EXAMPLES:                                                                   \\
// ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯                                                                   \\
//    To use this module within a struct you must implement it using the following:   \\
//                                                                                    \\
//      private struct Data                                                           \\
//          implement LinkedList                                                      \\
//                                                                                    \\
//          Do stuff here using the module.                                           \\
//      endstruct                                                                     \\
//                                                                                    \\
//    It is easiest to implement it right under struct declaration.                   \\
//                                                                                    \\
//    There are only three methods available which use parameters. Usage for these    \\
//    three methods are as follows:                                                   \\
//                                                                                    \\
//      call .addToStart(thistype value)                                              \\
//      call .addToEnd(thistype value)                                                \\
//      call .searchList(thistype value)                                              \\
//                                                                                    \\
//    The above take one parameter. The parameter must be a thistype value. Meaning   \\
//    it takes a struct instance as the parameter.                                    \\   
//                                                                                    \\
//  PROS & CONS:                                                                      \\
// ¯¯¯¯¯¯¯¯¯¯¯¯¯                                                                      \\
//    As this module is just a simplification of struct stack syntax, there are not   \\
//    many negative points for it. However, just for the sake of it:                  \\
//                                                                                    \\
//      Pros:                                                                         \\
//     ¯¯¯¯¯¯                                                                         \\
//        - Simplifies syntax a fair bit. Makes it easier to read.                    \\
//        - Allows for multiple linked lists within a single struct, generating       \\
//          multiple storage components.                                              \\
//        - Reduces time spent developing spells/scripts and reduces lines.           \\
//        - There is also a -possible- efficiency gain over the normal struct stack.  \\
//          But this I am not sure of.                                                \\
//                                                                                    \\
//      Cons:                                                                         \\
//     ¯¯¯¯¯¯                                                                         \\
//        - A single node can only exist in one list at a time.                       \\
//                                                                                    \\
//  IMPORTING:                                                                        \\
// ¯¯¯¯¯¯¯¯¯¯¯                                                                        \\
//    Simply create a new trigger, name it LinkedList or something along those lines. \\
//    Then convert it to custom text, and paste this in its place and save. Done.     \\
//                                                                                    \\
//  THANKS/CREDITS:                                                                   \\
// ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯                                                                   \\
//    - Jesus4Lyf - For basically re-inventing the module to make it far more useful  \\
//                  and dynamic. Also for helping me understand linked lists better   \\
//                  and helping to develop the script further. Major props to him.    \\
//                                                                                    \\
//------------------------------------------------------------------------------------\\
library ListModule
    
    module LinkedList
    
        private thistype nextx = 0
        private thistype prevx = 0
        private thistype listx = 0
        private boolean  aList = false

        method operator head takes nothing returns thistype
            debug if not this.aList then
                debug call BJDebugMsg("Linked List Module (head): Struct instance is not a list.")
                debug return 0
            debug endif
            return this.nextx
        endmethod
        
        method operator next takes nothing returns thistype
            return this.nextx
        endmethod
        
        method operator hasNext takes nothing returns boolean
            return this.nextx != 0
        endmethod
        
        method operator tail takes nothing returns thistype
            debug if not this.aList then
                debug call BJDebugMsg("Linked List Module (last): Struct instance is not a list.")
                debug return 0
            debug endif
            return this.prevx
        endmethod
        
        method operator prev takes nothing returns thistype
            return this.prevx
        endmethod
        
        method operator hasPrev takes nothing returns boolean
            return this.prevx != 0
        endmethod
        
        method operator size takes nothing returns integer
            debug if not this.aList then
                debug call BJDebugMsg("Linked List Module (size/empty): Struct instance is not a list.")
                debug return 0
            debug endif
            return integer(this.listx)
        endmethod
        
        method operator empty takes nothing returns boolean
            return this.size == 0
        endmethod
        
        method operator isList takes nothing returns boolean    
            return this.aList
        endmethod
        
        method operator[] takes integer index returns thistype
            loop
                set this = this.nextx
                set index = index - 1
                exitwhen index == 0
            endloop
            return this
        endmethod
        
        method destroyThis takes nothing returns nothing
            call this.detachThis().destroy()
        endmethod
        
        method destroyTail takes nothing returns nothing
            call this.detachTail().destroy()
        endmethod
        
        method destroyHead takes nothing returns nothing
            call this.detachHead().destroy()
        endmethod
        
        method detachThis takes nothing returns thistype
            debug if this.listx == 0 then
                debug call BJDebugMsg("Linked List Module (detachThis): Struct instance is not attached to a list.")
                debug return 0
            debug endif
            
            if this.listx.nextx == this then
                call this.listx.detachHead()
            elseif this.listx.prevx == this then
                call this.listx.detachTail()
            else
                set this.prevx.nextx = this.nextx
                set this.nextx.prevx = this.prevx
                set this.listx.listx = integer(this.listx.listx) - 1
                
                set this.nextx = 0
                set this.prevx = 0
                set this.listx = 0
            endif
            
            return this
        endmethod
        
        method detachTail takes nothing returns thistype
            local thistype tail = this.prevx
            
            debug if not this.aList then
                debug call BJDebugMsg("Linked List Module (detachLast): Struct instance is not a list.")
                debug return 0
            debug endif
            
            set this.prevx = this.prevx.prevx
            set this.prevx.nextx = 0
            set this.listx = integer(this.listx) - 1
            
            set tail.nextx = 0
            set tail.prevx = 0
            set tail.listx = 0
            
            if this.nextx == tail then
                set this.nextx = 0
            endif
            
            return tail
        endmethod
        
        method detachHead takes nothing returns thistype
            local thistype head = this.nextx
            
            debug if not this.aList then
                debug call BJDebugMsg("Lniked List Module (detachHead): Struct instance is not a list.")
                debug return 0
            debug endif
            
            set this.nextx = this.nextx.nextx
            set this.nextx.prevx = 0
            set this.listx = integer(this.listx) - 1
            
            set head.nextx = 0
            set head.prevx = 0
            set head.listx = 0
            
            if this.prevx == head then
                set this.prevx = 0
            endif
            
            return head
        endmethod
        
        method addToEnd takes thistype toAdd returns thistype
            debug if not this.aList then
                debug call BJDebugMsg("Linked List Module (addToEnd): Struct instance is not a list.")
                debug return 0
            debug endif
            
            set this.prevx.nextx = toAdd
            set toAdd.prevx = this.prevx
            set this.prevx = toAdd
            
            if this.nextx == 0 then
                set this.nextx = toAdd
            endif
            
            set toAdd.listx = this
            set this.listx  = integer(this.listx) + 1
            
            return toAdd
        endmethod
        
        method addToStart takes thistype toAdd returns thistype
            debug if not this.aList then
                debug call BJDebugMsg("Linked List Module (addToStart): Struct instance is not a list.")
                debug return 0
            debug endif
            
            set this.nextx.prevx = toAdd
            set toAdd.nextx = this.nextx
            set this.nextx = toAdd
            
            if this.prevx == 0 then
                set this.prevx = toAdd
            endif
            
            set toAdd.listx = this
            set this.listx  = integer(this.listx) + 1

            return toAdd
        endmethod
        
        method destroyList takes nothing returns nothing
            debug if not this.aList then
                debug call BJDebugMsg("Linked List Module (destroyList): Struct instance is not a list.")
                debug return
            debug endif
            
            loop
                if this.aList then
                    call this.deallocate()
                else
                    call this.destroy()
                endif
                set this = this.nextx
                exitwhen this == 0
            endloop
        endmethod
        
        method searchList takes thistype toSearch returns thistype
            debug if not this.aList then
                debug call BJDebugMsg("Linked List Module (searchList): Struct instance is not a list.")
                debug return 0
            debug endif
            
            loop
                set this = this.nextx
                if this == toSearch then
                    return this
                endif
                exitwhen this == 0
            endloop
            
            return 0
        endmethod
        
        static method createList takes nothing returns thistype
            local thistype this = thistype.allocate()
            
            set this.aList = true
            
            return this
        endmethod
        
    endmodule
    
endlibrary