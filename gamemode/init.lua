AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function GM:PlayerInitialSpawn(ply)
  if team.NumPlayers(TEAM_BLUE) <= team.NumPlayers(TEAM_RED) then
    ply:SetTeam(TEAM_BLUE)
  else
    ply:SetTeam(TEAM_RED)
  end
  self.BaseClass:PlayerInitialSpawn(ply)
end
 
function GM:PlayerLoadout(ply)
  return
end

/*---------------------------------------------------------
   Weapons & playermodels system when you start the game by phpmysql
---------------------------------------------------------*/

function GM:PlayerSpawn(ply)
  self.BaseClass:PlayerSpawn(ply)
  if ply:Team() == TEAM_BLUE then
  --- START BLUE TEAM---
	local randomblue = math.random(1,4)
	if randomblue == 1 then
    ply:SetModel("models/player/barney.mdl") -- BLUE DEFAULT PLAYERMODEL eg:  models/player/barney.mdl
	ply:SetHealth(100) -- -- DEFAULT  HEALTH,RUNSPEED AND WALKSPEED BLUE TEAM
	ply:SetRunSpeed(700) 
	ply:SetWalkSpeed(400)
    ply:Give("weapon_smg1") --- WEAPONS FOR THE TEAM BLUE eg: ply:Give("weapon_pistol")  ply:Give("weapon_crowbar") 
	ply:GiveAmmo( 64,"SMG1",true ) --- AMMO FOR THE WEAPON
	elseif randomblue == 2 then
	ply:SetModel("models/player/kleiner.mdl") -- BLUE DEFAULT PLAYERMODEL eg:  models/player/kleiner.mdl
	ply:SetHealth(100) -- -- DEFAULT  HEALTH,RUNSPEED AND WALKSPEED BLUE TEAM
	ply:SetRunSpeed(700) 
	ply:SetWalkSpeed(400)
    ply:Give("weapon_shotgun") --- WEAPONS FOR THE TEAM BLUE eg: ply:Give("weapon_pistol")  ply:Give("weapon_crowbar") 
	ply:GiveAmmo( 64,"Buckshot",true ) --- AMMO FOR THE WEAPON
	elseif randomblue == 3 then
	ply:SetModel("models/player/mossman.mdl") -- BLUE DEFAULT PLAYERMODEL eg:  models/player/mossman.mdl
	ply:SetHealth(100) -- -- DEFAULT  HEALTH,RUNSPEED AND WALKSPEED BLUE TEAM
	ply:SetRunSpeed(700) 
	ply:SetWalkSpeed(400)
    ply:Give("weapon_ar2") --- WEAPONS FOR THE TEAM BLUE eg: ply:Give("weapon_pistol")  ply:Give("weapon_crowbar") 
	ply:GiveAmmo( 64,"AR2",true ) --- AMMO FOR THE WEAPON
    elseif randomblue == 4 then
	ply:SetModel("models/player/alyx.mdl") -- BLUE DEFAULT PLAYERMODEL eg:  models/player/alyx.mdl
	ply:SetHealth(100) -- -- DEFAULT  HEALTH,RUNSPEED AND WALKSPEED BLUE TEAM
	ply:SetRunSpeed(700) 
	ply:SetWalkSpeed(400)
    ply:Give("weapon_pistol") -- WEAPONS FOR THE TEAM blue eg: ply:Give("weapon_shotgun")  ply:Give("weapon_crowbar") 
	ply:GiveAmmo( 256,"Pistol",true ) -- AMMO FOR THE WEAPON
	end
  --- END BLUE TEAM---
  else
  --- START RED TEAM---
 local randomred = math.random(1,4)
	if randomred == 1 then
    ply:SetModel("models/player/combine_soldier.mdl") -- RED DEFAULT PLAYERMODEL eg:  models/player/combine_soldier.mdl
	ply:SetHealth(100) -- -- DEFAULT  HEALTH,RUNSPEED AND WALKSPEED red TEAM
	ply:SetRunSpeed(700) 
	ply:SetWalkSpeed(400)
    ply:Give("weapon_smg1") --- WEAPONS FOR THE TEAM RED eg: ply:Give("weapon_pistol")  ply:Give("weapon_crowbar") 
	ply:GiveAmmo( 64,"SMG1",true ) --- AMMO FOR THE WEAPON
	elseif randomred == 2 then
	ply:SetModel("models/player/combine_soldier_prisonguard.mdl") -- red DEFAULT PLAYERMODEL eg:  models/player/combine_soldier_prisonguard.mdl
	ply:SetHealth(100) -- -- DEFAULT  HEALTH,RUNSPEED AND WALKSPEED red TEAM
	ply:SetRunSpeed(700) 
	ply:SetWalkSpeed(400)
    ply:Give("weapon_shotgun") --- WEAPONS FOR THE TEAM RED eg: ply:Give("weapon_pistol")  ply:Give("weapon_crowbar") 
	ply:GiveAmmo( 64,"Buckshot",true ) --- AMMO FOR THE WEAPON
	elseif randomred == 3 then
	ply:SetModel("models/player/combine_super_soldier.mdl") -- red DEFAULT PLAYERMODEL eg:  models/player/combine_super_soldier.mdl
	ply:SetHealth(100) -- -- DEFAULT  HEALTH,RUNSPEED AND WALKSPEED red TEAM
	ply:SetRunSpeed(700) 
	ply:SetWalkSpeed(400)
    ply:Give("weapon_ar2") --- WEAPONS FOR THE TEAM RED eg: ply:Give("weapon_pistol")  ply:Give("weapon_crowbar") 
	ply:GiveAmmo( 64,"AR2",true ) --- AMMO FOR THE WEAPON
    elseif randomred == 4 then
	ply:SetModel("models/player/police.mdl") -- RED DEFAULT PLAYERMODEL eg:  models/player/police.mdl
	ply:SetHealth(100) -- -- DEFAULT  HEALTH,RUNSPEED AND WALKSPEED RED TEAM
	ply:SetRunSpeed(700) 
	ply:SetWalkSpeed(400)
    ply:Give("weapon_pistol") -- WEAPONS FOR THE TEAM RED eg: ply:Give("weapon_shotgun")  ply:Give("weapon_crowbar") 
	ply:GiveAmmo( 256,"Pistol",true ) -- AMMO FOR THE WEAPON
	end
    --- END RED TEAM---
  end
