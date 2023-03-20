
include "constants.lua"

local base = piece 'base'
local body = piece 'body'
local door1 = piece 'door1'
local door2 = piece 'door2'
local turret = piece 'turret'
local flare = piece 'flare'

local SIG_Aim = 2
local armorValue = UnitDefs[unitDefID].armoredMultiple

function script.Create()
    Turn(door1, y_axis, math.rad(-75), 2.5)
	Turn(door2, y_axis, math.rad(-75), 2.5)
	
    GG.SetUnitArmor(unitID, armorValue)
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

	return true
end

function script.FireWeapon(num)
    Turn(door1, y_axis, math.rad(0), 5)
	Turn(door2, y_axis, math.rad(0), 5)
	
	GG.SetUnitArmor(unitID, 1.0)
	Sleep(3500)
	Turn(door1, y_axis, math.rad(-75), 2.5)
	Turn(door2, y_axis, math.rad(-75), 2.5)
	
	GG.SetUnitArmor(unitID, armorValue)
end
