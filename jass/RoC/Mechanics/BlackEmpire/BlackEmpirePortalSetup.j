library BlackEmpirePortalSetup initializer OnInit requires BlackEmpirePortal

  globals
    BlackEmpirePortal BLACKEMPIREPORTAL_TWILIGHTHIGHLANDS
    BlackEmpirePortal BLACKEMPIREPORTAL_NORTHREND
    BlackEmpirePortal BLACKEMPIREPORTAL_TANARIS
    BlackEmpirePortal BLACKEMPIREPORTAL_ILLIDAN
  endglobals

  private function OnInit takes nothing returns nothing
    set BLACKEMPIREPORTAL_TANARIS = BlackEmpirePortal.create(gg_unit_h03V_0257, gg_dest_OTsp_35728, gg_unit_n07F_1001, "Uldum")
    set BLACKEMPIREPORTAL_TANARIS.NearbyControlPoint = ControlPoint.ByUnitType('n020')

    set BLACKEMPIREPORTAL_TWILIGHTHIGHLANDS = BlackEmpirePortal.create(gg_unit_h03V_0396, gg_dest_OTsp_19293, gg_unit_n07F_1069, "Twilight")
    set BLACKEMPIREPORTAL_TWILIGHTHIGHLANDS.Next = BLACKEMPIREPORTAL_TANARIS
    set BLACKEMPIREPORTAL_TWILIGHTHIGHLANDS.NearbyControlPoint = ControlPoint.ByUnitType('n04V')

    set BLACKEMPIREPORTAL_NORTHREND = BlackEmpirePortal.create(gg_unit_h03V_1110, gg_dest_OTsp_35727, gg_unit_n07F_1101, "Northrend")
    set BLACKEMPIREPORTAL_NORTHREND.Next = BLACKEMPIREPORTAL_TWILIGHTHIGHLANDS
    set BLACKEMPIREPORTAL_NORTHREND.NearbyControlPoint = ControlPoint.ByUnitType('n02S')

    set BLACKEMPIREPORTAL_ILLIDAN = BlackEmpirePortal.create(gg_unit_h03V_0183, gg_dest_OTsp_35732, gg_unit_n07E_0958, "N'zoth")

    set BlackEmpirePortal.Objective = BLACKEMPIREPORTAL_NORTHREND //The first portal that an Obelisk needs to be built at
  endfunction

endlibrary