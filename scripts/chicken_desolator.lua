
include "constants.lua"

local base = piece 'base'
local body = piece 'body'
local turret = piece 'turret'
local barrel = piece 'barrel'
local lbarrel = piece 'lbarrel'
local rbarrel = piece 'rbarrel'
local lflare = piece 'lflare'
local rflare = piece 'rflare'
local lshell = piece 'lshell'
local rshell = piece 'rshell'
local armorValue = UnitDefs[unitDefID].armoredMultiple

local shot = false
local on = true

local SIG_Aim = 2
local open = 4
local close = 8

local function Open()
    Signal(close)
	SetSignalMask(open)
	
	GG.SetUnitArmor(unitID, 1.0)
	
	Move(rshell, x_axis, 0, 5)
	Move(lshell, x_axis, 0, 5)
	WaitForMove(lshell, x_axis)
	Move(turret, z_axis, 0, 10)
	WaitForMove(turret, z_axis)
	Move(rbarrel, y_axis, 0, 15)
	Move(lbarrel, y_axis, 0, 15)
	WaitForMove(lbarrel, y_axis)
	WaitForMove(rbarrel, y_axis)
	
	on = true
end

local function Close()
    Signal(open)
	SetSignalMask(close)
	
	Sleep(150)
	Move(rbarrel, y_axis, 32, 15)
	Move(lbarrel, y_axis, 32, 15)
	WaitForMove(lbarrel, y_axis)
	WaitForMove(rbarrel, y_axis)
	Move(turret, z_axis, -10, 10)
	WaitForMove(turret, z_axis)
	Move(rshell, x_axis, -7.1, 5)
	Move(lshell, x_axis, 7.1, 5)
	WaitForMove(lshell, x_axis)
	
	GG.SetUnitArmor(unitID, armorValue)
end

function script.Activate()
	StartThread(Open)
end

function script.Deactivate()
	on = false
	StartThread(Close)
end

local function RestoreAfterDelay()
	Sleep(1000)
    
	Turn(barrel, x_axis, math.rad(0), 3)
	Turn(turret, z_axis, math.rad(0), 3)
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
    if on then
	    Signal(SIG_Aim)
	    SetSignalMask(SIG_Aim)
	
	    Turn(barrel, x_axis, -pitch, 3)
	    Turn(turret, z_axis, heading, 3)
	    WaitForTurn(barrel, x_axis)
	    WaitForTurn(turret, z_axis)
	    StartThread (RestoreAfterDelay)
	    return true
	else
	    return false
	end
end

function script.FireWeapon(num)
    if not shot then
	    Sleep(1)
	    shot = true
		Move(rbarrel, y_axis, 200, 200)
		Sleep(100)
		Move(rbarrel, y_axis, 0, 20)
	else
	    Sleep(1)
	    shot = false
		Move(lbarrel, y_axis, 200, 200)
		Sleep(100)
		Move(lbarrel, y_axis, 0, 20)
	end
end
