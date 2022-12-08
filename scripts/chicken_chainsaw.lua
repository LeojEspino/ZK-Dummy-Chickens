
include "constants.lua"

local base = piece 'base'
local body = piece 'body'
local turret = piece 'turret'
local barrel = piece 'barrel'
local lgun = piece 'lgun'
local rgun = piece 'rgun'
local lflare = piece 'lflare'
local rflare = piece 'rflare'

local shot = false

local SIG_Aim = 2

local function RestoreAfterDelay()
	Sleep(1000)
    
	Turn(barrel, x_axis, math.rad(0), 6)
	Turn(turret, z_axis, math.rad(0), 6)
	Spin(lgun, z_axis, 12)
	Spin(rgun, z_axis, 12)
	Sleep(1000)
	Spin(lgun, z_axis, 6)
	Spin(rgun, z_axis, 6)
	Sleep(1000)
	Spin(lgun, z_axis, 4)
	Spin(rgun, z_axis, 4)
	Sleep(1000)
	Spin(lgun, z_axis, 2)
	Spin(rgun, z_axis, 2)
	Sleep(1000)
	Spin(lgun, z_axis, 1)
	Spin(rgun, z_axis, 1)
	Sleep(1000)
	Spin(lgun, z_axis, 0)
	Spin(rgun, z_axis, 0)
end

function script.QueryWeapon(num)
    if not shot then
	    return rflare
	else
	    return lflare
	end
end

function script.AimFromWeapon(num)
	return barrel
end

function script.AimWeapon(num, heading, pitch)
	Signal(SIG_Aim)
	SetSignalMask(SIG_Aim)
	
	Turn(barrel, x_axis, -pitch, 6)
	Turn(turret, z_axis, heading, 6)
	Spin(lgun, z_axis, 18)
	Spin(rgun, z_axis, 18)
	WaitForTurn(barrel, x_axis)
	WaitForTurn(turret, y_axis)
	StartThread (RestoreAfterDelay)
	return true
end

function script.FireWeapon(num)
    if not shot then
	    Sleep(1)
	    shot = true
	else
	    Sleep(1)
	    shot = false
	end
end