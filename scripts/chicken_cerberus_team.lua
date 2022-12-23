
include "constants.lua"

local base = piece 'base'
local body = piece 'body'
local turret = piece 'turret'
local sleeve = piece 'sleeve'
local barrel1 = piece 'barrel1'
local barrel2 = piece 'barrel2'
local barrel3 = piece 'barrel3'
local flare1 = piece 'flare1'
local flare2 = piece 'flare2'
local flare3 = piece 'flare3'

local shot1 = false
local shot2 = false
local spGetUnitRulesParam = Spring.GetUnitRulesParam

local SIG_Aim = 2

local function RestoreAfterDelay()
	Sleep(1000)
    
	Turn(sleeve, z_axis, math.rad(0), 3)
	Turn(turret, z_axis, math.rad(0), 3)
end

function script.QueryWeapon(num)
    if shot2 then
	    return flare3
	elseif shot1 then
	    return flare2
	else
	    return flare1
	end
end

function script.AimFromWeapon(num)
	return sleeve
end

function script.AimWeapon(num, heading, pitch)
    if spGetUnitRulesParam(unitID, "lowpower") == 1) then
	    return false
	else
	    Signal(SIG_Aim)
	    SetSignalMask(SIG_Aim)
	    
	    Turn(sleeve, z_axis, -pitch, 6)
	    Turn(turret, z_axis, heading, 6)
	    WaitForTurn(sleeve, z_axis)
	    WaitForTurn(turret, z_axis)
	    StartThread (RestoreAfterDelay)
	    return (spGetUnitRulesParam(unitID, "lowpower") == 0)
	end
end

function script.FireWeapon(num)
	Move(barrel1, y_axis, 150, 150)
	Sleep(130)
	shot1 = true
	Move(barrel1, y_axis, 0, 10)
	Move(barrel2, y_axis, 150, 150)
	Sleep(130)
	shot2 = true
	Move(barrel2, y_axis, 0, 10)
	Move(barrel3, y_axis, 150, 150)
	Sleep(130)
	shot1 = false
	shot2 = false
	Move(barrel3, y_axis, 0, 10)
end

function script.Killed(recentDamage, maxHealth)
    return 1
end