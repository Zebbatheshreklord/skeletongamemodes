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

/*---------------------------------------------------------
   Show playername & health by haloshadow (not tested)
---------------------------------------------------------*/

function DoESP( )
	for _, pl in pairs(player.GetAll()) do
		local pos = pl:GetPos()
		local mypos = self:GetPos()
		local size = ScrW() * 0.02
				pos.z = pos.z + 80
		pos = pos:ToScreen()
		if pl:Team() == self:Team() then
			if pl:Alive() then
				if (math.floor(pl:GetPos():Distance(mypos)) <= 1500) then
					draw.SimpleText(pl:Name(), "ESPSmall", pos.x, pos.y + size + 10, Color(50,255,50,150), TEXT_ALIGN_CENTER)
					draw.SimpleText("Health: "..pl:Health(), "ESPSmall", pos.x, pos.y-10 + size + 30, Color(50,255,255,150), TEXT_ALIGN_CENTER)
				end
			end
		end
		if pl:Team() != self:Team() then
			if pl:Alive() then
				if (math.floor(pl:GetPos():Distance(mypos)) <= 1500) then
					draw.SimpleText(pl:Name(), "ESPSmall", pos.x, pos.y + size + 10, Color(255,50,50,150), TEXT_ALIGN_CENTER)
					draw.SimpleText("Health: "..pl:Health(), "ESPSmall", pos.x, pos.y-10 + size + 30, Color(50,255,255,150), TEXT_ALIGN_CENTER)
				end
			end
		end
	end
end
hook.Add("HUDPaint","ESP",DoESP)

