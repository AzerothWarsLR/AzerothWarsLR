library TestSafety initializer OnInit
    
    globals
        private constant boolean IS_TEST_VERSION = true  //Change this to true for live release
        boolean AreCheatsActive = true
        private boolean IsAdminPresent
    endglobals

    private function Warning takes nothing returns nothing
        call DisplayTextToForce(GetPlayersAll(), "This map is in test mode amd contains |cffD27575CHEATS|r.")
        call DisplayTextToForce(GetPlayersAll(), "To use these |cffD27575CHEATS|r, refer to the Quest menu.")
    endfunction

    private function Quests takes nothing returns nothing
        call CreateQuestBJ( bj_QUESTTYPE_REQ_DISCOVERED, "Test Commands", " - gold x|n - lumber x|n - food x|n - tele on/off (use patrol to teleport anywhere on the map instantly)|n - build on/off (press cancel on a building to finish its progress instantly)|n - nocd on/off (instant refresh cds)|n - mana on/off (instant refund all mana)|n - unlock (unlocks all Path requirements)|n - god on/off (deal 100x damage, take no damage)|n - vision on/off (reveal entire map)|n - time xx (set time of day)|n - control xx (take shared control of player xx)|n - level xx (set level of selected units)|n - hp xx (set health of selected units)|n - mp xx|n - remove (remove selected units)|n - faction <text> (change faction to entered string)|n - team <text> (change team to entered string)|n - owner xx (transfer selected units to player xx)|n - spawn yyyy xx (spawns xx instances of unit or item yyyy, uses rawcodes)|n - kick xx (causes player xx to psuedo-leave, and lose faction and team)|n", "ReplaceableTextures\\CommandButtons\\BTNStaffOfTeleportation.blp" )
    endfunction
    
    private function OnInit takes nothing returns nothing  
        local trigger trig = null
        local integer i = 0
        local integer userCount = 0

        set IsAdminPresent = not IS_TEST_VERSION

        set i = 0
        loop
        exitwhen i == MAX_PLAYERS or IsAdminPresent == true
          if GetPlayerName(Player(i)) == "krur" or GetPlayerName(Player(i)) == "YakaryBovine" or GetPlayerName(Player(i)) == "Talinn" or GetPlayerName(Player(i)) == "lordsebas" or GetPlayerName(Player(i)) == "WorldEdit" then
            set IsAdminPresent = true
          endif
          set i = i + 1
        endloop
        
        set i = 0
        loop
        exitwhen i == MAX_PLAYERS or AreCheatsActive == false or IS_TEST_VERSION == true
            if GetPlayerController(Player(i)) == MAP_CONTROL_USER and GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
                set userCount = userCount + 1
                if userCount > 1 then
                    set AreCheatsActive = false
                endif
            endif 
            set i = i + 1
        endloop

        if AreCheatsActive == true then
            call Quests()
            set trig = CreateTrigger()
            call TriggerRegisterTimerEvent(trig, 200., true)
            call TriggerAddCondition(trig, Condition(function Warning))
        else
            loop
            exitwhen i == MAX_PLAYERS
              call CustomDefeatBJ(Player(i), "This is a test version only")
            endloop
        endif
         
    endfunction    

endlibrary