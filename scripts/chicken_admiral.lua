
include "constants.lua"

local base = piece 'base'
local body = piece 'body' 
local head = piece 'head' 
local larm = piece 'larm'
local rarm = piece 'rarm'
local lleg = piece 'lleg'
local rleg = piece 'rleg'
local lgun = piece 'lgun'
local rgun = piece 'rgun'
local lplane = piece 'lplane'
local rplane = piece 'rplane'
local flare1 = piece 'flare1'
local flare2 = piece 'flare2'
local flare3 = piece 'flare3'
local flare4 = piece 'flare4'

local step = true
local aiming = false
local shot0 = true
local shot1 = false
local shot2 = false
local shot3 = false
cooldown = false

local SIG_Walk = 2
local SIG_Aim = 4
local SIG_Air = 8

local function Walk()
    Signal(SIG_Walk)
	SetSignalMask(SIG_Walk)

	while true do
	    if not aiming then
	        Turn(body, x_axis, math.rad(-15), 6)
		    Turn(head, x_axis, math.rad(15), 6)
		end
	    if step then
		    if not aiming then
			    Move(body, z_axis, 1, 10)
			end
			if not aiming then
			    Move(body, z_axis, -1, 10)
			end
		    Sleep(500)
			step = false
		else
		    if not aiming then
			    Move(body, z_axis, 1, 10)
			end
		    Sleep(500)
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
	    Turn(base, z_axis, math.rad(0), 10)
	    Move(body, z_axis, 0, 60)
		Turn(body, x_axis, math.rad(0), 6)
		Turn(head, x_axis, math.rad(0), 6)
	end
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
end

function script.QueryWeapon(num)
    if num == 1 and shot0 then
	    return flare1
	elseif num == 1 and shot1 then
	    return flare2
	elseif num == 1 and shot2 then
	    return flare3
	elseif num == 1 and shot3 then
	    return flare4
    elseif num == 2 then
	    return lgun
	elseif num == 3 then
		return rgun
	elseif num == 4 then
	    return body
	end
end

function script.AimFromWeapon(num)
	return body
end

local function AirSupport()
    SetSignalMask(SIG_Air)
    cooldown = true
    EmitSfx(lplane, GG.Script.FIRE_W4)
	EmitSfx(rplane, GG.Script.FIRE_W4)
	Sleep(6000)
	cooldown = false
end

function script.AimWeapon(num, heading, pitch)
	Signal(SIG_Aim)
	SetSignalMask(SIG_Aim)
	aiming = true
    if not cooldown then
	    StartThread(AirSupport)
	end
	if num == 4 then
	    return false
	end
	
    Turn(base, z_axis, heading, 10)
    Turn(body, x_axis, math.rad(0), 6)
	Turn(head, x_axis, math.rad(0), 6)
	WaitForTurn(base, z_axis)
	StartThread(RestoreAfterDelay)
	return true
end


function script.FireWeapon(num)
    if num == 1 and shot0 then
	    Sleep(1)
		shot0 = false
		shot1 = true
	elseif num == 1 and shot1 then
	    Sleep(1)
		shot1 = false
		shot2 = true
	elseif num == 1 and shot2 then
	    Sleep(1)
		shot2 = false
		shot3 = true
	elseif num == 1 and shot3 then
	    Sleep(1)
		shot3 = false
		shot0 = true
	end
    if num == 2 or num == 3 then
	    Move(body, y_axis, -10, 60)
	    Sleep(150)
	    Move(body, y_axis, 0, 30)
	    Sleep(150)
	    Move(body, y_axis, -10, 60)
	    Sleep(150)
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
end