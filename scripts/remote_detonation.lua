
include "constants.lua"

local Cube = piece 'Cube'

function script.QueryWeapon(num)
	return Cube
end

function script.AimFromWeapon(num)
	return Cube
end

function script.AimWeapon(num, heading, pitch)
	return false
end