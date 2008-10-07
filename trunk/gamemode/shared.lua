TEAM_RED = 1
TEAM_BLUE = 2
team.SetUp(TEAM_RED, "Team Red Police", Color(255, 0, 0, 255)) -- TEAM RED, In appear in scores eg : "Team Predators", look also the file "INIT.LUA"
team.SetUp(TEAM_BLUE, "Team Blue Barney", Color(0, 0, 255, 255)) -- TEAM BLUE, It appear in scores eg "Team Aliens", look also the file "INIT.LUA"

/*---------------------------------------------------------
  Relevant information
---------------------------------------------------------*/

GM.Name 	= "Team Skeleton gamemode v1.1"
GM.Author 	= "phpmysql"
GM.Email 	= ""
GM.Website 	= ""

/*---------------------------------------------------------
   Map Rotation system By gamerdude, this is the HUD
---------------------------------------------------------*/

function DrawHud()
  	draw.WordBox( 10, ScrW() - 100, ScrH() - 150, "Timeleft: " .. GetGlobalString("MapRotateCountDownFormat"), "Default",Color(0,0,0,100), Color(255,255,255,255))
end
hook.Add("HUDPaint", "HUD_TEST", DrawHud)



