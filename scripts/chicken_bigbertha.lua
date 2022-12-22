
include "constants.lua"

local base = piece 'base'
local body = piece 'body'
local turret = piece 'turret'
local sleeve = piece 'sleeve'
local shell = piece 'shell'
local barrel = piece 'barrel'
local flare = piece 'flare'

local firstshot = true

local SIG_Aim = 2


function script.Create()
    Move(barrel, y_axis, 45, 4500)
end

local function FirstShot()
    Move(shell, y_axis, 40, 50)
	Sleep(28000)
	Move(shell, y_axis, 0, 50)
	Sleep(500)
	Move(barrel, y_axis, 0, 15)
	Sleep(1500)
	firstshot = false
end

local function RestoreAfterDelay()
	Sleep(20000)
    
	Turn(sleeve, z_axis, math.rad(0), 0.25)
	Turn(turret, z_axis, math.rad(0), 0.25)
end

function script.QueryWeapon(num)
	return flare
end

function script.AimFromWeapon(num)
	return sleeve
end

function script.AimWeapon(num, heading, pitch)
    if firstshot then
	    StartThread (FirstShot)
	    return false
	else
	    Signal(SIG_Aim)
	    SetSignalMask(SIG_Aim)
	    
	    Turn(sleeve, z_axis, -pitch, 0.25)
	    Turn(turret, z_axis, heading, 0.25)
	    WaitForTurn(sleeve, z_axis)
	    WaitForTurn(turret, z_axis)
	    StartThread (RestoreAfterDelay)
	return true
	end
end

function script.FireWeapon(num)
    Sleep(1)
	Move(barrel, y_axis, 45, 500)
	Sleep(500)
	Move(shell, y_axis, 40, 50)
	Sleep(10000)
	Move(shell, y_axis, 0, 50)
	Sleep(500)
	Move(barrel, y_axis, 0, 15)
end