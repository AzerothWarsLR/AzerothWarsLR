library PathWindow initializer OnInit

  private function LoadToc takes string s returns nothing
    if not BlzLoadTOCFile(s) then
      call BJDebugMsg("Failed to Load TOC: "+s)
    endif	
  endfunction

  private function CreateTestFrame takes nothing returns nothing
    local framehandle testFrame = BlzCreateFrame("PathBackdrop", BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0), 0, 0)
    local framehandle picture = BlzCreateFrame("PathBackdrop", testFrame, 0, 0)
    local framehandle desc = BlzCreateFrame("PathDescriptionBackdrop", picture, 0, 0)
    call BlzFrameSetSize(testFrame, 0.7, 0.37)
    call BlzFrameSetAbsPoint(testFrame, FRAMEPOINT_CENTER, 0.4, 0.38)
    call BlzFrameSetVisible(testFrame, true)

    call BlzFrameSetSize(picture, 0.65, 0.3)
    call BlzFrameSetAbsPoint(picture, FRAMEPOINT_CENTER, 0.4, 0.38)
    call BlzFrameSetVisible(picture, true)
    call BlzFrameSetTexture(picture, "war3mapImported\\Untitled.blp", 0, false)

    call BlzFrameSetPoint(desc, FRAMEPOINT_TOP, testFrame, FRAMEPOINT_TOP, 0, -0.2)   
    call BlzFrameSetPoint(desc, FRAMEPOINT_BOTTOMLEFT, testFrame, FRAMEPOINT_BOTTOMLEFT, 0.15, 0.06)    
    call BlzFrameSetPoint(desc, FRAMEPOINT_BOTTOMRIGHT, testFrame, FRAMEPOINT_BOTTOMRIGHT, -0.15, 0.06)  
    call BlzFrameSetText(desc, "Embrace the Bloodpact!")
  endfunction

  private function OnInit takes nothing returns nothing
    call LoadToc("war3mapImported\\PathMenu.toc")
    call CreateTestFrame()
  endfunction

endlibrary