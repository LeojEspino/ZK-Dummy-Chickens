
include "constants.lua"

local base = piece 'base'
local body = piece 'body'
local lgun = piece 'lgun'
local rgun = piece 'rgun'
local missile = piece 'missile'
local lthruster = piece 'lthruster'
local rthruster = piece 'rthruster'

local SIG_Aim = 2
local shot = false

function script.QueryWeapon(num)
    if num == 1 then
	    if not shot then
	        return rgun
		elseif shot then
		    return lgun
		end
	end
	if num == 2 then
	    return missile
	end
end

function script.AimFromWeapon(num)
	return body
end

function script.AimWeapon(num, heading, pitch)
	return not (GetUnitValue(COB.CRASHING) == 1)
end

function script.FireWeapon(num)
    if num == 1 then
	    if not shot then
		    Sleep(1)
			shot = true
		elseif shot then
		    Sleep(1)
			shot = false
		end
	end
	if num == 2 then
	    Hide(missile)
		Sleep(15000)
		Show(missile)
	end
end