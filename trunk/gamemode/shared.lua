TEAM_RED = 1
TEAM_BLUE = 2
team.SetUp(TEAM_RED, "Team Red", Color(255, 0, 0, 255)) -- TEAM RED, It appear in scores
team.SetUp(TEAM_BLUE, "Team Blue", Color(0, 0, 255, 255)) -- TEAM BLUE, It appear in scores

/*---------------------------------------------------------
  Relevant information
---------------------------------------------------------*/

GM.Name 	= "Team Skeleton gamemode v1.2"
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

/*---------------------------------------------------------
   Friendly Fire is off by default
---------------------------------------------------------*/

function GM:PlayerShouldTakeDamage( ply, attacker )
	if attacker:IsPlayer() then
		if ply:Team() == attacker:Team() and attacker != ply then
			return false
		else
			return true
		end
	else
		return true
	end
end