library TeamSetup requires Team

  globals
    Team TEAM_LEGION
    Team TEAM_ALLIANCE
    Team TEAM_HORDE
    Team TEAM_NIGHT_ELVES
    Team TEAM_NAGA
    Team TEAM_GILNEAS
    Team TEAM_SCARLET
    Team TEAM_FORSAKEN
    Team TEAM_OLDGOD
    Team TEAM_SCOURGE
    Team TEAM_DRAENEI
    Team TEAM_KULTIRAS
    Team TEAM_ZANDALAR
  endglobals

  public function OnInit takes nothing returns nothing 
    //Starting teams
    local Team t = 0

    set TEAM_ALLIANCE = Team.create("联盟")
    set TEAM_ALLIANCE.VictoryMusic = "史诗胜利"

    set TEAM_LEGION = Team.create("燃烧军团")
    set TEAM_LEGION.VictoryMusic = "黑暗胜利"

    set TEAM_HORDE = Team.create("部落")
    set TEAM_HORDE.VictoryMusic = "黑暗胜利"

    set TEAM_NIGHT_ELVES = Team.create("暗夜精灵")
    set TEAM_NIGHT_ELVES.VictoryMusic = "史诗胜利"

    set TEAM_OLDGOD = Team.create("古神")
    set TEAM_OLDGOD.VictoryMusic = "黑暗胜利"

    set TEAM_NAGA = Team.create("伊利达雷")
    set TEAM_NAGA.VictoryMusic = "黑暗胜利"

    set TEAM_GILNEAS = Team.create("吉尔尼斯")
    set TEAM_GILNEAS.VictoryMusic = "史诗胜利"

    set TEAM_DRAENEI = Team.create("德莱尼")
    set TEAM_DRAENEI.VictoryMusic = "史诗胜利"

    set TEAM_KULTIRAS = Team.create("库尔提拉斯")
    set TEAM_KULTIRAS.VictoryMusic = "史诗胜利"

    set TEAM_ZANDALAR = Team.create("赞达拉")
    set TEAM_ZANDALAR.VictoryMusic = "史诗胜利"

    set TEAM_SCARLET = Team.create("血色十字军")
    set TEAM_SCARLET.VictoryMusic = "黑暗胜利"
 
    set TEAM_FORSAKEN = Team.create("被遗忘者")
    set TEAM_FORSAKEN.VictoryMusic = "黑暗胜利"

    set TEAM_SCOURGE = Team.create("诺森德")
    set TEAM_SCOURGE.VictoryMusic = "黑暗胜利"
  endfunction

endlibrary