end

/*---------------------------------------------------------
   Text when you chose another team
---------------------------------------------------------*/

function GM:KeyPress(p, key) 
	if ( key == IN_SPEED ) then 
		if ( p:Team( )== TEAM_BLUE ) then
		p:SetTeam( TEAM_RED )
		p:Kill( )
		p:PrintMessage(HUD_PRINTTALK,"you don't want to be in the team red? Press 'SHIFT' to be one again!"); -- eg: Aliens (blue)
		p:SprintEnable ()
		p:AddFrags(1)
		else
		p:SetTeam( TEAM_BLUE )
		p:Kill( )
		p:PrintMessage(HUD_PRINTTALK,"you don't want to be in the team blue? Press 'SHIFT' to be one again!"); -- eg: Predator(red)
		p:SprintDisable ()
		p:AddFrags(1)
		end
	end
	self.BaseClass:KeyPress(p, key)
end

/*---------------------------------------------------------
   Text when you start the game
---------------------------------------------------------*/

function GM:PlayerInitialSpawn( pl )
	
	pl:PrintMessage(HUD_PRINTCENTER,"Welcome to team BLUE Vs RED!");  -- eg: Welcome to the game Alien Vs.  Predator!
	
	if (team.NumPlayers (TEAM_BLUE)) < (team.NumPlayers (TEAM_RED)) then
	pl:SetTeam( TEAM_BLUE )
	pl:PrintMessage(HUD_PRINTTALK,"You're in the team blue. Press 'SHIFT' to be in the team red!"); -- eg: Aliens (blue)
	pl:SprintDisable ()

	else
	
	pl:SetTeam( TEAM_RED )
	pl:PrintMessage(HUD_PRINTTALK,"You're in the team red. Press 'SHIFT' to be in the team blue!"); -- eg: Predators (red)

	end
	



