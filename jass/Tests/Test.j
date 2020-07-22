library Test

  private function interface TestFunction takes nothing returns boolean

  struct Test
    private static thistype first
    private static thistype last
    private thistype next
    private string name
    private TestFunction testFunction

    method run takes nothing returns nothing
      if not testFunction.evaluate() then
        call BJDebugMsg("TEST FAILED: " + this.name)
      endif
    endmethod

    static method create takes string name, TestFunction testFunctioon returns thistype
      local thistype this = thistype.allocate()
      set this.name = name
      set this.testFunction = testFunction

      if thistype.first == null then
        set thistype.first = this
      endif
      if thistype.last != null then
        set thistype.last.next = this
      endif
      set thistype.last = this

      return this
    endmethod
  endstruct

endlibrary