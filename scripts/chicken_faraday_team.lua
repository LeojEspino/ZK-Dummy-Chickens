
include "constants.lua"

local base = piece 'base'
local body = piece 'body'
local orb = piece 'orb'
local flare = piece 'flare'

local SIG_Aim = 2

function script.QueryWeapon(num)
	return flare
end

function script.AimFromWeapon(num)
	return orb
end

function script.AimWeapon(num, heading, pitch)
	Signal(SIG_Aim)
	SetSignalMask(SIG_Aim)

	return true
end

function script.Killed(recentDamage, maxHealth)
    return 1
end