end

/*---------------------------------------------------------
   Player Spawn is counter strike spawn points by blackops
---------------------------------------------------------*/

function GM:PlayerSelectSpawn(pl)
	if self.redSpawns == nil then
		self.redSpawns = table.Add(self.redSpawns,ents.FindByClass("info_player_terrorist"))
	end
	if self.blueSpawns == nil then
		self.blueSpawns = table.Add(self.blueSpawns,ents.FindByClass("info_player_counterterrorist"))
	end
	
	local numSpwn = 0
	local cSpawnList = nil
	if pl:Team() == TEAM_BLUE then
		cSpawnList = self.blueSpawns
	else
		cSpawnList = self.redSpawns
	end
	
	numSpwn = table.Count(cSpawnList)
	if numSpwn == 0 then
		Msg("PlayerSelectSpawn error: no spawn available\n")
		return nil
	end
	
	local ChosenSpawnPoint = nil
	
	for i=0,6 do
		ChosenSpawnPoint = cSpawnList[math.random(1,numSpwn)]
		if ChosenSpawnPoint && ChosenSpawnPoint:IsValid() && ChosenSpawnPoint:IsInWorld() && ChosenSpawnPoint != pl:GetVar( "LastSpawnpoint" ) then	
			pl:SetVar( "LastSpawnpoint", ChosenSpawnPoint )
			return ChosenSpawnPoint
		end
	end
	return ChosenSpawnPoint
end


/*---------------------------------------------------------
   Map Rotation system By gamerdude
---------------------------------------------------------*/

local mRotateTimeLeft=3600 --this is the round time in seconds (3600= 1 hr)
mapsList={"gm_construct"} -- ie. mapsList={"gm_construct","gm_flatgrass"}
timeWarnings={}
timeWarnings[900]="15 Minute Warning!" --  this is the time warnings
timeWarnings[5]="5"
timeWarnings[4]="4"
timeWarnings[3]="3"
timeWarnings[2]="2"
timeWarnings[1]="1"

if(SERVER) then
function nextMap()
	cMapName=string.lower(game.GetMap())
	cMapID=1
	nMap="gm_construct"

	for k,v in pairs(mapsList) do
		if(string.lower(v)==cMapName) then
			cMapID=k
			if(k==table.Count(mapsList)) then
				nMap=mapsList[1]
			else
				nMap=mapsList[k+1]
			end
		end
	end
	
	return nMap
end
function MapRotate()
	local nMap=nextMap()
	game.ConsoleCommand("changelevel " .. nMap .. "\n")
end

function setcountdown()
	if(GetGlobalInt("MapRotateCountDown")<1) then
		MapRotate()
		return
	end
	local cTime=GetGlobalInt("MapRotateCountDown")-1
	SetGlobalInt("MapRotateCountDown",cTime)
	SetGlobalString("MapRotateCountDownFormat", SecondsToFormat(cTime))
	if(timeWarnings[cTime]!=null) then
		for k,v in pairs(player.GetAll()) do
			v:PrintMessage(HUD_PRINTCENTER, timeWarnings[cTime])
		end
	end
end

function SecondsToFormat( secs )
	local hours=math.floor(secs/60/60)
	local mins=math.floor(secs/60)
	local seconds=0
	local timeleft=""
	if not(hours==0) then
		timeleft=hours .. ":"
	end
	if not(mins==0) then
		timeleft=timeleft .. mins .. ":"
	else
		timeleft=timeleft .. "00:"
	end
	seconds=secs - (hours*3600) - (mins*60)
	if (seconds<10) then
		seconds="0" .. seconds
	end
	timeleft=timeleft .. seconds
	
	return timeleft
end

timeWarnings[7]="Switching to " .. nextMap() .. " in..."
SetGlobalInt("MapRotateCountDown",mRotateTimeLeft)
SetGlobalString("MapRotateCountDownFormat", SecondsToFormat(mRotateTimeLeft))
timer.Create("MapRotateCountDown", 1, 0, setcountdown)
end