//When Stratholme dies, Arthas is removed, Garithos is spawned, and EventArthasExpedition begins.

library EventGarithosSpawn initializer OnInit requires EventArthasExpedition

  private function GarithosSpawn takes nothing returns nothing
    local unit arthas = gg_unit_Hart_1342
    local unit garithos = null
    local real x = 10597
    local real y = 3228
    local Person tempPerson = PersonsByFaction[FACTION_LORDAERON]
    local player p = tempPerson.p
    local integer i = 0
    call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Arthas has set sail to Northrend to find Frostmourne. Disgusted by Arthas' abandonment, Lord Garithos has stepped up and formed a large resistance force near Dalaran to purge the inhuman beasts in Lordaeron.")            
    set garithos = CreateUnit(p, 'Hlgr', x, y, 270)      //Garithos

    call SetHeroXP(garithos, GetHeroXP(arthas), false)
    //Transfer items to Garithos
    loop
    exitwhen i > 6
        call UnitAddItem(garithos, UnitItemInSlot(arthas, i))
        set i = i + 1
    endloop        

    set i = 0
    loop
    exitwhen i > 12
        call CreateUnit(p, 'n03K', x, y, 270)   //Chaplain
        call CreateUnit(p, 'nchp', x, y, 270)   //Cleric
        call CreateUnit(p, 'h01C', x, y, 270)   //Longbowman
        call CreateUnit(p, 'hkni', x, y, 270)   //Knight
        call CreateUnit(p, 'hkni', x, y, 270)   //Knight
        set i = i + 1
    endloop

    set i = 0
    loop
    exitwhen i > 4
        call CreateUnit(p, 'hpea', x, y, 270)   //Peasant
        set i = i + 1
    endloop   

    call RemoveUnit(arthas)

    //Cleanup
    set arthas = null
    set garithos = null
  endfunction

  private function Dies takes nothing returns nothing
    local Person lordaeron = PersonsByFaction[FACTION_LORDAERON]
    if not IsUnitAliveBJ(gg_unit_h000_0406) and not IsUnitAliveBJ(gg_unit_h01G_0885) and not IsUnitAliveBJ(gg_unit_h030_0839) then
      if lordaeron != 0 then
        call GarithosSpawn()
      endif
      call DoArthasExpedition()
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    call TriggerRegisterUnitEvent( trig, gg_unit_h000_0406, EVENT_UNIT_DEATH )  //Capital Palace
    call TriggerRegisterUnitEvent( trig, gg_unit_h01G_0885, EVENT_UNIT_DEATH )  //Stratholme
    call TriggerRegisterUnitEvent( trig, gg_unit_h030_0839, EVENT_UNIT_DEATH )  //Tyr's Hand Citadel
    call TriggerAddCondition( trig, Condition(function Dies) )
  endfunction

endlibrary