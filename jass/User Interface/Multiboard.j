//Decoupled version of Multiboard

library Multiboard initializer OnInit requires Faction, Team, Event, Table

  globals
    private constant integer COLUMN_COUNT   = 3
    private constant string  TITLE          = "Scoreboard"
    private constant integer HEADER_SIZE    = 1
    
    constant integer COLUMN_FACTION = 0
    constant integer COLUMN_CP      = 1
    constant integer COLUMN_INCOME  = 2
    constant integer COLUMN_TEAM    = 0
    
    constant real    WIDTH_FACTION  = 0.1
    constant real    WIDTH_CP       = 0.035
    constant real    WIDTH_INCOME   = 0.045
    constant real    WIDTH_TEAM     = WIDTH_FACTION + WIDTH_CP + WIDTH_INCOME

    //Row type enums
    constant integer ROW_TYPE_PERSON  = 0
    constant integer ROW_TYPE_TEAM    = 1

    //Mutable globals
    Multiboard Scoreboard = 0 //A singleton instantiation of Multiboard; this system could be changed to multiple Multiboards easily
  endglobals

  //Abstraction of a Blizzard multiboarditem
  private struct RowItem
    string value = null
    string icon = null
    real width = 0

    static method create takes string value, string icon, real width returns thistype
      local thistype this = thistype.allocate()

      set this.value = value
      set this.icon = icon
      set this.width = width

      return this
    endmethod 
  endstruct

  //Abstraction of a Blizzard Multiboard row
  private struct Row
    readonly RowItem array rowItemsByIndex[10]
    readonly thistype array childRowsByIndex[10]
    readonly integer array childRowIndexesByRow[10]
    readonly integer childCount = 0
    readonly thistype parentRow = 0

    method destroy takes nothing returns nothing
      local integer i = 0
      //Destory all row items
      loop
        exitwhen rowItemsByIndex[i] == 0
        call rowItemsByIndex[i].destroy()
        set i = i + 1
      endloop
      //Unregister from parent
      if this.parentRow != 0 then
        call this.parentRow.unregisterChildRow(this)
      endif
    endmethod

    private method setChildRowIndex takes Row whichRow, integer index returns nothing
      local integer i = childRowIndexesByRow[whichRow]
      if childRowIndexesByRow[whichRow] != 0 then
        set childRowIndexesByRow[whichRow] = 0
        set childRowsByIndex[childRowIndexesByRow[whichRow]] = 0
      endif
      if index > -1 then
        set childRowIndexesByRow[whichRow] = index
        set childRowsByIndex[index] = whichRow
      else
        set childRowsByIndex[index].parentRow = 0
        set childCount = childCount - 1
        //Move all below rows up by 1
        loop
          exitwhen i == childCount
          call setChildRowIndex(childRowsByIndex[i+1], i)
          set i = i + 1
        endloop
      endif
    endmethod

    method unregisterChildRow takes Row whichRow returns nothing
      call setChildRowIndex(whichRow, -1)
    endmethod

    method registerChildRow takes Row whichRow returns nothing
      call setChildRowIndex(whichRow, childCount)
      set childCount = childCount + 1
      set whichRow.parentRow = this
    endmethod

    method updateRowItem takes integer i, string value, string icon, real width returns nothing
      if this.rowItemsByIndex[i] == 0 then
        set this.rowItemsByIndex[i] = RowItem.create(value, icon, width)
      else
        set this.rowItemsByIndex[i].value = value
        set this.rowItemsByIndex[i].icon = icon
        set this.rowItemsByIndex[i].width = width
      endif
    endmethod

    static method create takes nothing returns thistype
      local thistype this = 0
      set this = thistype.allocate()
      return this
    endmethod   
  endstruct  

  struct Multiboard 
    readonly Table rowsByTeam
    readonly Table rowsByPerson
    readonly Table rowIndexesByRow  //The x position of each Row by their Row struct id
    readonly Row array rowsByIndex[100]
    readonly Row headerRow = 0
    private integer rowCount = 0
    private multiboard board = null

    //Unrendering a row involves copying all below rows to the row above them, then downsizing the multiboard
    method unrenderRow takes Row whichRow returns nothing
      local multiboarditem mbi = null
      local integer index = 0
      local integer i = 0
      local integer j = 0

      if whichRow == 0 then
        call BJDebugMsg("ERROR: attempted to unrender nonexistent multiboard row")
      endif

      set i = this.rowIndexesByRow[whichRow]
      call setRowIndex(whichRow, -1)

      call whichRow.destroy()

      //Move all below rows up by one
      loop
        exitwhen i == this.rowCount-1
        call this.setRowIndex(this.rowsByIndex[i+1], i)
        call renderRow(this.rowsByIndex[i])
        set i = i + 1
      endloop

      call this.modRowCount(-1)
    endmethod

    //Converts a row from raw data into a display on the WC3 native multiboard
    method renderRow takes Row whichRow returns nothing
      local integer i = 0
      local RowItem tempRowItem = 0
      local multiboarditem mbi = null
      local integer rowIndex = this.rowIndexesByRow[whichRow]
      loop
        set tempRowItem = whichRow.rowItemsByIndex[i]
        exitwhen i == COLUMN_COUNT
        set mbi = MultiboardGetItem(this.board, rowIndex, i)
        call MultiboardSetItemValue(mbi, tempRowItem.value)
        call MultiboardSetItemWidth(mbi, tempRowItem.width)
        if tempRowItem.icon != null then
          call MultiboardSetItemIcon(mbi, tempRowItem.icon)
          call MultiboardSetItemStyle(mbi, true, true)
        else
          call MultiboardSetItemStyle(mbi, true, false)
        endif
        call MultiboardReleaseItem(mbi)
        set i = i + 1
      endloop
      set mbi = null
    endmethod

    method updatePersonRow takes Person whichPerson returns nothing
      local Row updatingRow = 0
      local Row teamRow = 0

      if whichPerson.team != 0 then
        //Ensure that this Person's Team row is rendered first 
        if rowsByTeam[whichPerson.team] == 0 then
          call updateTeamRow(whichPerson.team)
        endif
        
        if whichPerson.faction != 0 then
          //Check if the row needs to be created first
          if this.rowsByPerson[whichPerson] == 0 then
            set this.rowsByPerson[whichPerson] = Row.create()
            //Locate the corresponding Team Row's index, register this new Row as a child of the Team Row, and set its Multiboard index in relation to its parents index plus its order as a child
            set teamRow = this.rowsByTeam[whichPerson.team]
            if teamRow != 0 then
              call this.modRowCount(1)
              call teamRow.registerChildRow(this.rowsByPerson[whichPerson])
              call this.setRowIndex(this.rowsByPerson[whichPerson], rowIndexesByRow[teamRow]+teamRow.childRowIndexesByRow[this.rowsByPerson[whichPerson]]+1)
            else
              call BJDebugMsg("Attempted to process multiboard row for player " + GetPlayerName(whichPerson.p) + " but their team has no row")
            endif
          endif

          set updatingRow = this.rowsByPerson[whichPerson]

          call updatingRow.updateRowItem(0, whichPerson.faction.prefixCol + whichPerson.faction.name, whichPerson.faction.icon, WIDTH_FACTION)
          call updatingRow.updateRowItem(1, I2S(whichPerson.controlPoints), null, WIDTH_CP)
          call updatingRow.updateRowItem(2, I2S(R2I(whichPerson.income)), null, WIDTH_INCOME)

          call renderRow(updatingRow)
        else
          set updatingRow = this.rowsByPerson[whichPerson]
          if updatingRow != 0 then
            set rowsByPerson[whichPerson] = 0
            call unrenderRow(updatingRow)
          endif
        endif
      else
        //If the Person is not in a team, delete their Row if they have one
        set updatingRow = this.rowsByPerson[whichPerson]
          if updatingRow != 0 then
            set rowsByPerson[whichPerson] = 0
            call unrenderRow(updatingRow)
          endif
      endif
    endmethod

    method updateTeamRow takes Team whichTeam returns nothing
      local Row updatingRow = 0

      if whichTeam.size > 0 then
        if this.rowsByTeam[whichTeam] == 0 then
          set this.rowsByTeam[whichTeam] = Row.create()
          call this.setRowIndex(this.rowsByTeam[whichTeam], this.rowCount)
          call this.modRowCount(1)
        endif
        
        set updatingRow = this.rowsByTeam[whichTeam]
        call updatingRow.updateRowItem(0, "-------"+whichTeam.name+ SubString("-----------------------------------------", 0, 28-StringLength(whichTeam.name)), null, WIDTH_TEAM)

        call renderRow(updatingRow)
      else
        //Team no longer has any members, so unrender it
        set updatingRow = rowsByTeam[whichTeam]
        if updatingRow != 0 then
          if updatingRow.childCount == 0 then
            set rowsByTeam[whichTeam] = 0
            call unrenderRow(updatingRow)
          else
            call BJDebugMsg("Attempted to unrender the multiboard row belonging to team " + whichTeam.name + " but it still has " + I2S(updatingRow.childCount) + " children")
          endif
        endif
      endif
    endmethod

    private method getRowIndex takes Row whichRow returns integer
      return this.rowIndexesByRow[whichRow]
    endmethod

    private method setRowIndex takes Row whichRow, integer index returns nothing
      if this.rowIndexesByRow[whichRow] != 0 then
        set this.rowsByIndex[rowIndexesByRow[whichRow]] = 0
        set this.rowIndexesByRow[whichRow] = 0
      endif

      if index > -1 then
        //If there was a row where this one wants to be added, bump it down and re-render it recursively
         if this.rowsByIndex[index] != 0 then
          call setRowIndex(rowsByIndex[index], index+1)
          call renderRow(rowsByIndex[index+1])
        endif

        set this.rowIndexesByRow[whichRow] = index
        set this.rowsByIndex[index] = whichRow
      endif
    endmethod

    method modRowCount takes integer value returns nothing
      local integer i = 0
      local multiboarditem mbi = null
      set rowCount = rowCount + value
      if rowCount > 0 then
        call MultiboardSetRowCount(board, rowCount+2) //Extra row to deal with a Blizzard bug, remove it to try it out
        //Delete data on the last row, also should not be necessary
        loop
          exitwhen i == COLUMN_COUNT
          set mbi = MultiboardGetItem(board, rowCount, i)
          call MultiboardSetItemStyle(mbi, false, false)
          set i = i + 1
          call MultiboardReleaseItem(mbi)
        endloop
      else
        call BJDebugMsg("Attempted to reduce multiboard row count to " + I2S(rowCount + value))
      endif
    endmethod

    private method updateHeaderRow takes nothing returns nothing
      local Row updatingRow = 0
      if this.headerRow == 0 then
        set this.headerRow = Row.create()
        call this.setRowIndex(this.headerRow, this.rowCount)
        call this.modRowCount(1)
      endif

      set updatingRow = this.headerRow

      call this.headerRow.updateRowItem(0, "|cffC0C0C0Factions", null, WIDTH_FACTION)
      call this.headerRow.updateRowItem(1, "|cffC0C0C0CP", null, WIDTH_CP)
      call this.headerRow.updateRowItem(2, "|cffC0C0C0Income", null, WIDTH_INCOME)
      
      call this.renderRow(updatingRow)
    endmethod

    //Populate the Multiboard with all current Teams and their Persons
    private method initializeRows takes nothing returns nothing
      local Team tempTeam = 0
      local integer i = 0 
      local integer j = 0
      loop
        set tempTeam = Team.teamsByIndex[i]
        exitwhen tempTeam == 0
        if tempTeam.size > 0 then
          //No need to specify team row creation because Person rows will ensure it themselves
          set j = 0
          loop
            exitwhen j == MAX_PLAYERS //This is done because Team does not store an ordered array of players; update when it does
            if tempTeam.getPersonById(j) != 0 then
              call this.updatePersonRow(tempTeam.getPersonById(j))
            endif
            set j = j + 1
          endloop
        endif
        set i = i + 1
      endloop
    endmethod

    //Creates the multiboard itself and the title row
    private method build takes nothing returns nothing
      set this.board = CreateMultiboardBJ(COLUMN_COUNT, 3, TITLE)
        //General multiboard setup
        call MultiboardSetItemsStyle(this.board, false, false)

      call this.updateHeaderRow()  
      call this.initializeRows()
    endmethod

    static method create takes nothing returns thistype
      local thistype this = thistype.allocate()

      set this.rowsByTeam = Table.create()
      set this.rowsByPerson = Table.create()
      set this.rowIndexesByRow = Table.create()

      call this.build()
      return this     
    endmethod        
  endstruct

  private function OnTeamCreated takes nothing returns nothing
    if Scoreboard != 0 then
      call Scoreboard.updateTeamRow(GetTriggerTeam())
    endif
  endfunction

  private function OnPersonTeamJoined takes nothing returns nothing
    if Scoreboard != 0 then
      call Scoreboard.updatePersonRow(GetTriggerPerson())
      call Scoreboard.updateTeamRow(GetTriggerPerson().team)
    endif
  endfunction

  private function OnPersonTeamLeft takes nothing returns nothing
    if Scoreboard != 0 then 
      call Scoreboard.updatePersonRow(GetTriggerPerson())
      call Scoreboard.updateTeamRow(GetTriggerPersonPrevTeam())
    endif
  endfunction

  private function OnControlPointOwnerChanged takes nothing returns nothing
    local Person tempPerson = 0
    if Scoreboard != 0 then
      set tempPerson = Persons[GetPlayerId(GetTriggerControlPoint().owner)]
      if tempPerson != 0 then
        call Scoreboard.updatePersonRow(tempPerson)
      endif
    endif
  endfunction

  private function OnPersonFactionChanged takes nothing returns nothing
    if Scoreboard != 0 then
      call Scoreboard.updatePersonRow(GetTriggerPerson())
    endif
  endfunction

  private function CreateScoreboard takes nothing returns nothing
    set Scoreboard = Multiboard.create()
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    
    set trig = CreateTrigger()
    call TriggerRegisterTimerEvent(trig, 5, false)
    call TriggerAddAction(trig, function CreateScoreboard)

    set trig = CreateTrigger()
    call OnPersonFactionChange.register(trig)
    call TriggerAddAction(trig, function OnPersonFactionChanged)

    set trig = CreateTrigger()
    call OnControlPointLoss.register(trig)
    call OnControlPointOwnerChange.register(trig)
    call TriggerAddAction(trig, function OnControlPointOwnerChanged)

    set trig = CreateTrigger()
    call OnTeamCreate.register(trig)
    call TriggerAddAction(trig, function OnTeamCreated)

    set trig = CreateTrigger()
    call OnPersonTeamLeave.register(trig)
    call TriggerAddAction(trig, function OnPersonTeamLeft)

    set trig = CreateTrigger()
    call OnPersonTeamJoin.register(trig)
    call TriggerAddAction(trig, function OnPersonTeamJoined)
  endfunction

endlibrary