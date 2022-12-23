
include "constants.lua"

local base = piece 'base'
local body = piece 'body'
local turret = piece 'turret'
local barrel = piece 'barrel'
local flare = piece 'flare'

local SIG_Aim = 2

function script.Create()
    Spin(barrel, z_axis, -3)
end

local function RestoreAfterDelay()
	Sleep(1000)
    
	Spin(barrel, z_axis, -3)
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
	WaitForTurn(turret, z_axis)
	StartThread (RestoreAfterDelay)
	return true
end

function script.FireWeapon(num)
    Spin(barrel, z_axis, -10)
	Sleep(800)
	Spin(barrel, z_axis, -3)
end

function script.Killed(recentDamage, maxHealth)
    return 1
end