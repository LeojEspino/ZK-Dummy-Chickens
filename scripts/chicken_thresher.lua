
include "constants.lua"

local base = piece 'base'
local body = piece 'body'
local a1 = piece 'a1'
local a2 = piece 'a2'
local a3 = piece 'a3'
local turret = piece 'turret'
local barrel = piece 'barrel'
local flare = piece 'flare'

local SIG_Aim = 2

local function RestoreAfterDelay()
	Sleep(1000)
    
	Move(a2, z_axis, 0, 3)
	Move(a3, z_axis, 0, 3)
	Turn(a3, z_axis, math.rad(0), 3)
	Turn(turret, x_axis, math.rad(0), 3)
end

function script.QueryWeapon(num)
	return flare
end

function script.AimFromWeapon(num)
	return turret
end

function script.AimWeapon(num, heading, pitch)
	Signal(SIG_Aim)
	SetSignalMask(SIG_Aim)
    
	Move(a2, z_axis, 10, 15)
	Move(a3, z_axis, 10, 15)
	Turn(a3, z_axis, heading, 6)
	Turn(turret, x_axis, -pitch, 6)
	WaitForTurn(a3, z_axis)
	WaitForTurn(turret, x_axis)
	StartThread (RestoreAfterDelay)
	return true
end

function script.FireWeapon(num)
    Move(barrel, y_axis, 20, 1000)
	Sleep(100)
	Move(barrel, y_axis, 0, 10)
end