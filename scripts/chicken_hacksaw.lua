
include "constants.lua"

local base = piece 'base'
local body = piece 'body'
local turret = piece 'turret'
local barrel = piece 'barrel'
local flare = piece 'flare'

local SIG_Aim = 2

local function RestoreAfterDelay()
	Sleep(1000)
    
	Turn(barrel, x_axis, math.rad(0), 3)
	Turn(turret, z_axis, math.rad(0), 3)
end

function script.QueryWeapon(num)
	return flare
end

function script.AimFromWeapon(num)
	return barrel
end

function script.AimWeapon(num, heading, pitch)
	Signal(SIG_Aim)
	SetSignalMask(SIG_Aim)
	
	Turn(barrel, x_axis, -pitch, 6)
	Turn(turret, z_axis, heading, 6)
	WaitForTurn(barrel, x_axis)
	WaitForTurn(turret, y_axis)
	StartThread (RestoreAfterDelay)
	return true
end