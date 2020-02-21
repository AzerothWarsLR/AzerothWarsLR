library EventKelthuzadLich initializer OnInit requires EventKelthuzadDeath, QuelthalasConfig

  private function CreateLich takes nothing returns nothing
    local unit Necromancer = GetTriggerUnit()
    local unit Lich = null
    local item tempItem = null
    local integer i = 0

    call PlayThematicMusicBJ( "Sound\\Music\\mp3Music\\LichKingTheme.mp3" )
    set Lich = CreateUnit(GetOwningPlayer(GetTriggerUnit()), 'Uktl', 18560, 21261, 270) 
    if GetUnitTypeId(GetTriggerUnit()) == 'U001' then   //Normal necromancer
      call SetHeroXP(Lich, GetHeroXP(GetTriggerUnit()), false)
    else                                                //Ghost
      call SetHeroXP(Lich, KelthuzadExp, false)
    endif
    loop
    exitwhen i > 6
      call UnitAddItem(Lich, UnitItemInSlot(Necromancer, i))
      set i = i + 1
    endloop
    call RemoveUnit(GetTriggerUnit())
    call DisplayTextToForce( GetPlayersAll(), "Kel'Thuzad has been reincarnated as a Lich through the magical powers of the Sunwell." )
    //Cleanup
    set Necromancer = null
    set Lich = null     
    set tempItem = null 
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function EntersRegion takes nothing returns nothing
    local Person triggerPerson = Persons[GetPlayerId(GetOwningPlayer(gg_unit_n001_0165))]
    local Person scourgePerson = PersonsByFaction[FACTION_SCOURGE]
    if (GetUnitTypeId(GetTriggerUnit()) == 'U001' or GetUnitTypeId(GetTriggerUnit()) == 'uktg') and triggerPerson.team.containsPlayer(scourgePerson.p) then
      call CreateLich()
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterEnterRectSimple(trig, gg_rct_Sunwell)
    call TriggerAddCondition(trig, Condition(function EntersRegion))                
  endfunction

endlibrary