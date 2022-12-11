
include "constants.lua"

local base = piece 'base'
local body = piece 'body'
local turret = piece 'turret'
local barrel = piece 'barrel'
local shell = piece 'shell'
local rshell = piece 'rshell'
local lshell = piece 'lshell'
local flare = piece 'flare'

local SIG_Aim = 2

local function RestoreAfterDelay()
	Sleep(2000)
    
	Turn(flare, x_axis, math.rad(0), 3)
	Turn(turret, z_axis, math.rad(0), 3)
	Move(shell, y_axis, 0, 10)
	Move(rshell, x_axis, 0, 10)
	Move(lshell, x_axis, 0, 10)
end

function script.QueryWeapon(num)
	return flare
end

function script.AimFromWeapon(num)
	return flare
end

function script.AimWeapon(num, heading, pitch)
	Signal(SIG_Aim)
	SetSignalMask(SIG_Aim)
	
	Turn(flare, x_axis, -pitch, 6)
	Turn(turret, z_axis, heading, 6)
	Move(shell, y_axis, 10, 60)
	Move(rshell, x_axis, -10, 60)
	Move(lshell, x_axis, 10, 60)
	WaitForTurn(barrel, x_axis)
	WaitForTurn(turret, y_axis)
	StartThread (RestoreAfterDelay)
	return true
end

function script.FireWeapon(num)
    Move(barrel, y_axis, 200, 200)
    Sleep(100)
    Move(barrel, y_axis, 0, 10)
end