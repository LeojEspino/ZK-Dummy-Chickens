
include "constants.lua"

local bigbomb = piece 'bigbomb'

function script.Create()
    Sleep(5000)
	GG.QueueUnitDescruction(unitID)
end

function script.QueryWeapon(num)
	return bigbomb
end

function script.AimFromWeapon(num)
	return bigbomb
end

function script.AimWeapon(num, heading, pitch)
	return false
end