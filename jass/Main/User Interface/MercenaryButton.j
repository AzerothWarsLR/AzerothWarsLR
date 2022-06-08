 library MercMenu initializer OnInit requires Persons, Faction

  globals
    framehandle MercMenuLauncher
    framehandle MercMenuBackdrop
    framehandle MercMenuExit
  endglobals

  private function LoadToc takes string s returns nothing
    if not BlzLoadTOCFile(s) then
      call BJDebugMsg("Failed to Load TOC: "+s)
    endif	
  endfunction


  private function MercLauncherClick takes nothing returns nothing
  
    call BlzFrameSetEnable(MercMenuLauncher, false)
    call BlzFrameSetEnable(MercMenuLauncher, true)

    if GetLocalPlayer() == GetTriggerPlayer() then
      call SetCameraPosition(GetRectCenterX(gg_rct_MercTavern), GetRectCenterY(gg_rct_MercTavern))
    endif
  endfunction

  private function CreateMercLauncher takes nothing returns nothing
    local trigger trig = null
    local framehandle MercMenuTitle = null

    //Create the launcher button on the main UI
    set MercMenuLauncher = BlzCreateFrame("ScriptDialogButton", BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI,0), 0, 0)
    call BlzFrameSetSize(MercMenuLauncher, 0.1, 0.025)
    call BlzFrameSetAbsPoint(MercMenuLauncher, FRAMEPOINT_CENTER, 0.15, 0.56)
    call BlzFrameSetText(MercMenuLauncher, "Mercs")
    set trig = CreateTrigger()
    call BlzTriggerRegisterFrameEvent(trig, MercMenuLauncher, FRAMEEVENT_CONTROL_CLICK)
    call TriggerAddAction(trig, function MercLauncherClick)
  endfunction


  private function OnInit takes nothing returns nothing
    local trigger trig = null
    local integer i = 0
    call LoadToc("war3mapImported\\ArtifactSystem.toc")
    call LoadToc("ui\\framedef\\framedef.toc")

    call CreateMercLauncher()
    
  endfunction

endlibrary