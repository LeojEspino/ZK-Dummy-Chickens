
include "constants.lua"

local base = piece 'base'
local body = piece 'body' 
local head = piece 'head' 
local larm = piece 'larm'
local rarm = piece 'rarm'
local lleg = piece 'lleg'
local rleg = piece 'rleg'
local lscimitar = piece 'lscimitar'
local rscimitar = piece 'rscimitar'

local step = true
local aiming = false
local swung = false

local SIG_Walk = 2
local SIG_Aim = 4

local function Walk()
    Signal(SIG_Walk)
	SetSignalMask(SIG_Walk)

	while true do
	    if not aiming then
	        Turn(body, x_axis, math.rad(-15), 6)
		    Turn(head, x_axis, math.rad(15), 6)
		    Turn(larm, x_axis, math.rad(45), 12)
		    Turn(larm, y_axis, math.rad(45), 12)
		    Turn(rarm, x_axis, math.rad(-45), 12)
		    Turn(rarm, y_axis, math.rad(-45), 12)
		end
		Turn(lleg, y_axis, math.rad(-15), 12)
		Turn(rleg, y_axis, math.rad(15), 12)
	    if step then
		    if not aiming then
			    Move(body, z_axis, 1, 10)
			    Turn(body, z_axis, math.rad(15), 6)
				Turn(head, y_axis, math.rad(-4), 6)
				Turn(head, z_axis, math.rad(-15), 6)
			end
	        Turn(lleg, x_axis, math.rad(60), 12)
		    Turn(rleg, x_axis, math.rad(-60), 12)
			WaitForTurn(lleg, x_axis)
			if not aiming then
			    Move(body, z_axis, -1, 10)
			end
		    Sleep(200)
			step = false
		else
		    if not aiming then
			    Move(body, z_axis, 1, 10)
			    Turn(body, z_axis, math.rad(-15), 6)
				Turn(head, y_axis, math.rad(4), 6)
				Turn(head, z_axis, math.rad(15), 6)
			end
		    Turn(lleg, x_axis, math.rad(-60), 12)
		    Turn(rleg, x_axis, math.rad(60), 12)
			WaitForTurn(rleg, x_axis)
		    Sleep(200)
			if not aiming then
			    Move(body, z_axis, -1, 10)
			end
			step = true
		end
	end
end

local function StopWalk()
    Signal(SIG_Walk)
	
	if not aiming then
	    Move(body, z_axis, 0, 60)
	    Turn(body, x_axis, math.rad(0), 6)
	    Turn(body, z_axis, math.rad(-45), 6)
	    Turn(head, x_axis, math.rad(0), 6)
	    Turn(head, y_axis, math.rad(0), 6)
	    Turn(head, z_axis, math.rad(45), 6)
        Turn(larm, x_axis, math.rad(0), 12)
	    Turn(larm, y_axis, math.rad(15), 12)
		Turn(larm, z_axis, math.rad(0), 24)
        Turn(rarm, x_axis, math.rad(0), 12)
	    Turn(rarm, y_axis, math.rad(-15), 12)
	    Turn(rarm, z_axis, math.rad(0), 24)
	end
	Turn(lleg, x_axis, math.rad(-15), 12)
	Turn(lleg, y_axis, math.rad(0), 12)
    Turn(rleg, x_axis, math.rad(15), 12)
	Turn(rleg, y_axis, math.rad(0), 12)
end

function script.StartMoving()
	StartThread(Walk)
end

function script.StopMoving()
	StartThread(StopWalk)
end

local function RestoreAfterDelay()
	Sleep(1000)
	aiming = false
    
	Turn(base, z_axis, math.rad(0), 10)
	Move(body, z_axis, 0, 60)
	Turn(body, x_axis, math.rad(0), 6)
	Turn(body, z_axis, math.rad(-45), 6)
	Turn(head, x_axis, math.rad(0), 6)
	Turn(head, y_axis, math.rad(0), 6)
	Turn(head, z_axis, math.rad(45), 6)
    Turn(lleg, x_axis, math.rad(-15), 12)
	Turn(lleg, y_axis, math.rad(0), 12)
    Turn(rleg, x_axis, math.rad(15), 12)
	Turn(rleg, y_axis, math.rad(0), 12)
    Turn(larm, x_axis, math.rad(0), 12)
	Turn(larm, y_axis, math.rad(15), 12)
	Turn(larm, z_axis, math.rad(0), 24)
    Turn(rarm, x_axis, math.rad(0), 12)
	Turn(rarm, y_axis, math.rad(-15), 12)
	Turn(rarm, z_axis, math.rad(0), 24)
