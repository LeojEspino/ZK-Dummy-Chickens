
include "constants.lua"

local base = piece 'base'
local body = piece 'body'
local lgun = piece 'lgun'
local rgun = piece 'rgun'
local lthruster = piece 'thruster'

local SIG_Aim = 2
local shot = false

function script.QueryWeapon(num)
	if not shot then
	    return rgun
    elseif shot then
        return lgun
    end
end

function script.AimFromWeapon(num)
	return body
end

function script.AimWeapon(num, heading, pitch)
	return not (GetUnitValue(COB.CRASHING) == 1)
end

function script.FireWeapon(num)
	if not shot then
		Sleep(1)
		shot = true
	elseif shot then
		Sleep(1)
		shot = false
	end
end