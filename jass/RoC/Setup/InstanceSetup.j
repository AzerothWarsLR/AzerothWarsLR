library InstanceSetup requires Instance

  public function OnInit takes nothing returns nothing
    local Instance tempInstance = 0

    set tempInstance = Instance.create()
    set tempInstance.Name = "深穴"
    call tempInstance.addRect(gg_rct_InstanceBarrowDeeps)

    set tempInstance = Instance.create()
    set tempInstance.Name = "扭曲虚空"
    call tempInstance.addRect(gg_rct_TwistingNether)    

    set tempInstance = Instance.create()
    set tempInstance.Name = "厄运之槌"
    call tempInstance.addRect(gg_rct_InstanceDireMaul)      

    set tempInstance = Instance.create()
    set tempInstance.Name = "通灵学院"
    call tempInstance.addRect(gg_rct_InstanceScholomance)         

    set tempInstance = Instance.create()
    set tempInstance.Name = "黑石深渊"
    call tempInstance.addRect(gg_rct_InstanceBlackrock)  

    set tempInstance = Instance.create()
    set tempInstance.Name = "萨格拉斯之墓"
    call tempInstance.addRect(gg_rct_InstanceSargerasTomb)          

    set tempInstance = Instance.create()
    set tempInstance.Name = "艾卓-尼鲁布"
    call tempInstance.addRect(gg_rct_InstanceAzjolNerub)

    set tempInstance = Instance.create()
    set tempInstance.Name = "外域"
    call tempInstance.addRect(gg_rct_InstanceOutland)      

    set tempInstance = Instance.create()
    set tempInstance.Name = "外域"
    call tempInstance.addRect(gg_rct_InstanceNazjatar)      

    set tempInstance = Instance.create()
    set tempInstance.Name = "达拉然地牢"
    call tempInstance.addRect(gg_rct_InstanceDalaranDungeon1)     
    call tempInstance.addRect(gg_rct_InstanceDalaranDungeon2)   
    call tempInstance.addRect(gg_rct_InstanceDalaranDungeon3)                                                                                       
  endfunction

endlibrary