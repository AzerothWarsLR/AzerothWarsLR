library HintConfig initializer OnInit requires Hint

  private function OnInit takes nothing returns nothing
    call Hint.create("任务是完成后会给予奖励的特殊目标。按F9来查看属于你势力的任务。")
    call Hint.create("神器是能够给予较大优势的独特装备。你可以在屏幕左上角的神器菜单内查看神器都在哪。")
    call Hint.create("有些英雄无法被复活，而有些只能在控制了特定首都的情况下才能复活。")
    call Hint.create("如果你FPS较低的话，试着关闭显示生命条。")
    call Hint.create("原作者Lordsebas的Discord讨论组地址 https://discord.gg//4eGZn")
    call Hint.create("当一个玩家离开游戏时，他们的黄金、木头、单位和英雄经验值将分给他们剩余的队友。")
    call Hint.create("在地图的左右两个边缘有水通道，让你可以通过它们快速去到地图的另一边。")
    call Hint.create("每个势力都可以建造包含有用道具的商店。")
    call Hint.create("当你通过任务解锁了一个英雄后，你任然需要在祭坛内召唤他们。")
    call Hint.create("农民不需要返回建筑来获得木材。")
    call Hint.create("所有解锁城市的任务都会在24回合失败，未解锁的城市将转变为野怪。")
    call Hint.create("在大陆之间最方便的方法便是使用回城卷轴。")
    call Hint.create("想支持原作者的话可以去： https://www.patreon.com/lordsebas")
    call Hint.create("在建造的商店内的传送卷轴只能传送自己的建筑，而野外商店内的传送卷轴才能传送队友的建筑。")
    call Hint.create("在小地图上的感叹表标示了任务的目标位置。")
  endfunction

endlibrary