end

function script.QueryWeapon(num)
	return sword
end

function script.AimFromWeapon(num)
	return body
end

local function LethalityEdge()
	local x, y, z
	cooldown1 = true
	ability1 = true
	x, y, z = Spring.GetUnitPosition(unitID)
	EmitSfx(body, GG.Script.FIRE_W2)
    Spring.SpawnCEG ("brutal_swing", x, y, z, 10, 1, 1, 1, 0)
	
	Turn(rarm, x_axis, math.rad(0), 30)
    Turn(rarm, y_axis, math.rad(-90), 30)
	Turn(rarm, z_axis, math.rad(0), 30)
	Turn(larm, x_axis, math.rad(0), 30)
	Turn(larm, y_axis, math.rad(90), 30)
	Turn(larm, z_axis, math.rad(0), 30)
	Spin(body, z_axis, 45)
	Sleep(100)
	EmitSfx(body, GG.Script.FIRE_W3)
    Spring.SpawnCEG ("brutal_swing", x, y, z, 10, 1, 1, 1, 0)
	Sleep(200)
	StartThread(RestoreAfterDelay)
	ability1 = false
	
	Spin(body, z_axis, 0)
	Sleep(4700)
	cooldown1 = false
end

function script.AimWeapon(num, heading, pitch)
	Signal(SIG_Aim)
	aiming = true
	
    Turn(base, z_axis, heading, 10)
    Turn(body, x_axis, math.rad(0), 6)
	Turn(head, x_axis, math.rad(0), 6)
	if not cooldown1 then
	    StartThread(LethalityEdge)
		return false
	elseif not swung and not ability1 then
	    SetSignalMask(SIG_Aim)
	    Turn(body, z_axis, math.rad(-90), 12)
		Turn(head, z_axis, math.rad(90), 12)
		Turn(rarm, x_axis, math.rad(0), 12)
		Turn(rarm, y_axis, math.rad(-90), 24)
		Turn(rarm, z_axis, math.rad(-179.9), 24)
		Turn(larm, x_axis, math.rad(0), 12)
	    Turn(larm, y_axis, math.rad(90), 12)
		Turn(larm, z_axis, math.rad(0), 24)
		WaitForTurn(base, z_axis)
		WaitForTurn(body, z_axis)
		WaitForTurn(rarm, y_axis)
		WaitForTurn(rarm, z_axis)
		StartThread(RestoreAfterDelay)
		return true
	elseif swung and not ability1 then
	    SetSignalMask(SIG_Aim)
	    Turn(body, z_axis, math.rad(90), 12)
		Turn(head, z_axis, math.rad(-90), 12)
		Turn(rarm, x_axis, math.rad(0), 12)
		Turn(rarm, y_axis, math.rad(-90), 12)
		Turn(rarm, z_axis, math.rad(0), 24)
		Turn(larm, x_axis, math.rad(0), 12)
		Turn(larm, y_axis, math.rad(90), 24)
		Turn(larm, z_axis, math.rad(-180.1), 24)
		WaitForTurn(base, z_axis)
		WaitForTurn(body, z_axis)
		WaitForTurn(rarm, y_axis)
		WaitForTurn(rarm, z_axis)
		StartThread(RestoreAfterDelay)
		return true
	else
	    return false
	end
end

function script.FireWeapon(num)
    if not swung then
	    swung = true
		Move(body, y_axis, 10, 60)
	    Turn(body, z_axis, math.rad(89.9), 24)
		Turn(head, z_axis, math.rad(-89.9), 24)
		Turn(rarm, x_axis, math.rad(45), 48)
		Sleep(300)
		Move(body, y_axis, 0, 30)
	elseif swung then
	    swung = false
		Move(body, y_axis, 10, 60)
		Turn(body, z_axis, math.rad(-89.9), 24)
		Turn(head, z_axis, math.rad(89.9), 24)
		Turn(larm, x_axis, math.rad(45), 48)
		Sleep(300)
		Move(body, y_axis, 0, 30)
	end
end

function script.Killed(recentDamage, maxHealth)
    Explode(body, SFX.FALL)
	Explode(head, SFX.FALL)
	Explode(larm, SFX.FALL)
	Explode(rarm, SFX.FALL)
	Explode(lleg, SFX.FALL)
	Explode(rleg, SFX.FALL)
	Explode(lscimitar, SFX.FALL)
	Explode(rscimitar, SFX.FALL)
end