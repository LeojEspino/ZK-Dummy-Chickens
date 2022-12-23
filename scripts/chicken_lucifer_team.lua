
include "constants.lua"

local base = piece 'base'
local body = piece 'body'
local turret = piece 'turret'
local barrel = piece 'barrel'
local ring1 = piece 'ring1'
local ring2 = piece 'ring2'
local ring3 = piece 'ring3'
local ring4 = piece 'ring4'
local flare = piece 'flare'

local SIG_Aim = 2
local spGetUnitRulesParam = Spring.GetUnitRulesParam

function script.Create()
    Spin(ring1, y_axis, 1)
	Spin(ring2, y_axis, -1.5)
	Spin(ring3, y_axis, 2)
	Spin(ring4, y_axis, -2.5)
end

local function RestoreAfterDelay()
	Sleep(1000)
    
	Turn(barrel, x_axis, math.rad(0), 3)
	Turn(turret, z_axis, math.rad(0), 3)
end

function script.QueryWeapon(num)
	return flare
end

function script.AimFromWeapon(num)
	return barrel
end

function script.AimWeapon(num, heading, pitch)
    if spGetUnitRulesParam(unitID, "lowpower") == 1) then
	    return false
	else
	    Signal(SIG_Aim)
	    SetSignalMask(SIG_Aim)
	    
	    Turn(barrel, x_axis, -pitch, 6)
	    Turn(turret, z_axis, heading, 6)
	    WaitForTurn(barrel, x_axis)
	    WaitForTurn(turret, z_axis)
	    StartThread (RestoreAfterDelay)
	    return (spGetUnitRulesParam(unitID, "lowpower") == 0)
	end
end

function script.FireWeapon(num)
    Spin(ring1, y_axis, 5)
	Spin(ring2, y_axis, -10)
	Spin(ring3, y_axis, 15)
	Spin(ring4, y_axis, -20)
	Sleep(100)
	Spin(ring1, y_axis, 1)
	Spin(ring2, y_axis, -1.5)
	Spin(ring3, y_axis, 2)
	Spin(ring4, y_axis, -2.5)
end

function script.Killed(recentDamage, maxHealth)
    return 1
end